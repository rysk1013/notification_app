class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :notifications

  validates :text, presence: true
end
