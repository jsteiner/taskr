class TasksController < ApplicationController
  respond_to :html
  before_action :authorize

  def new
    @list = find_list
    @task = Task.new
  end

  def create
    @list = find_list
    @task = @list.tasks.create(task_params)
    respond_with @task, location: @list
  end

  private

  def find_list
    current_user.lists.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :description
    )
  end
end
