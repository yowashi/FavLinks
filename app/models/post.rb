class Post < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :likes,dependent: :destroy
	has_many :liked_users, through: :likes, source: :user
	has_many :comments,dependent: :destroy
	attachment :image

	validates :title, presence: true, length: {maximum: 25}
	validates :content, presence: true, length: {maximum: 200}
	validates :rate, presence: true

	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end
end
