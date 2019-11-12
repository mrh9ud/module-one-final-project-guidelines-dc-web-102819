PROMPT = TTY::Prompt.new
PROGRAM_NAME = "Ruby Overflow"

def run_program
    puts "Welcome to Ruby Overflow!"
    user_greeting
end

def username
    user_name = PROMPT.ask('What is your name?')
end

def user_greeting
    first_time = PROMPT.yes?("Hello, #{username}! Is this your first time here?")
    if first_time
        more_info = PROMPT.yes?("Great! Would you like to hear about how #{PROGRAM_NAME} works?")
        if more_info
            puts "General Info. about Program"
        else
            main_menu
        end
    else
        main_menu
    end
end

def main_menu
    main_menu = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
        menu.choice "Tags"
        menu.choice "Questions"
        menu.choice "Answers"
        menu.choice "Date Posted"
    end
end