class Tweet < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  mount_uploader :video, VideoUploader
end
