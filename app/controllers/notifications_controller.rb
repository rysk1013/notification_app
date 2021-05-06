class NotificationsController < ApplicationController
  before_action :set_notifications

  def index
  end

  def reset
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    redirect_to notifications_path
  end

  private
  def set_notifications
    @notifications = current_user.passive_notifications
  end
end
