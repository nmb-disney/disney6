class Admin::ListsController < Admin::ApplicationController
  def new
   @list = List.new
   @rebel = Label.new
   @artist = Artist.new
   @genres = Genre.new
  end

private

  def list_params
    params.require(:list).permit(:artist_name, :genre_name, :label_name)
  end

end
