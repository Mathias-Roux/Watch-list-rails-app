class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.movie = @bookmark

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'list/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark = @list.bookmark
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:id, :comment)
  end
end
