# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#---------------------------------------------------------------------------
#Delete all
#---------------------------------------------------------------------------
User.delete_all
Location.delete_all
CustomerPost.delete_all
TutorPost.delete_all

#---------------------------------------------------------------------------
#create data
#---------------------------------------------------------------------------
user0 = User.create( :email => "tuan@trinhcao.com", 
					 :password => "123456",
					 :username => "tuan", 
					 :gender => true, 
					 :role => "admin")
user1 =	User.create( :email => "tutor@example.com", 
					 :password => "456789",
					 :username => "tutor1", 
					 :gender => false, 
					 :role => "tutor",
					 :subject => "math")
user2 =	User.create( :email => "tutoragain@example.com", 
					 :password => "987654",
					 :username => "tutor2", 
					 :gender => true, 
					 :role => "tutor",
					 :subject => "physics")
user3 = User.create( :email => "mother@example.com", 
					 :password => "123456789", 
					 :username => "mother", 
					 :gender => false, 
					 :role => "user")

loc0 =  Location.create( :address => "123 Ly Thuong Kiet", 
			             :ward => "10", 
			             :city_district => "Quan 10, Ho Chi Minh")

loc1 =	Location.create( :address => "1 Nguyen Trai", 
			             :ward => "5", 
			             :city_district => "Quan 5, Ho Chi Minh")

loc2 =	Location.create( :address => "57 Tran Hung Dao", 
			             :ward => "6", 
			             :city_district => "Quan 1, Ho Chi Minh")

loc3 =	Location.create( :address => "89 Nguyen Thi Thap", 
			             :ward => "Tan Phong", 
			             :city_district => "Quan 7, Ho Chi Minh")

cpost0 = CustomerPost.create(:content => "Phuc dan ba dang can tim nguoi day cho con de cua anh ay")

tpost0 = TutorPost.create(:content => "Quy su phu dang can tim de tu de truyen nghe Kamezoko No.2")


#==========================================================================================
#Associations
#==========================================================================================

user0.location = loc0
user1.location = loc1
user2.location = loc2
user3.location = loc3

user2.tutor_posts = [tpost0]
user3.customer_posts = [cpost0]