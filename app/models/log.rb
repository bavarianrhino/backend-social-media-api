class Log < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :loggable, polymorphic: true, optional: true

    def to_json
        {
            type_of: self.type_of,
            description: self.description,
            loggable_type: self.loggable_type,
            loggable_id: self.loggable_id,
            posted_at: self.posted_at,
            created_at: self.created_at,
            updated_at: self.updated_at,
            user_id: self.user_id
        }
    end

    # def user_json
    #     {
    #         posts: self.posts.order(posted_at: :asc).all_json,
    #         comments: self.comments.order(commented_at: :asc).all_json
    #     }
    # end
    
    def self.all_json
        Log.all.order(posted_at: :desc).collect(&:to_json)
    end
end
