class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  has_attached_file :attach

  validates_attachment_content_type :attach, content_type: ['application/pdf']
  validates :exam_id, presence: true
  validates :user_id, presence: true
end
