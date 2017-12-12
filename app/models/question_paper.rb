class QuestionPaper < ApplicationRecord
    belongs_to :exam
    has_many :questions
end