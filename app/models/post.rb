class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :favorites
  has_many :users, through: :favorites
  
  validates :title, presence: true, length: { maximum: 255 }
  
end
