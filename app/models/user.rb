class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  ajaxful_rater
  ajaxful_rateable :allow_update => true

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :gender, :address, :ward, :district, :city_province, :role, :confirmed_at

  self.per_page = 12

  validates_presence_of :username, :address, :ward, :district, :city_province, :role
  validates_uniqueness_of :username
  
  has_one :rate
  belongs_to :rate
  has_one :user, :through => :rate
  has_many :tutor_posts, :dependent => :destroy
  has_many :customer_posts, :dependent => :destroy
  has_many :owner_recipes, :class_name => "Recipe", :foreign_key => :owner_id
  has_many :other_recipes, :class_name => "Recipe", :foreign_key => :other_id
  has_one :user, :through => :recipe
  
  ATTRS = [:email, :username, :gender, :address, :ward, :district, :city_province]
  ROLES = [
    ADMIN = "admin",
    CUSTOMER = "customer",
    TUTOR = "tutor",
    MOD = "mod"
  ]

  validates :role, :inclusion => {:in => ROLES}
  validates :gender, :inclusion => {:in => %w( Male Female )}
  before_validation :default_role
  before_validation :default_gender

  ROLES.each do |role|
    # for selecting users based on given role
    scope role.pluralize.to_sym, where(:role => role)

    # for checking the given user has the given role or not
    # lay role tu #{role?}
    define_method("#{role}?") do
      self.role == role
    end   
  end

  searchable do
    text :email, :username, :gender, :address, :ward, :district, :city_province, :role
  end

  def self.mysearch params, role
    User.reindex
    User.search do
      fulltext role do
        fields(:role)
      end
      ATTRS.each do |element|
        if params[element]
          fulltext params[element] do
            fields(element)
          end
        end
      end
    end.results
  end 

  private
    def default_role
      self.role = CUSTOMER if self.role.blank?
    end

  private
    def default_gender
      self.gender = "Male" if self.gender.nil?
    end
end
