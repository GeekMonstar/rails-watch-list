class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie)
  end
end
