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
        log.posted_at = self.posted_at
        log.save
    end

    def to_json
        {
            post_number: self.id,
            title: self.title,
            body: self.body,
            user_id: self.user_id,
            comments: self.comments.all_json
        }
    end
    
    def self.all_json
        Post.all.collect(&:to_json)
    end
end
