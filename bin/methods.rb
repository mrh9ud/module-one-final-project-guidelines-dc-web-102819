PROMPT = TTY::Prompt.new
PROGRAM_NAME = "Ruby Overflow"
PROGRAM_INFO = "General Info. about Program"

def run_program
    puts "Welcome to Ruby Overflow!"
    user_greeting
end

def username
    user_name = PROMPT.ask('What is your name?')
end

def user_greeting
    more_info = PROMPT.yes?("Hello, #{username}! Would you like more information about #{PROGRAM_NAME} before continuing?")
    if more_info
        puts "General Info. about Program"
        press_enter("\nPress Enter to Continue to the Main Menu...")
    end
    main_menu
end

def press_enter(message)
    PROMPT.keypress(message, keys: [:return])

end
# prompt.keypress("Press space or enter to continue", keys: [:space, :return])

def main_menu
    main_menu = PROMPT.select("#{PROGRAM_NAME} Main Menu:") do |menu|
        menu.choice "Tags"
        menu.choice "Questions"
        menu.choice "Answers"
        menu.choice "Date Posted"
    end
end
