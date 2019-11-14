class Tag < ActiveRecord::Base
    has_many :question_tags
    has_many :questions, through: :question_tags
    
    USE_ARTII = Artii::Base.new
    PROMPT = TTY::Prompt.new

    def self.most_common_tags
       most_common_tags = Tag.joins(:question_tags).select("tags.name, COUNT(question_tags.tag_id)").group("question_tags.tag_id").limit(2)
       puts "\n"
       most_common_tags.collect do |tag|
            puts tag.name
       end
    end

    def self.tags_by_frequency
        most_common_tags = Tag.joins(:question_tags).select("tags.name, COUNT(question_tags.tag_id)").group("question_tags.tag_id")
        puts "\n"
        most_common_tags.collect do |tag|
            puts tag.name
        end
    end

    def self.tags_by_date_added
        tag_dates = Tag.order(:created_at)
        tag_dates.each do |tag|
            tag_name = tag.name
            tag_date = tag.created_at.to_s
            puts "\n" + tag_name + "\n" + "Added on:  " + tag_date
        end
    end

    def self.all_tags
        tag_array = Tag.all.collect do |tag|
            tag.name
        end
        puts "\n"
        puts tag_array.sort!
    end

    def self.find_by_name(tag_name)
        tag = Tag.find_by name: tag_name
        if tag.nil?
            puts"\n"
            keep_searching = PROMPT.yes?("No result found. Would you like to keep searching?")
            if keep_searching
                CLI.tag_search
            else
                CLI.tag_menu
            end
        else
            puts "\n"
            puts USE_ARTII.asciify(tag.name)
        end
    end
end
