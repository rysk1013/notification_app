class Like < ApplicationRecord
  has_many :notifications, dependent: :destroy
end
