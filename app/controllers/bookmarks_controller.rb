class BookmarksController < ApplicationController
  def new
    @movie = Movie.all
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @bookmark.list = @list
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to(bookmark_path(@bookmark))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
