class Admin::ArtistsController < Admin::ApplicationController
  def create
   @artist = Artist.new(artist_params)
   @artist.save
   redirect_to new_admin_list_path
  end

  def destroy
   @artist_des = Artist.find(params[:id])
   @artist_des.destroy
   redirect_to  new_admin_list_path
  end

private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end


end
