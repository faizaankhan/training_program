class Exam < ApplicationRecord
    has_many :users, :through => :results
    has_many :questions
end
