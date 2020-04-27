class Rating < ApplicationRecord
    belongs_to :rater, class_name: "User"
    belongs_to :user
    has_one :log, as: :loggable

    after_save :four_start_event?

    def create_log
        log = Log.new
        log.description = "New 4 Star Rating! - Rater_id #{self.rater_id} rated User_id #{self.user_id}"
        log.type_of = "Rating"
        log.user_id = self.user_id
        log.loggable_id = self.id
        log.loggable_type = self.class.name
        log.posted_at = self.rated_at
        log.save
        puts log
    end

    def to_json
        {
            user_id: self.user_id,
            rater_id: self.rater_id,
            rating: self.rating,
            rated_at: self.rated_at,
        }
    end
    
    def self.all_json
        Rating.all.collect(&:to_json)
    end

    def user_ratings
        user_ratings = Rating.all.map(&:to_json).select{ |r| r[:user_id] == self.user_id }
        
    end

    def four_start_event?
        user_average = Rating.all.map(&:to_json).select{ |r| r[:user_id] == self.user_id }.sort_by { |r| r[:rated_at] }
        prev_average_rating = ( (user_average.map { |r| r[:rating].to_i }.sum - self.rating) / user_average.count.to_f - 1 ).round(1)
        current_average_rating = ( user_average.map { |r| r[:rating].to_i }.sum / user_average.count.to_f ).round(1)
        if (current_average_rating >= 4.0 && prev_average_rating < 4.0)
            self.create_log
        else
            self.create_log
        end
    end
end
