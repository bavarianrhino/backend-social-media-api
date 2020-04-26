class Rating < ApplicationRecord
    belongs_to :rater, class_name: "User"
    belongs_to :user
    has_one :log, as: :loggable
end
