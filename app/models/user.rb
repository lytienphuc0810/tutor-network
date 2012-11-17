class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :role, :subject, :recipe_id
  # attr_accessible :title, :body

  has_one :location
  has_one :rate
  belongs_to :rate
  has_one :user, :through => :rate
  has_many :tutor_posts
  has_many :customer_posts
  has_many :recipe
  has_one :user, :through => :recipe
  belongs_to :recipe
end
