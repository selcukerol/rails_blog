class User < ApplicationRecord
	validates_uniqueness_of :username
	validates :fname, presence: true, length: {minimum: 3, maximum: 20}
	validates :lname, presence: true, length: {minimum: 3, maximum: 20}
	validates :dob, presence: true
	validates :username, presence: true, length: {minimum: 3, maximum: 20}
	validates :password, presence: true, length: {minimum: 3, maximum: 10}
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
end
