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
user0 = User.create( :email => "admin@gmail.com", 
					 :password => "123456",
					 :username => "tuan", 
					 :gender => true, 
					 :role => "admin", 
					 :confirmed_at => Time.now)
user1 =	User.create( :email => "tutor@gmail.com", 
					 :password => "123456",
					 :username => "tutor1", 
					 :gender => false, 
					 :role => "tutor",
					 :confirmed_at => Time.now)
user2 =	User.create( :email => "tutoragain@example.com", 
					 :password => "123456",
					 :username => "tutor2", 
					 :gender => true, 
					 :role => "tutor",
					 :confirmed_at => Time.now
					 )
user3 = User.create( :email => "customer@gmail.com", 
					 :password => "123456", 
					 :username => "customer", 
					 :gender => false, 
					 :role => "customer",
					 :confirmed_at => Time.now
					 )
user4 = User.create( :email => "customer2@gmail.com", 
					 :password => "123456", 
					 :username => "customer2", 
					 :gender => false, 
					 :role => "customer",
					 :confirmed_at => Time.now
					 )

loc0 =  Location.create( :address => "123 Ly Thuong Kiet", 
			             :ward => "10", 
			             :district => "10",
			             :city_province => "Ho Chi Minh")

loc1 =	Location.create( :address => "1 Nguyen Trai", 
			             :ward => "5", 
			             :district => "5",
			             :city_province => "Ho Chi Minh")

loc2 =	Location.create( :address => "57 Tran Hung Dao", 
			             :ward => "6", 
			             :district => "1",
			             :city_province => "Ho Chi Minh")

loc3 =	Location.create( :address => "89 Nguyen Thi Thap", 
			             :ward => "Tan Phong", 
			             :district => "7",
			             :city_province => "Ho Chi Minh")

loc4 =	Location.create( :address => "8 Nguyen Trai", 
			             :ward => "1", 
			             :district => "1",
			             :city_province => "Ho Chi Minh")

cpost0 = CustomerPost.create(:content => "Phuc thot dang can tim nguoi day cho con de cua anh ay", :subject => "Toan")
cpost1 = CustomerPost.create(:content => "Phuc thot dang can tim nguoi day cho asdasdas sdasd ruyiou oiuasoduouowej oiuoasd uoijlkwej oiausdo joqiwheoiqulasdjqoiwd oidaossdhjwjefhsjdh wifh sjdhff sjdhfioweufh isd ksdjhf aisfehawpioefh sadihf kasdf hpeiwrh wpeoifsdovih we fshdpfoisudf  oif pasdoiifh wklef apsdoifuaweoi f h aosdffkjhsd gggggcon de cua anh ay", :subject => "Toan")

cpost2 = CustomerPost.create(:content => "Call me Maybe", :subject => "Ly")
cpost3 = CustomerPost.create(:content => "Hey, I just met you, And this is crazy, But here's my number, So call me, maybe? It's hard to look right, At you baby, But here's my number, So call me, maybe?", :subject => "Ly")

tpost0 = TutorPost.create(:content => "Quy su phu dang can tim de tu de truyen nghe Kamezoko No.2", :subject => "Toan")
tpost1 = TutorPost.create(:content => "Quy su phu dang can tim de tu de truyen nghe Kamezoko No.2 dsfjsd jfklsdjfsdklfjkld dfnjsdkf jsdkfjksdfklsdlf jsdl fjlsd jfsdjklfjsdkljfsdjf sdjflksdjfsdkl jflsdjfkljsdklf sd jfklsd jfksdfksl fjsjd fklsdklf jlsdflsdkfsdklfjsjdk lf sdlfjkl", :subject => "Toan")


#==========================================================================================
#Associations
#==========================================================================================

user0.location = loc0
user1.location = loc1
user2.location = loc2
user3.location = loc3
user4.location = loc4

user2.tutor_posts = [tpost0]
user1.tutor_posts = [tpost1]
user3.customer_posts = [cpost0, cpost1]
user4.customer_posts = [cpost2, cpost3]
