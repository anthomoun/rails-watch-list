class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end

  def find_list
    @list = List.find(params[:list_id])
  end

end
