class ListsController < ApplicationController
  before_action :find_list, only: [:show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end
  
  def show
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(@lists)
  end

private

  def find_list
  @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
  
end
