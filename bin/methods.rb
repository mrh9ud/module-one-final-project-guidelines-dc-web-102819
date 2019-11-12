class CLI

    PROMPT = TTY::Prompt.new
    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "General Info. about Program"

    def run_program
        puts "Welcome to Ruby Overflow!"
        # most_common_tags
        user_greeting
    end

    def username
        user_name = PROMPT.ask('What is your name?')
    end

    def user_greeting
        more_info = PROMPT.yes?("Hello, #{username}! Would you like more information about #{PROGRAM_NAME} before continuing?")
        if more_info
            puts PROGRAM_INFO
            press_enter("\nPress Enter to Continue to the Main Menu...")
        end
        main_menu
    end

    def press_enter(message)
        PROMPT.keypress(message, keys: [:return])
    end

    def main_menu
        main_menu = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
            menu.choice "Tags"
            menu.choice "Questions"
            menu.choice "Answers"
            menu.choice "Date Posted"
        end
    end

    # def most_common_tags
    #     sql = <<-SQL
    #         SELECT tags.name, COUNT(question_tags.tag_id) 
    #         FROM question_tags 
    #         INNER JOIN tags ON 
    #         question_tags.tag_id = tags.id 
    #         GROUP BY question_tags.tag_id LIMIT 2
    #     SQL
    #     DB[:conn].execute(sql)
    # end
end