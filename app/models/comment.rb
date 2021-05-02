class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notification, dependent: :destroy

  validates :text, presence: true
end
