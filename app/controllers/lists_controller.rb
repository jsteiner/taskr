class ListsController < ApplicationController
  respond_to :html
  before_action :authorize

  def index
    @list = List.new
    @lists = current_user.lists
  end

  def show
    @list = find_list
    respond_with @list
  end

  def create
    respond_with current_user.lists.create(list_params)
  end

  private

  def find_list
    current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(
      :name
    )
  end
end
