class Answer < ActiveRecord::Base
    belongs_to :question
    USE_ARTII = Artii::Base.new


    # id,  title, body, question_id, creted_at
    def self.sorted_by_title
      puts "\n"
      puts "| ID ________| TITLE "
      sort_by_name = Answer.order(:title)
      sort_by_name.collect do |answer|
        id = answer.id.to_s
        title = answer.title
        puts "|"+id + "           | " + title
      end
    end

    def self.sorted_by_date
      puts "\n"
      sort_by_date = Answer.order(:created_at)
      puts "Title             Date"
      sort_by_date.collect do |answer|
        answer_title = answer.title
        answer_date = answer.created_at.to_s
        puts answer_title + " posted on: " + answer_date
      end
    end

    def self.sorted_by_body
      puts "\n"
      sort_by_body = Answer.order(:body)
      sort_by_body.collect do |answer|
        puts answer.body
      end
    end

    def self.find_by_title(title_to_search) #later add the parameter
      question_to_find = Answer.find_by title: title_to_search
      if question_to_find.nil?
        puts "\n Answer doesn't exist. Try again!"
        CLI.answer_search_by_title
        if question_to_find.nil?
          puts "\n Answer doesn't exist. Taking you to previous menu."
        end
      else
        # CLI.answer_search_by_title
        puts question_to_find.title
      end
    end
end
