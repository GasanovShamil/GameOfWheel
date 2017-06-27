class PrizeCategory < ApplicationRecord
  belongs_to :prize
  belongs_to :category
end
