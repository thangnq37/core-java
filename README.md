# core-java
documents

 	Exam Question – Professional Test
Number:  #01
Test topic: Java01 Practice
Test duration: 180 minutes
Test guides: develop an application as described below, package your outputs (the required ones are listed as below) into a zip file (named as “Java_Final Test_YouAccountName.zip”) and copy to the pre-defined server folder (provided by the test supervisor)
1.	Full source codes; the codes should be prepared and built on JDK, Eclipse, and should include all files necessary to build
2.	Main screen shots of your own written application
3.	Comments (and Design diagrams, if any) to explain the design decisions made (use a separate covering note if necessary)
Project description:
I.	Yêu cầu 1:
Học viên hãy viết chương trình có các class để thể hiện 3 loại ứng viên (Candidate) khác nhau:
Ứng viên có kinh nghiệm (Experience_candidate), Ứng viên mới tốt nghiệp (Fresher_ candidate) , Sinh viên thực tập (Intern_ candidate)
Tất cả các Candidate đều có các thuộc tính là: FirstName, LastName, BirthDate, Address, Phone, Email, Candidate_type.
	Lưu ý: Candidate_type có giá trị tương ứng là (0: Experience_, 1: Fresher_ candidate , 2: Intern_ candidate)
Experience_candidate có thêm thuộc tính: Số năm kinh nghiệm (ExpInYear), Kỹ năng chuyên môn (ProSkill)
Fresher_candidate có thêm thuộc tính: Thời gian tốt nghiệp(Graduation_date), Xếp loại tốt nghiệp (Graduation_rank) , trường tốt nghiệp (Education)
Intern_ candidate: Chuyên ngành đang học (Majors), Học kì đang học (Semester), tên trường đang học (University_name)
Bạn hãy viết chương trình cho phép nhập thông tin cho các ứng viên, thông tin các ứng viên được lưu vào Data Base.
Yêu cầu chương trình phải kiểm tra được hợp lệ của các thuộc tính: BirthDate, Phone, Email, ExpInYear, Graduation_rank.
	BirthDate : 4 chữ số nguyên(1900..Current Year)
	Phone: Tối thiểu 7 chữ số nguyên dương
	Email: đúng định dạng email.
ExpInYear : Số nguyên (0..100)
Graduation_rank: 4 giá trị (Excellence, Good, Fair, Poor)
Sau khi nhập xong các ứng viên, chương trình hiển thị danh sách ứng viên với đầy đủ thông tin đã có trong data base.
II.	Yêu Cầu 2:
Công ty FPT software có các chương trình tuyển dụng(Recruitment) hàng tháng để tuyển các ứng viên phù hợp.
Mỗi đợt tuyển dụng có thông tin như sau: Mã tuyển dụng(Recruitment_code), vị trí tuyển dụng (position),  gói tuyển dụng (Recruitment_package).
Các thông tin của chương trình tuyển dụng này đều lưu vào table Recruitment  trong Data Base: Mã tuyển dụng (5 chữ số), vị trí tuyển dụng (một trong 3 loại: Dev, Test, Others), gói tuyển dụng (một trong 3 loại A, B, C), số lượng ứng viên ứng tuyển (khởi tạo là 0) . 
Bạn hãy tạo 10 records trong table Recruitment. Quy định mỗi gói tuyển dụng phù hợp cho l loại ứng viên như sau:
Recruitment Package	Cho loại ứng viên  (Candidate)
A	Experience_candidate
B	Fresher_ candidate
C	Intern_ candidate
			Table 1 : Mô tả các Recruitment Package
Trên giao diện, chương trình phải cho phép người dùng chọn một ứng viên bất kì và ứng tuyển vào một đợt tuyển dụng bất kì, nếu ứng viên phù hợp với gói tuyển dụng đã chọn (tham khảo mô tả ở table 1)  thì chương trình thông báo message “Submitted this candidate successfully”, đồng thời cập nhật cho gói tuyển dụng vừa chọn với lượng ứng viên ứng tuyển tăng  lên 1. Nếu ứng viên không phù hợp thì chương trình thông báo message “This candidate not matching”
Technical Requirements:
1. Using Object-Oriented programming style.
2. Use only core Java functions and classes.
3. Naming using Java coding convention, you are provided this document.
4. Remember to comment each class, methods, and members.
5. Your application can be Console/Winform application/Web use jsp/servelet
6. Use JDBC for working with the database; the SQL server as the database for the application
 
-  THE END  -

