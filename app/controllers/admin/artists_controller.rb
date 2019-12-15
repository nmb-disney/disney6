class Admin::ArtistsController < Admin::ApplicationController
  def create
   @artist = Artist.new(artist_params)
   @artist.save
   redirect_to admin_cds_path(@artist.id)
  end

private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
