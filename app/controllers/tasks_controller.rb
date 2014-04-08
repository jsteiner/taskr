class TasksController < ApplicationController
  respond_to :html
  before_action :authorize, except: [:show]

  def show
    @task = find_task
  end

  def new
    @list = find_list_for_user
    @task = Task.new
  end

  def create
    @list = find_list_for_user
    @task = @list.tasks.create(task_params)
    respond_with @task, location: @list
  end

  def edit
    @task = find_task_for_user
  end

  def update
    @task = find_task_for_user
    @task.update(task_params)
    respond_with @task
  end

  private

  def find_list_for_user
    current_user.lists.find(params[:list_id])
  end

  def find_task_for_user
    current_user.tasks.find(params[:id])
  end

  def find_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :description
    )
  end
end
