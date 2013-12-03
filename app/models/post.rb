class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	
	validates :user_id, presence: true
	validates :title, presence: true,
	                length: { minimum: 5 }

	validates :title, presence: true,
	                length: { maximum: 50 }

	validates :text, presence: true,
	                length: { minimum: 10 }


	validates :text, presence: true,
	                length: { maximum: 5000 }
end
