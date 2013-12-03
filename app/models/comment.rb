class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :post
  belongs_to :user
end
