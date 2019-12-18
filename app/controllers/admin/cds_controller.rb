class Admin::CdsController < Admin::ApplicationController
  def index
    @cds = Cd.all

  end

  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.musics.build
    @restock = @cd.restocks.build
    @label = Label.new
    @artist = Artist.new
    @genre = Genre.new

  end

  def create
    @cd = Cd.new(cd_params)

    @cd.save!

    redirect_to admin_cds_path


  end

  def edit
     @artists =Artist.all
     @cd = Cd.find(params[:id])
  end

  def update
     @cd = Cd.find(params[:id])
     @cd.update(cd_params)
     redirect_to admin_cds_path(@cd)
  end

  def searchs
    @search_option = params[:option]
    @search_text = params[:search]
    if @search_option == "2"
      @search_a = Artist.search(params[:search], @search_option)
    elsif @sesarch_option == "3"
      @search_t = Cd.search(params[:search], @search_option)
    else
      @search_a = Artist.search(params[:search], @search_option)
      @search_t = Cd.search(params[:search], @search_option)
  end
end

  def destroy
      @cd = Cd.find(params[:id])
      @cd.destroy
      redirect_to admin_cds_path
  end

private

    def cd_params
     params.require(:cd).permit(:id, :cd_title, :jacket_image, :price, :release_date, :label_id, :artist_id, :status, :cd_id,
      :genre_id, discs_attributes: [:id, :disc_title, :disc_rank, :_destroy, musics_attributes: [:id, :music_title, :music_rank, :_destroy]], restocks_attributes: [:id, :restock_date ,:restock_count , :destroy])
    end

    def cd_find
      @user = User.find(params[:id])
    end

end
