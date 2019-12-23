class Admin::ListsController < Admin::ApplicationController
  def new

   @label = Label.new
   @artist = Artist.new
   @genre = Genre.new

   @labels = Label.all
   @artists = Artist.all
   @genres = Genre.all
   @cds = Cd.all

  end

end
