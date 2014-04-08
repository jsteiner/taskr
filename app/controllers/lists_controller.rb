class ListsController < ApplicationController
  respond_to :html
  before_action :authorize, except: [:show]

  def show
    @list = find_list
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list
    else
      @lists = current_user.lists
      @most_recent_task = current_user.most_recent_task
      render 'dashboards/show'
    end
  end

  def edit
    @list = find_list_for_user
  end

  def update
    @list = find_list_for_user
    @list.update(list_params)
    respond_with @list
  end

  private

  def find_list_for_user
    current_user.lists.find(params[:id])
  end

  def find_list
    List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(
      :name
    )
  end
end
