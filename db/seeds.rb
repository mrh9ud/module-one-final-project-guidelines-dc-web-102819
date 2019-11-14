Question.destroy_all
Tag.destroy_all
QuestionTag.destroy_all
Answer.destroy_all

question1 = Question.create(title: "How to code with Ruby?", body: "Hello, I'm a newbie.")
question2 = Question.create(title: "Difference between string and blob?", body: "Why will .blob not function in SQLite3?")
question3 = Question.create(title: "Confused about SQLite3?", body: "How to implement has-many relationships in Ruby for SQL")
question4 = Question.create(title: "SQL Join Tables?", body: "What are some shortcuts for ORM for SQL in Ruby")
question5 = Question.create(title: "What is a gem file?", body: "Which are the most useful gems to use in Ruby and how do they work")

Answer.create(title: "Here's something that might help", body: "Hello newbie, you can check the ruby docs and tutorials link: https://ruby-doc.org/", question_id: question1.id)
Answer.create(title: "Here you go", body: "You may want to try some tutorials for free on Google", question_id: question1.id)
Answer.create(title: "Sql data types", body: "SQLite3 will not support the blob data type. You will need to use the full version of the program", question_id: question2.id)
Answer.create(title: "Drawing it out", body: "You can use some shortcut macros, but I would recommend first drawing the relationships out to figure out which foreign keys you will be using", question_id: question3.id)
Answer.create(title: "You'll have to be more specific", body: "This topic is quite broad, and I'm not sure how to address your question without referring you to the general SQL docs", question_id: question3.id)
Answer.create(title: "SQLite3 Join Table Macros", body: "I know of a few macros: belongs_to :class_name, has_many :class_name, etc.", question_id: question4.id)
Answer.create(title: "Thoughts on Join Tables", body: "You can try .methods or .help to get a list of useful commands that you can use in SQLite3", question_id: question4.id)
Answer.create(title: "Important Gem Files", body: "Some of the most important gem files will be Pry, ActiveRecord, Bundler, etc.", question_id: question5.id)

tag1 = Tag.create(name: "Ruby")
tag2 = Tag.create(name: "SQLite3")
tag3 = Tag.create(name: "Programming")
tag4 = Tag.create(name: "ORMs")
tag5 = Tag.create(name: "Beginner")
tag6 = Tag.create(name: "Ruby Gems")
tag7 = Tag.create(name: "Data Types")
tag8 = Tag.create(name: "Macros")
tag9 = Tag.create(name: "Blobs")


QuestionTag.create(question_id: question1.id, tag_id: tag1.id)
QuestionTag.create(question_id: question1.id, tag_id: tag5.id)
QuestionTag.create(question_id: question1.id, tag_id: tag3.id)
QuestionTag.create(question_id: question2.id, tag_id: tag2.id)
QuestionTag.create(question_id: question2.id, tag_id: tag7.id)
QuestionTag.create(question_id: question2.id, tag_id: tag9.id)
QuestionTag.create(question_id: question3.id, tag_id: tag2.id)
QuestionTag.create(question_id: question3.id, tag_id: tag4.id)
QuestionTag.create(question_id: question4.id, tag_id: tag1.id)
QuestionTag.create(question_id: question4.id, tag_id: tag8.id)
QuestionTag.create(question_id: question5.id, tag_id: tag1.id)
QuestionTag.create(question_id: question5.id, tag_id: tag3.id)
QuestionTag.create(question_id: question5.id, tag_id: tag6.id)