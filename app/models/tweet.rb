class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  has_one_attached :image
  mount_uploader :video, VideoUploader
end
