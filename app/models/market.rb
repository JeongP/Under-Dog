class Market < ApplicationRecord
    belongs_to :user
    paginates_per 4
end
