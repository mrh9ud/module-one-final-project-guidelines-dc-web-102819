class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    
    def self.questions_by_date_added

    end

    def self.all_questions
        question_array = Question.all.collect do |question|
            question.title
        end
        puts question_array.sort!
    end

    def self.find_by_title(title_name)

    end

    def self.find_question_by_tag(tag_name)

    end
end