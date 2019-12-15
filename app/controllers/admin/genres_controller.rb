class Admin::GenresController < Admin::ApplicationController
  def create
  	@genre = Genre.new(genre_params)
    @genre.save
    redirect_to ' new_admin_cd_path'
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end

