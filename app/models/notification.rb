class Notification < ApplicationRecord
  default_scope -> {order(created_at: :desc)}
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  belongs_to :visitor_id, class_name: 'user', foreign_key: 'visitor_id', optional: true
  belongs_to :visited_id, class_name:'user', foreign_key: 'visited_id', optional: true
end