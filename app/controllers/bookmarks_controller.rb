class BookmarksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
  end

  def destroy
    # params[:id]はお気に入りのid
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
  end
end
