class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :likes
	has_many :comments
	attachment :image

	validates :title, presence: true
	validates :content, presence: true
end
