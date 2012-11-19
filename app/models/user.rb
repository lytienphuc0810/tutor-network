class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :address, :street, :ward, :district, :city_province, :role, :confirmed_at
  # attr_accessible :title, :body

  validates :username, :password, :address, :street, :ward, :district, :city_province, :role, :presence => true
  has_one :rate
  belongs_to :rate
  has_one :user, :through => :rate
  has_many :tutor_posts
  has_many :customer_posts
  has_many :owner_recipes, :class_name => "Recipe", :foreign_key => :owner_id
  has_many :others_recipes, :class_name => "Recipe", :foreign_key => :others_id
  has_one :user, :through => :recipe
  self.per_page = 12

  ROLES = [
    ADMIN = "admin",
    CUSTOMER = "customer",
    TUTOR = "tutor"
  ]

  before_validation :default_role
  # validates :username, :role, :presence => true
  # validates :username, :uniqueness => true
  validates :role, :inclusion => {:in => ROLES}

  ROLES.each do |role|
    # for selecting users based on given role
    scope role.pluralize.to_sym, where(:role => role)

    # for checking the given user has the given role or not
    # lay role tu #{role?}
    define_method("#{role}?") do
      self.role == role
    end   
  end
   
  private
    def default_role
      self.role = CUSTOMER if self.role.blank?
    end
end
