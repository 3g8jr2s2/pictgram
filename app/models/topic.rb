class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  ### 参照先(userモデル)から値を参照できる。
  belongs_to :user

  ### ImageUploader -> /app/uploaders/image_uploader.rb (ImageUploader クラス)
  mount_uploader :image, ImageUploader
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'

  has_many :comments
end
