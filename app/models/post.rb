class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :text, presence: true
end
