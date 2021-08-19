class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }

  has_secure_password
  
  # 1つのUserは複数のTopic(topics)を持つ
  # has_many関連付けを宣言する場合、相手のモデル名は「複数形」にする(Railsは、関連付けの名前から自動的にモデルのクラス名を推測するため)
  has_many :topics
end
