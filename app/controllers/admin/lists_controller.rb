class Admin::ListsController < Admin::ApplicationController
  def new

   @label = Label.new
   @artist = Artist.new
   @genre = Genre.new

   @labels = Label.all
   @artists = Artist.all
   @genres = Genre.all
  end

private

  def list_params
    params.require(:list).permit(:artist_name, :genre_name, :label_name)
  end

end
