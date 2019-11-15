class User < ActiveRecord::Base
    has_many :questions

    PROMPT = TTY::Prompt.new

    def self.create_user(username)
        User.create(name: username)
        User.store_user(username)
    end

    def self.user_question_prompt
        new_question = PROMPT.collect do 
            key(:title).ask("Title your question:  ")
            key(:body).ask("Enter more details regarding your question:  ")
        end
        Question.create_new_question(new_question[:title], new_question[:body], @current_user_id)
    end

    def self.store_user(username)
        get_user = User.all.each do |user|
            if user.name == username
                @current_user_id = user.id
            end
        end
    end

    def self.user_answer_prompt
        new_answer = PROMPT.collect do
            key(:title).ask("Title your answer:  ")
            key(:body).ask("Enter the details of your answer:  ")
        end
        Answer.create_new_answer(title, body, user_id)
    end

end