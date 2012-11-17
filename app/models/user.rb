class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :role
  # attr_accessible :title, :body

  has_one :location
  has_one :rate
  belongs_to :rate
  has_one :user, :through => :rate
  has_many :tutor_posts
  has_many :customer_posts
  has_many :tutor_recipes, :class_name => "Recipe", :foreign_key => :tutor_id
  has_many :customer_recipes, :class_name => "Recipe", :foreign_key => :customer_id
  has_one :user, :through => :recipe
end
