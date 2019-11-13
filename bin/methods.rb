class CLI

    PROMPT = TTY::Prompt.new
    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "General Info. about Program"

    def run_program
        puts "Welcome to Ruby Overflow!"
        load_image
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
    
    def question_menu
        @@question_menu_selection = PROMPT.select("Question Menu:") do |question_menu|
            question_menu.choice
            question_menu.choice
        end
    end
    
    def answer_menu
        @@answer_menu_selection = PROMPT.select("Answer Menu:") do |answer_menu|
            answer_menu.choice
            answer_menu.choice
        end
    end
    
    def date_posted_menu
        @@date_posted_menu_selection = PROMPT.select("Date Posted Menu:") do |date_posted_menu|
            date_posted.choice
            date_posted.choice
        end
    end

    def tag_menu
        @@tag_menu_selection = PROMPT.select("Tag Menu:") do |tag_menu|
            tag_menu.choice "Most Common Tags"
            tag_menu.choice "Tags Listed by Frequency of Use"
            tag_menu.choice "Sort Answers by Tags"
            tag_menu.choice "Sort Questions by Tags"
        end
        sub_tag_menu_case_selector
    end

    def sub_tag_menu_case_selector
        case @@tag_menu_selection
            when @@tag_menu_selection = "Most Common Tags"
                Tag.most_common_tags
            when @@tag_menu_selection = "Tags Listed by Frequency of Use"
                Tag.most_frequent_tags
            when @@tag_menu_selection = "Sort Answers by Tags"
                Tag.answers_sorted_by_tags
            when @@tag_menu_selection = "Sort Questions by Tags"
                Tag.questions_sorted_by_tags 
            end
    end

    # def sub_question_menu_case_selector
    #     case @@question_menu_selection
    #         when @@question_menu_selection = ""
    #             Question.most_common_tags
    #         when @@question_menu_selection = ""
    #             Question.most_frequent_tags
    #         when @@question_menu_selection = ""
    #             Question.answers_sorted_by_tags
    #         when @@question_menu_selection = ""
    #             Question.questions_sorted_by_tags 
    #         end
    # end

    # def sub_answer_menu_case_selector
    #     case @@answer_menu_selection
    #         when @@answer_menu_selection = ""
    #             Answer.most_common_tags
    #         when @@answer_menu_selection = ""
    #             Answer.most_frequent_tags
    #         when @@answer_menu_selection = ""
    #             Answer.answers_sorted_by_tags
    #         when @@answer_menu_selection = ""
    #             Answer.questions_sorted_by_tags 
    #         end
    # end

    # def sub_date_posted_menu_case_selector
    #     case @@date_posted_menu_selection
    #         when @@date_posted_menu_selection = ""
    #             Question.most_common_tags
    #         when @@date_posted_menu_selection = ""
    #             Question.most_frequent_tags
    #         when @@date_posted_menu_selection = ""
    #             Question.answers_sorted_by_tags
    #         when @@date_posted_menu_selection = ""
    #             Question.questions_sorted_by_tags 
    #         end
    # end

    def load_image
        Catpix::print_image "./images/profile_pic.jpeg",
            :limit_x => 1.0,
            :limit_y => 0,
            :center_x => true,
            :center_y => true,
            :bg => "white",
            :bg_fill => true
    end
end