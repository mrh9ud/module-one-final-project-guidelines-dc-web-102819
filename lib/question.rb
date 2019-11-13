class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    
end