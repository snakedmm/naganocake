class Public::GenreSearchesController < ApplicationController

  def search
    @genre_id = params[:genre_id]
    @items = Item.where(is_active: true, genre_id: @genre_id)
    @genres = Genre.all
  end
end
