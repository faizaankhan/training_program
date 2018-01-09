class Exam < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :users, :through => :results
  has_many :questions,  dependent: :destroy
  accepts_nested_attributes_for :questions
  
  validates :exam_name, presence: true
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("created_at ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
end
