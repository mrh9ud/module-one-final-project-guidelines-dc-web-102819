Question.destroy_all
Tag.destroy_all
QuestionTag.destroy_all
Answer.destroy_all

question1 = Question.create(title: "How to code with Ruby", body: "Hello, I'm a newbie.")
question2 = Question.create(title: "Difference between string and blob", body: "Why will .blob not function in SQLite3?")
question3 = Question.create(title: "Confused about SQLite3", body: "How to implement has-many relationships in Ruby for SQL")
question4 = Question.create(title: "SQL Join Tables", body: "What are some shortcuts for ORM for SQL in Ruby")
question5 = Question.create(title: "What is a gem file", body: "Which are the most useful gems to use in Ruby and how do they work")

Answer.create(title: "Here's something that might help", body: "Hello newbie, you can check the ruby docs and tutorials link: https://ruby-doc.org/", question_id: question1.id)
Answer.create(title: "Here you go", body: "You may want to try some tutorials for free on Google", question_id: question1.id)
Answer.create(title: "Sql data types", body: "SQLite3 will not support the blob data type. You will need to use the full version of the program", question_id: question2.id)
Answer.create(title: "Drawing it out", body: "You can use some shortcut macros, but I would recommend first drawing the relationships out to figure out which foreign keys you will be using", question_id: question3.id)
Answer.create(title: "You'll have to be more specific", body: "This topic is quite broad, and I'm not sure how to address your question without referring you to the general SQL docs", question_id: question3.id)
Answer.create(title: "SQLite3 Join Table Macros", body: "I know of a few macros: belongs_to :class_name, has_many :class_name, etc.", question_id: question4.id)
Answer.create(title: "Thoughts on Join Tables", body: "You can try .methods or .help to get a list of useful commands that you can use in SQLite3", question_id: question4.id)
Answer.create(title: "Important Gem Files", body: "Some of the most important gem files will be Pry, ActiveRecord, Bundler, etc.", question_id: question5.id)

