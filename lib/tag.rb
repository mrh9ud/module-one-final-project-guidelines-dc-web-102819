class Tag < ActiveRecord::Base
    has_many :question_tags

    def self.most_common_tags
        
    end

end