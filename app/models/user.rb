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

   protected

   def serializable_hash(options = nil) 
    super(options).merge(last_sign_in_at: last_sign_in_at, current_sign_in_at: current_sign_in_at) # you can keep adding attributes here that you wish to expose
  end
end