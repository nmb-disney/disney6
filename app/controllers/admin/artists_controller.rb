class Admin::ArtistsController < Admin::ApplicationController
  def create
   @artists = Artist.all
   @artist = Artist.new(cd_params)
   @artist.save
   redirect_to ' new_admin_cd_path'
  end

private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
