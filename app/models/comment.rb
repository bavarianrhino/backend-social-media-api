class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy

    after_save :create_log

    def create_log
        log = Log.new
        log.description = "New Comment -  #{self.message}"
        log.type_of = "Comment"
        log.user_id = self.user_id
        log.loggable_id = self.id
        log.loggable_type = self.class.name
        log.posted_at = self.commented_at
        log.save
    end
end
