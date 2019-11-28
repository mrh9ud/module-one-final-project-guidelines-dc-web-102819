class User < ActiveRecord::Base
    has_many :questions

    PROMPT = TTY::Prompt.new

    def self.create_user(username)
        User.create(name: username.downcase)
    end

    def self.user_question_prompt
        new_question = PROMPT.collect do 
            key(:title).ask("Title your question:  ")
            key(:body).ask("Enter more details regarding your question:  ")
        end
        Question.create_new_question(new_question[:title], new_question[:body], @current_user_id)
    end
end