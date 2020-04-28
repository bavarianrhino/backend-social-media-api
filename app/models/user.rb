class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    # has_one :log, as: :loggable, dependent: :destroy
    has_many :logs

    after_save :user_average_rating
    after_save :create_github_logs

    def user_average_rating
        if self.ratings.count > 0
            ( self.ratings.map { |rating| rating.rating }.sum / self.ratings.count.to_f ).round(1)
        else
            0
        end
    end

    def to_json
        {
            email: self.email,
            name: self.name,
            github_username: self.github_username,
            registered_at: self.registered_at,
            rating: self.user_average_rating,
            github: self.create_github_logs
            logs: self.logs.all_json,
            ratings: self.ratings.all_json,
        }
    end

    def self.all_json
        User.all.collect(&:to_json)
    end

    def create_github_logs
        if (self.github_username != nil)
            base_url = "https://api.github.com/users/#{self.github_username}/events"
            begin
                response = RestClient.get(base_url)
            rescue RestClient::ExceptionWithResponse => err
                []
            else
                response = JSON.parse(response).select do |gitlog|
                    if (["PushEvent", "CreateEvent"].include? (gitlog["type"]))
                        log = Log.find_by(github_event_id: gitlog['id']) || Log.new
                        log.type_of = gitlog['type']
                        log.description = "Pushed/Created #{gitlog['type']} was made for #{gitlog['repo']['name']} with #{gitlog['payload']['size']} commit(s) to #{gitlog['repo']['name']}."
                        log.github_event_id = gitlog['id']
                        log.loggable_id = self.id
                        log.loggable_type = 'Github Log'
                        log.posted_at = gitlog['created_at']
                        log.user_id = self.id
                        log.save
                        puts log.values
                    else
                        puts gitlog.values
                    end
                end
            end
        end
    end
end