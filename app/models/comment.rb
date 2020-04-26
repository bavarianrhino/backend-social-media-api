class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post, dependent: :destroy
    has_one :log, as: :loggable, dependent: :destroy
end
