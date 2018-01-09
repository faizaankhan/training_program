class Question < ApplicationRecord
  belongs_to :exam

  validates :question_description, presence: true
  validates :exam_id, presence: true
end
