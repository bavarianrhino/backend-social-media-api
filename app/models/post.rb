class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy

    after_save :create_log

    def create_log
        log = Log.new
        log.description = "New Post #{self.title}"
        log.type_of = "Post"
        log.user_id = self.user_id
        log.loggable_id = self.id
        log.loggable_type = self.class.name
        log.posted_at = self.created_at
        log.save
    end
end
