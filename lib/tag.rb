class Tag < ActiveRecord::Base
    has_many :question_tags

    def self.most_common_tags
        
    end

    def self.most_frequent_tags

    end

    def self.answers_sorted_by_tags

    end

    def self.questions_sorted_by_tags

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