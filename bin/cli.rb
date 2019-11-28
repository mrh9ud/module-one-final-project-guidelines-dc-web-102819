class CLI

    PROMPT = TTY::Prompt.new
    USE_ARTII = Artii::Base.new

    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "We created Ruby Overflow as a narrower rendition of the well-known Stack Overflow application. Ruby Overflow functions as a subset of its parent that focuses on topics related to the Ruby programming lanuage and its related software. We hope that you may find it useful, and please call Jose Romero at 443-848-0869 with any suggestions or concerns. You're currently viewing version 1.0. Our hope is to soon integrate relevant sections of the Stack Overflow API."

    def run_program
      puts "\n"
      puts "Welcome to:"
      puts USE_ARTII.asciify(PROGRAM_NAME)
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
        if username_exists?(new_username)
            puts "\n" + "Username Unavailable"
            create_new_username
        else
            @current_user = User.create_user(new_username)
            User.find_by(name: new_username)
            user_greeting(@current_user.name)
        end
    end

    def ask_username
        puts "\n"
        username = PROMPT.ask("What is your username? Is case sensitive:  ")
        @current_user = username_exists?(username)
        if @current_user
            user_greeting(@current_user.name)
        else
            puts "\n"
            if PROMPT.yes?("Username not found. Would you like to try again?")
                ask_username
            else
                ask_if_account
            end
        end
    end

    def username_exists?(username)
        User.find_by(name: username)
    end

    def user_greeting(username)
        more_info = PROMPT.yes?("Hello, #{username.titlecase}! Would you like more information about #{PROGRAM_NAME} before continuing?")
        if more_info
            puts "\n" + "Contributor: Matthew R Heavner"
            load_image("./images/profile_pic.jpeg")
            puts "\nContributor: Jose D Romero"
            load_image("./images/avatar.jpeg")
            puts "\n" + PROGRAM_INFO
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
        when "Tags"
            CLI.tag_menu
        when "Questions"
            CLI.question_menu
        when "Answers"
            CLI.answer_menu
        when "Exit the program"
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
        when "Most Common Tags"
            Tag.most_common_tags
            CLI.tag_menu
        when "Tags Listed by Frequency of Use"
            Tag.tags_by_frequency
            CLI.tag_menu
        when "Tags by Date Added"
            Tag.tags_by_date_added
            CLI.tag_menu
        when "List of all Tags"
            Tag.all_tags
            CLI.tag_menu
        when "Find by Tag Name"
            CLI.tag_search
            CLI.tag_menu
        when "Return to Main Menu"
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
        when "Questions Listed by Date Added"
            Question.questions_by_date_added
            CLI.question_menu
        when "List of all Questions Asked"
            Question.all_questions
            CLI.question_menu
        when "Find a Question by Title"
            CLI.question_search
            CLI.question_menu
        when "Find a Question by its Tags"
            Question.question_by_tags_search
            CLI.question_menu
        when "Post a New Question"
            User.user_question_prompt
            CLI.question_menu
        when "Return to Main Menu"
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
            answer_menu.choice "Return to Main Menu"
        end
        CLI.sub_answer_menu_case_selector
    end

    def self.sub_answer_menu_case_selector
        case @@answer_menu_selection
        when "Answers sort by Title"
            Answer.sorted_by_title
            CLI.answer_menu
        when "Answers sort by Date"
            Answer.sorted_by_date
            CLI.answer_menu
        when "List of all Answers"
            Answer.sorted_by_body
            CLI.answer_menu
        when "Answers find by Title"
            CLI.answer_search_by_title
            CLI.answer_menu
        when "Return to Main Menu"
            CLI.main_menu
        end
    end

    def self.tag_search
        puts "\n"
        tag_filter_selection = PROMPT.ask("Filter by Tag Name")
        Tag.find_by_name(tag_filter_selection)
    end

    def self.question_search
        puts "\n"
        question_filter_selection = PROMPT.ask("Filter by Question Name")
        Question.find_by_title(question_filter_selection)
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
            
            puts "\n" + "Closing #{PROGRAM_NAME}"
        end
    end

    def load_image(image_file)
        Catpix::print_image image_file,
        :limit_x => 0.5,
        :limit_y => 0,
        :center_x => true,
        :center_y => true,
        :bg => "white",
        :bg_fill => false,
        :resolution => "auto",
        :width => 0.5,
        :height => 0.5
    end
end
