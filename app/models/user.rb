class User < ApplicationRecord
  before_create do |user|
  	user.tokens = 100
  end
  validates :username, presence: true, uniqueness: true
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end