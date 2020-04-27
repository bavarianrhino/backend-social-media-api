class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy

    after_save :user_average_rating
    after_save :create_github_log

    def user_average_rating
        if self.ratings.count > 0
            self.ratings.map { |rating| rating.rating }.sum / self.ratings.count.to_f ).round(3)
        else
            0
    end

    def github_logs
        # if (self.github_username != nil)
    end
end