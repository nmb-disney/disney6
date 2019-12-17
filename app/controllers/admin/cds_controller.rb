class Admin::CdsController < Admin::ApplicationController
  def index
    @cds = Cd.all
  end

  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.musics.build


    @label = Label.new
    @artist = Artist.new
    @genre = Genre.new

  end

  def create
    puts "====="

    @cd = Cd.new(cd_params)
    @cd.save!
    puts "====="

    redirect_to admin_cds_path
    logger.debug @cd.errors.inspect
  end

  def edit
     @artists =Artist.all
     @cd = Cd.find(params[:id])
  end

  def update
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

private

    def cd_params
     params.require(:cd).permit(:id, :cd_title, :jacket_image, :price, :release_date, :label_id, :artist_id, :status,
      :genre_id, discs_attributes: [:id, :disc_title, :disc_rank, :_destroy,musics_attributes: [:id, :music_title, :music_rank, :_destroy,]], restock_attributes: [:id, :restock_date , :destroy])
    end

end
