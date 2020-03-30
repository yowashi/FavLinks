class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :likes
	attachment :image

	validates :title, presence: true
	validates :content, presence: true
end
