class CheckValidator < ActiveModel::Validator
  def validate(record)
    if record.user.tokens < record.room.share_price
      record.errors[:base] << "Pas assez de jetons"
    end
  end
end

class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_with CheckValidator
end
