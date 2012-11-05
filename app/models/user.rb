class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :role, :subject, :rate_id, :recipe_id
  # attr_accessible :title, :body

  has_one :location
  has_one :rate
  belongs_to :rate
  has_one :user, :throught => :rate
  has_many :tutor_post
  has_many :customer_post
  has_many :recipe
  has_one :user, :throught => :recipe
  belongs_to :recipe
end
