class Tag < ActiveRecord::Base
    USE_ARTII = Artii::Base.new
    READER = TTY::Reader.new
    has_many :question_tags

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
        puts "\n"
        tag_dates.each do |tag|
            tag_name = tag.name
            tag_date = tag.created_at.to_s
            puts tag_name + '   ' + tag_date
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
            puts "\nTag doesn't exist! Try Again!"
            puts "If you can't figure out a tag name, press escape"
            READER.on(:keyescape) do |event|
                if event.value == 'q'
                    puts 'it works'
                end
            end        
            CLI.tag_search
        else
            puts "\n"
            puts USE_ARTII.asciify(tag.name)
        end
    end
end
