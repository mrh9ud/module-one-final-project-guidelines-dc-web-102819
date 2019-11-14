class CLI

    PROMPT = TTY::Prompt.new
    USE_ARTII = Artii::Base.new
    READER = TTY::Reader.new

    PROGRAM_NAME = "Ruby Overflow"
    PROGRAM_INFO = "General Info. about Program"

    def run_program
      puts "Welcome to:"
      puts USE_ARTII.asciify(PROGRAM_NAME)
    #   load_image
      user_greeting
    end

    def username
        user_name = PROMPT.ask('What is your name?')
        puts "\n"
    end

    def user_greeting
        more_info = PROMPT.yes?("Hello, #{username}! Would you like more information about #{PROGRAM_NAME} before continuing?")
        if more_info
            puts "\n"
            puts PROGRAM_INFO
            press_enter("\nPress Enter to Continue to the Main Menu...")
        end
        main_menu
    end

    def main_menu
        puts "\n"
        @@main_menu_selection = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
            menu.choice "Tags"
            menu.choice "Questions"
            menu.choice "Answers"
            menu.choice "Date Posted"
            menu.choice "Exit the program"
        end
        sub_menu_case_selector
    end

    def sub_menu_case_selector
        case @@main_menu_selection
        when @@main_menu_selection = "Tags"
            tag_menu
        when @@main_menu_selection = "Questions"
            CLI.question_menu
        when @@main_menu_selection = "Answers"
            answer_menu
        when @@main_menu_selection = "Date Posted"
            date_posted_menu
        when @@main_menu_selection = "Exit the program"
            close_ruby_overflow
        end
    end

    def tag_menu
        puts "\n"
        @@tag_menu_selection = PROMPT.select("Tag Menu:") do |tag_menu|
            tag_menu.choice "Most Common Tags"
            tag_menu.choice "Tags Listed by Frequency of Use"
            tag_menu.choice "Tags by Date Added"
            tag_menu.choice "List of all Tags"
            tag_menu.choice "Find by Tag Name"
            tag_menu.choice "Return to Main Menu"
        end
        sub_tag_menu_case_selector
    end

    def sub_tag_menu_case_selector
        case @@tag_menu_selection
        when @@tag_menu_selection = "Most Common Tags"
            Tag.most_common_tags
            tag_menu
        when @@tag_menu_selection = "Tags Listed by Frequency of Use"
            Tag.tags_by_frequency
            tag_menu
        when @@tag_menu_selection = "Tags by Date Added"
            Tag.tags_by_date_added
            tag_menu
        when @@tag_menu_selection = "List of all Tags"
            Tag.all_tags
            tag_menu
        when @@tag_menu_selection = "Find by Tag Name"
            CLI.tag_search
            tag_menu
        when @@tag_menu_selection = "Return to Main Menu"
            main_menu
        end
    end

    def self.question_menu
        puts "\n"
        @@question_menu_selection = PROMPT.select("Question Menu:") do |question_menu|
            question_menu.choice "Questions Listed by Date Added"
            question_menu.choice "List of all Questions Asked"
            question_menu.choice "Find a Question by Title"
            question_menu.choice "Find a Question by its Tags"
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
            CLI.question_search
            CLI.question_menu
        when @@question_menu_selection = "Find a Question by its Tags"
            CLI.question_by_tags_search
            CLI.question_menu
        when @@question_menu_selection = "Return to Main Menu"
            main_menu
        end
    end
    
    def answer_menu
        puts "\n"
        @@answer_menu_selection = PROMPT.select("Answer Menu:") do |answer_menu|
            answer_menu.choice "Answers sort by Title"
            answer_menu.choice "Answers sort by Date"
            answer_menu.choice "Answers sort by Content"
            answer_menu.choice "Answers find by Title"
            answer_menu.choice "Return to Main Menu"
        end
        sub_answer_menu_case_selector
    end

    def sub_answer_menu_case_selector
        case @@answer_menu_selection
        when @@answer_menu_selection = "Answers sort by Title"
            Answer.sorted_by_title
            answer_menu
        when @@answer_menu_selection = "Answers sort by Date"
            Answer.sorted_by_date
            answer_menu
        when @@answer_menu_selection = "Answers sort by Content"
            Answer.sorted_by_body
            answer_menu
        when @@answer_menu_selection = "Answers find by Title"
            CLI.answer_search_by_title
            answer_menu
        when @@answer_menu_selection = "Return to Main Menu"
            main_menu
        end
    end

    def self.question_by_tags_search
        puts "\n"
        question_filter_by_tag_selection = PROMPT.ask("Filter Questions by Tag Name")
        Question.find_question_by_tag(question_filter_by_tag_selection)
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
    
    def close_ruby_overflow
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