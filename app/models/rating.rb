class Rating < ApplicationRecord
    belongs_to :rater, class_name: "User"
    belongs_to :user
    has_one :log, as: :loggable

    after_save :four_star_event?

    def create_log
        log = Log.new
        log.type_of = "Rating"
        log.description = "New 4 Star Rating! - #{self.rater.name} rated #{self.user_id} with #{self.rating} Stars!"
        log.rating = self.rating
        log.user_id = self.user_id
        log.loggable_id = self.id
        log.loggable_type = self.class.name
        log.posted_at = self.rated_at
        log.save
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

    def four_star_event?
        user_ratings_rated = Rating.all.map(&:to_json).select{ |r| r[:user_id] == self.user_id }.sort_by { |r| r[:rated_at] }
        prev_rating = ( user_ratings_rated.map { |r| r[:rating].to_i }.sum ) - ( self.rating )
        prev_count = user_ratings_rated.count.to_f - 1
        prev_average_rating = (prev_rating / prev_count).round(2)
        current_average = ( user_ratings_rated.map { |r| r[:rating].to_i }.sum )
        current_count = ( user_ratings_rated.count.to_f )
        average_rating = (current_average / current_count).round(2)
        if (average_rating >= 4.0 && prev_average_rating < 4.0)
            self.create_log
            puts '-----------------------------------'
            puts "4-Star Log Created: average_rating = #{average_rating} prev_average_rating = #{prev_average_rating}"
            puts '-----------------------------------'
        else
            puts '-----------------------------------'
            puts "No Log Created: average_rating = #{average_rating} prev_average_rating = #{prev_average_rating}"
            puts '-----------------------------------'
        end
    end
end
