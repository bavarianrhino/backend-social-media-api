class Rating < ApplicationRecord
    belongs_to :rater, class_name: "User"
    belongs_to :user
    has_one :log, as: :loggable

    after_save :create_log

    def create_log
        log = Log.new
        log.description = "New Rating - Rater_id #{self.rater_id} rated User_id #{self.user_id}"
        log.type_of = "Rating"
        log.user_id = self.user_id
        log.loggable_id = self.id
        log.loggable_type = self.class.name
        log.posted_at = self.created_at
        log.save
    end
end
