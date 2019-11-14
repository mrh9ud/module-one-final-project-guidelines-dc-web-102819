class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :tags, through: :question_tags
    
    USE_ARTII = Artii::Base.new
    PROMPT = TTY::Prompt.new
    
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
            puts "\n"
            keep_searching = PROMPT.yes?("No result found. Would you like to continue searching?")
            if keep_searching
                CLI.question_search
            else
                CLI.question_menu
            end
        else
            puts "\n"
            puts question.title
        end
    end

    def self.find_question_by_tag(tag_name)
        
        binding.pry
    end
end