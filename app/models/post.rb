class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy
end
