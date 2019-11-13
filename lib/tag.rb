class Tag < ActiveRecord::Base
    has_many :question_tags

    def self.most_common_tags
       most_common_tags = Tag.joins(:question_tags).select("tags.name, COUNT(question_tags.tag_id)").group("question_tags.tag_id").limit(2)
       most_common_tags.collect do |tag|
            puts tag.name
       end
    end

    def self.tags_by_frequency
        most_common_tags = Tag.joins(:question_tags).select("tags.name, COUNT(question_tags.tag_id)").group("question_tags.tag_id")
        most_common_tags.collect do |tag|
             puts tag.name
        end
    end

    def self.answers_sorted_by_tags

    end

    def self.questions_sorted_by_tags

    end
end
