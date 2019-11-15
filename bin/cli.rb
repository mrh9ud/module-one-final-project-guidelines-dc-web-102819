class CLI

    PROMPT = TTY::Prompt.new
    USE_ARTII = Artii::Base.new

    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "General Info. about Program"

    def run_program
      puts "\n"
      puts "Welcome to:"
      puts USE_ARTII.asciify(PROGRAM_NAME)
    #   load_image
      ask_if_account
    end

    def ask_if_account
        account_prompt = PROMPT.yes?("Do you already have an account with us?")
        if account_prompt
            ask_username
        else
            create_new_username    
        end
    end

    def create_new_username
        puts "\n"
        new_username = PROMPT.ask("Create an account to continue. Input a username:  ")
        if username_exists(new_username)
            puts "\n" + "Username Unavailable"
            create_new_username
        else
            User.create_user(new_username)
            user_greeting(new_username)
        end
    end

    def ask_username
        puts "\n"
        username = PROMPT.ask("What is your username?")
        if username_exists(username)
            User.store_user(username)
            user_greeting(username)
        else
            puts "\n" + "We cannot find your account. Try again."
            ask_username
        end
    end

    def username_exists(username)
        User.all.find do |user|
            user.name == username
        end
    end

    def user_greeting(username)
        more_info = PROMPT.yes?("Hello, #{username}! Would you like more information about #{PROGRAM_NAME} before continuing?")
        if more_info
            puts "\n"
            puts PROGRAM_INFO
            press_enter("\nPress Enter to Continue to the Main Menu...")
        end
        CLI.main_menu
    end

    def self.main_menu
        puts "\n"
        @@main_menu_selection = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
            menu.choice "Tags"
            menu.choice "Questions"
            menu.choice "Answers"
            menu.choice "Exit the program"
        end
        CLI.sub_menu_case_selector
    end

    def self.sub_menu_case_selector
        case @@main_menu_selection
        when @@main_menu_selection = "Tags"
            CLI.tag_menu
        when @@main_menu_selection = "Questions"
            CLI.question_menu
        when @@main_menu_selection = "Answers"
            CLI.answer_menu
        when @@main_menu_selection = "Exit the program"
            CLI.close_ruby_overflow
        end
    end

    def self.tag_menu
        puts "\n"
        @@tag_menu_selection = PROMPT.select("Tag Menu:") do |tag_menu|
            tag_menu.choice "Most Common Tags"
            tag_menu.choice "Tags Listed by Frequency of Use"
            tag_menu.choice "Tags by Date Added"
            tag_menu.choice "List of all Tags"
            tag_menu.choice "Find by Tag Name"
            tag_menu.choice "Return to Main Menu"
        end
        CLI.sub_tag_menu_case_selector
    end

    def self.sub_tag_menu_case_selector
        case @@tag_menu_selection
        when @@tag_menu_selection = "Most Common Tags"
            Tag.most_common_tags
            CLI.tag_menu
        when @@tag_menu_selection = "Tags Listed by Frequency of Use"
            Tag.tags_by_frequency
            CLI.tag_menu
        when @@tag_menu_selection = "Tags by Date Added"
            Tag.tags_by_date_added
            CLI.tag_menu
        when @@tag_menu_selection = "List of all Tags"
            Tag.all_tags
            CLI.tag_menu
        when @@tag_menu_selection = "Find by Tag Name"
            CLI.tag_search
            CLI.tag_menu
        when @@tag_menu_selection = "Return to Main Menu"
            CLI.main_menu
        end
    end

    def self.question_menu
        puts "\n"
        @@question_menu_selection = PROMPT.select("Question Menu:") do |question_menu|
            question_menu.choice "Questions Listed by Date Added"
            question_menu.choice "List of all Questions Asked"
            question_menu.choice "Find a Question by Title"
            question_menu.choice "Find a Question by its Tags"
            question_menu.choice "Post a New Question"
            question_menu.choice "Return to Main Menu"
        end
        CLI.sub_question_menu_case_selector
    end

    def self.sub_question_menu_case_selector
        case @@question_menu_selection
        when @@question_menu_selection = "Questions Listed by Date Added"
            Question.questions_by_date_added
            CLI.question_menu
        when @@question_menu_selection = "List of all Questions Asked"
            Question.all_questions
            CLI.question_menu
        when @@question_menu_selection = "Find a Question by Title"
            Question.question_search
            CLI.question_menu
        when @@question_menu_selection = "Find a Question by its Tags"
            Question.question_by_tags_search
            CLI.question_menu
        when @@question_menu_selection = "Post a New Question"
            User.user_question_prompt
            CLI.question_menu
        when @@question_menu_selection = "Return to Main Menu"
            CLI.main_menu
        end
    end
    
    def self.answer_menu
        puts "\n"
        @@answer_menu_selection = PROMPT.select("Answer Menu:") do |answer_menu|
            answer_menu.choice "Answers sort by Title"
            answer_menu.choice "Answers sort by Date"
            answer_menu.choice "List of all Answers"
            answer_menu.choice "Answers find by Title"
            answer_menu.choice "Post an Answer to a Question"
            answer_menu.choice "Return to Main Menu"
        end
        CLI.sub_answer_menu_case_selector
    end

    def self.sub_answer_menu_case_selector
        case @@answer_menu_selection
        when @@answer_menu_selection = "Answers sort by Title"
            Answer.sorted_by_title
            CLI.answer_menu
        when @@answer_menu_selection = "Answers sort by Date"
            Answer.sorted_by_date
            CLI.answer_menu
        when @@answer_menu_selection = "List of all Answers"
            Answer.sorted_by_body
            CLI.answer_menu
        when @@answer_menu_selection = "Answers find by Title"
            CLI.answer_search_by_title
            CLI.answer_menu
        when @@answer_menu_selection = "Post an Answer to a Question"
            Question.choose_question_to_answer
            CLI.answer_menu
        when @@answer_menu_selection = "Return to Main Menu"
            CLI.main_menu
        end
    end

    def self.tag_search
        puts "\n"
        tag_filter_selection = PROMPT.ask("Filter by Tag Name")
        Tag.find_by_name(tag_filter_selection)
    end
    
    def self.answer_search_by_title
        puts "\n"
        answer_search_parameter = PROMPT.ask("Filter by Answer Title")
        Answer.find_by_title(answer_search_parameter)
    end

    def press_enter(message)
        PROMPT.keypress(message, keys: [:return])
    end
    
    def self.close_ruby_overflow
        begin
            exit
        rescue SystemExit
            p "Closing #{PROGRAM_NAME}"
        end
    end

    def load_image
        Catpix::print_image "./images/there.png",
        :limit_x => 1.0,
        :limit_y => 0,
        :center_x => true,
        :center_y => true,
        :bg => "white",
        :bg_fill => true,
        :resolution => "high"
    end
end