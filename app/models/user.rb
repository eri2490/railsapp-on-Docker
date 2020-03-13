class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                   foreign_key: "user_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, 
                       source: :follow_user

  before_save { email.downcase! }
  validates :name, presence: true, 
                   length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password

  # ユーザーをフォローする
  def follow(other_user)
    byebug
    active_relationships.create(follow_user_id: other_user.id)
    # following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(follow_user_id: other_user.id).destroy
  end
  
  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # いいねしていればtrueを返す
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
    
end
