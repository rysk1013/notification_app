class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :active_notifications, class_name: 'notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'notification', foreign_key: 'visited_id', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
