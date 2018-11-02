class Post < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :blog
  belongs_to :user
  has_many :comments
end
