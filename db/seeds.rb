# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(name: 'Admin', email: 'admin@kreeti.com', password: 'password', password_confirmation: 'password', admin_user: 'true', phone: '9876543210')
user1 = User.create(name: 'Demo1', email: 'demo1@kreeti.com', password: 'password', password_confirmation: 'password', qualification: 'BTech', college: 'Meghnad Saha', stream: 'CSE', phone: '9874695816')
user2 = User.create(name: 'Demo2', email: 'demo2@kreeti.com', password: 'password', password_confirmation: 'password', qualification: 'MTech', college: 'Heritage', stream: 'ECE', phone: '9434180763')
user3 = User.create(name: 'Demo3', email: 'demo3@kreeti.com', password: 'password', password_confirmation: 'password', qualification: 'NoTech', college: 'IEM', stream: 'CSE', phone: '9434187687')
user4 = User.create(name: 'Demo4', email: 'demo4@kreeti.com', password: 'password', password_confirmation: 'password', qualification: 'MTech', college: 'Techno India', stream: 'IT', phone: '9877695016')

exam1 = Exam.create(exam_name: 'Rails')
exam2 = Exam.create(exam_name: 'Grails')
exam3 = Exam.create(exam_name: 'React')
exam4 = Exam.create(exam_name: 'Redux')

question1Exam1 = Question.create(exam_id: exam1.id , question_description: "This is a sample question")
question2Exam1 = Question.create(exam_id: exam1.id , question_description: "This is a sample question")
question3Exam1 = Question.create(exam_id: exam1.id , question_description: "This is a sample question")
question1Exam2 = Question.create(exam_id: exam2.id , question_description: "This is a sample question")
question1Exam3 = Question.create(exam_id: exam3.id , question_description: "This is a sample question")

result1 = Result.create(user_id: user1.id , exam_id: exam1.id , marks: "21", results: "Pass", comments:"Please upload a pdf to check the working of answersheet in update")
result2 = Result.create(user_id: user1.id , exam_id: exam2.id , marks: "11", results: "Fail", comments:"Please upload a pdf to check the working of answersheet in update")
result3 = Result.create(user_id: user2.id , exam_id: exam1.id , marks: "10", results: "Fail", comments:"Please upload a pdf to check the working of answersheet in update")
result4 = Result.create(user_id: user3.id , exam_id: exam1.id , marks: "18", results: "Pass", comments:"Please upload a pdf to check the working of answersheet in update")
result5 = Result.create(user_id: user1.id , exam_id: exam1.id )
