class Log < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :loggable, polymorphic: true, optional: true
end
