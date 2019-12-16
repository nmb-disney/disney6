class Admin::CdsController < Admin::ApplicationController
  def index
    @cds = Cd.all
  end

  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.musics.build


    @labels = Label.all
    @artists = Artist.all
    @genres = Genre.all

  end

  def create
    @cd = Cd.new(cd_params)
    @cd.save
    redirect_to admin_cds_path(@cd.id)
  end

  def edit
     @artists =Artist.all
     @cd = Cd.find(params[:id])
  end

  def update
     @cd.update(cd_params)
     redirect_to public_user_path(@cd.id)
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
     params.require(:cd).permit(:cd_title, :jacket_image_id, :disk_attributes => [:id, :_destroy, :music_attributes => [:id, :destroy]])
    end

end
