#encoding: UTF-8
User.delete_all
Location.delete_all
CustomerPost.delete_all
TutorPost.delete_all

user0 = User.create( :email => "admin@gmail.com", :password => "123456",:username => "admin", :gender => "Male", :role => "admin", :confirmed_at => Time.now,:address => "142 Lý Thường Kiệt", :ward => "5", :district => "10",:city_province => "Hồ Chí Minh")
user1 =	User.create( :email => "tutor@gmail.com", 
					 :password => "123456",
					 :username => "Lê Thị Hồng Nhung", 
					 :gender => "Female", 
					 :role => "tutor",
					 :confirmed_at => Time.now,
					 :address => "10 Nguyễn Trãi", 
					 :ward => "2", 
					 :district => "3",
					 :city_province => "Đà Nẵng")
user2 =	User.create( :email => "tutor2@gmail.com", 
					 :password => "123456",
					 :username => "Nguyễn Văn Minh", 
					 :gender => "Male", 
					 :role => "tutor",
					 :confirmed_at => Time.now,
					 :address => "210 Lê Hồng Phong", 
					 :ward => "6", 
					 :district => "5",
					 :city_province => "Hồ Chí Minh"
					 )
user3 = User.create( :email => "customer@gmail.com", 
					 :password => "123456", 
					 :username => "Trần Thị Kim Chi", 
					 :gender => "Female", 
					 :role => "customer",
					 :confirmed_at => Time.now,
					 :address => "56 Huỳnh Văn Bánh",
					 :ward => "9", 
					 :district => "Tân Bình",
					 :city_province => "Hồ Chí Minh"
					 )
user4 = User.create( :email => "customer2@gmail.com", 
					 :password => "123456", 
					 :username => "Đinh Văn Hùng", 
					 :gender => "Male", 
					 :role => "customer",
					 :confirmed_at => Time.now,
					 :address => "249 Phạm Ngũ Lão",
					 :ward => "1", 
					 :district => "1",
					 :city_province => "Hà Nội"
					 )

cpost0 = CustomerPost.create(
					 :district => "Tân Bình",
					 :city_province => "Hồ Chí Minh",:tutor_fee => "300 000/tháng", :experience => "2 năm", :content => "Con gái tui hiện đang học Lớp 9, kiến thức môn Lý của nó hơi ko vững, cần một gia sư nữ kèm cặp cho em có nền tảng vững vàng lại, để em có thể yên tâm thi cuối cấp. Lương ở trên có thể bàn bạc lại", :subject => "physics")
cpost1 = CustomerPost.create(
					 :district => "1",
					 :city_province => "Hà Nội",:tutor_fee => "250 000/tháng", :experience => "nữa năm hoặc hơn", :content => "Cháu trai tui năm nay học lớp 5, đang cần người kèm cặp môn toán để cháu nó thi chuyển cấp, vào được trường tốt.", :subject => "math")

tpost0 = TutorPost.create(
					 :district => "5",
					 :city_province => "Hồ Chí Minh",:tutor_fee => "400 000/tháng", :experience => "3 năm", :content => "Tôi là Nguyễn Văn Minh, hiện là sinh viên năm 4 trường đại học Bách Khóa TPHCM, khoa Hóa, chuyên ngành Dầu Khí. Tôi tốt nghiệp trường THPT chuyên Lê Hồng Phong, chuyên Hóa. Tôi đã làm gia sư được 3 năm, hiện tại tôi vẫn muốn tiếp tục dạy thêm để có thể duy trì, trau dồi những kiến thức từ thời Phổ Thông. Cần nhận học viên trong khu vực Quận 5.", :subject => "chemistry")
tpost1 = TutorPost.create(
					 :district => "3",
					 :city_province => "Đà Nẵng",:tutor_fee => "Thương lượng", :experience => "chưa có", :content => "Chào mợi người, em là Nhung, hiện tại là sinh viên năm nhất trường Đại Học Khoa Học Xã Hội và Nhân Văn Đà Nẵng. Không chỉ có mỗi lý, em cũng có thể dạy thêm các môn khác như toán, anh, v.v... Là lính mới, nên em còn chưa có kinh nghiệm, mong mọi người chiếu cố, cám ơn ^.^", :subject => "physics")

user2.tutor_posts = [tpost0]
user1.tutor_posts = [tpost1]
user3.customer_posts = [cpost0]
user4.customer_posts = [cpost1]
