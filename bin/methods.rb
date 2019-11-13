class CLI

    PROMPT = TTY::Prompt.new
    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "General Info. about Program"
    USE_ARTII = Artii::Base.new


    def run_program
      puts "Welcome to:"
      puts USE_ARTII.asciify(PROGRAM_NAME)
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
        @@main_menu_selection = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
            menu.choice "Tags"
            menu.choice "Questions"
            menu.choice "Answers"
            menu.choice "Date Posted"
        end
        sub_menu_case_selector
        # binding.pry
    end

    def sub_menu_case_selector
        case @@main_menu_selection
            when @@main_menu_selection = "Tags"
                tag_menu
            when @@main_menu_selection = "Questions"
                question_menu
            when @@main_menu_selection = "Answers"
                answer_menu
            when @@main_menu_selection = "Date Posted"
                date_posted_menu
            end
    end

    def tag_menu
        tag_menu = PROMPT.select("Tag Menu:") do |tag_menu|
            tag_menu.choice "Most Common Tags"
            tag_menu.choice "Tags Listed by Frequency of Use"
            tag_menu.choice "Sort Answers by Tags"
            tag_menu.choice "Sort Questions by Tags"
        end
    end

    def question_menu
        question_menu = PROMPT.select("Question Menu:") do |question_menu|
            question_menu.choice
            question_menu.choice
        end
    end

    def answer_menu
        answer_menu = PROMPT.select("Answer Menu:") do |answer_menu|
            answer_menu.choice
            answer_menu.choice
        end
    end

    def date_posted_menu
        date_posted_menu = PROMPT.select("Date Posted Menu:") do |date_posted_menu|
            date_posted.choice
            date_posted.choice
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
