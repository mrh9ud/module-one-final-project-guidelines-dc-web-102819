class Answer < ActiveRecord::Base
  belongs_to :question
  
  USE_ARTII = Artii::Base.new
  PROMPT = TTY::Prompt.new

  def self.sorted_by_title
    puts "\n"
    puts "|ID___________| TITLE "
    sort_by_name = Answer.order(:title)
    sort_by_name.collect do |answer|
      id = answer.id.to_s
      title = answer.title
      puts "|"+id + "           | " + title
    end
  end

  def self.sorted_by_date
    sort_by_date = Answer.order(:created_at)
    sort_by_date.collect do |answer|
      answer_title = answer.title
      answer_date = answer.created_at.to_s
      puts "\n" + answer_title + "\n" + "Posted on:  " + answer_date
    end
  end

  def self.sorted_by_body
    sort_by_body = Answer.order(:body)
    sort_by_body.collect do |answer|
      puts "\n" + answer.body
    end
  end

  def self.find_by_title(title_to_search)
    question_to_find = Answer.find_by title: title_to_search
    if question_to_find.nil?
      puts "\n"
      keep_searching = PROMPT.yes?("No result found. Would you like to keep searching?")
      if keep_searching
        CLI.answer_search_by_title
      else
        CLI.answer_menu
      end
    else
      puts question_to_find.title
    end
  end
end
