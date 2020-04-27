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
            ratings: self.ratings.all_json,
            logs: self.logs.all_json
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
                puts JSON.parse(response)
            rescue RestClient::ExceptionWithResponse => err
                []
            else
                events = JSON.parse(response).select do |event|
                    (["PushEvent", "CreateEvent"].include? (event["type"]))
                end
                puts events
            end
        else
        end
    def
end