class ListsController < ApplicationController
  respond_to :html
  before_action :authorize, except: [:show]

  def show
    @list = find_list
  end

  def create
    respond_with current_user.lists.create(list_params)
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
