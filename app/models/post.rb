class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, 
                      length: { maximum: 350 }
end
