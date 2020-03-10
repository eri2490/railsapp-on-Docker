class Relationship < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :follow_user, class_name: "User"
  validates :user_id, presence: true
  validates :follow_user_id, presence: true
end
