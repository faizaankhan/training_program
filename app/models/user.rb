class User < ApplicationRecord
    has_many :results, dependent: :destroy
    has_many :exams, through: :results
    accepts_nested_attributes_for :results

    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
  
end