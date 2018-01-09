require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
    has_many :results, dependent: :destroy
    has_many :exams, through: :results
    accepts_nested_attributes_for :results

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    before_save { self.email = email.downcase }

    has_secure_password

    validates :email, presence: true
    validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password
    validates_presence_of :password_confirmation
    validates :name, presence: true
    validates :phone, numericality: {only_integer: true}, length: {is: 10 , message: "length should be 10"} 
    
    scope :visible, lambda { where(:visible => true) }
    scope :invisible, lambda { where(:visible => false) }
    scope :sorted, lambda { order("id ASC") }
    scope :newest_first, lambda { order("created_at DESC") }
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }
end