class User < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy
end