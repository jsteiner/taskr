class DashboardsController < ApplicationController
  before_action :authorize

  def show
    @list = List.new
    @lists = current_user.lists
    @most_recent_task = current_user.most_recent_task
  end
end
