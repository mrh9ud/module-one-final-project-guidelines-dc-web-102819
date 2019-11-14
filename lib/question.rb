class Question < ActiveRecord::Base
    USE_ARTII = Artii::Base.new
    has_many :answers
    has_many :question_tags
    has_many :tags, through: :question_tags
    
    def self.questions_by_date_added
        question_dates = Question.order(:created_at)
        puts "\n"
        question_dates.each do |question|
            question_title = question.title
            question_date = question.created_at.to_s
            puts question_title + '   ' + question_date
        end
    end

    def self.all_questions
        question_array = Question.all.collect do |question|
            question.title
        end
        puts "\n"
        puts question_array.sort!
    end

    def self.find_by_title(question_title)
        question = Question.find_by title: question_title
        if question.nil?
            puts "\nQuestion doesn't exist! Try Again!"
            puts "If you can't figure out a question name, press escape"      
            CLI.question_search
        else
            puts "\n"
            puts USE_ARTII.asciify(question.title)
        end
    end

    def self.find_question_by_tag(tag_name)
        
        binding.pry
    end
end