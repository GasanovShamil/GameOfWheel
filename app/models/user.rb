class User < ApplicationRecord
  after_create :assign_default_role

  before_create do |user|
  	user.tokens = 100
  end
  
  has_many :user_rooms
  has_many :rooms, through: :user_rooms

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
  
  def assign_default_role
    self.add_role(:default) if self.roles.blank?
  end
end