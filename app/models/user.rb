class User < ApplicationRecord
  before_save { self.email.downcase! } # ユーザーがemail登録時に小文字に変換する
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :categories
  has_many :posts
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationship, source: :user
  has_many :favorites
  has_many :fav_posts, through: :favorites, source: :post
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def feed_posts
    Post.where(user_id: self.following_ids + [self.id])
  end
  
  def like_post(other_post)
    unless self == other_post
      self.favorites.find_or_create_by(post_id: post.id)
    end
  end
  
  def unlike_post(other_post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destory if favorite
  end
  
  def like?(otherpost)
    self.fav_posts.include?(other_post)
  end
end