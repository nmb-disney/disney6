class Admin::CdsController < Admin::ApplicationController
  def index
    @cd = Cd.all
  end

  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.musics.build
  end

  def create
   @cd = Cd.new(cd_params)
   @cd.save
   redirect_to admin_cds_path(@cd.id)
  end

  def edit
  end

  def update
  end

private

    def cd_params
     params.require(:cd).permit(:cd_title, :jacket_image_id, :disk_attributes => [:id, :_destroy, :music_attributes => [:id, :destroy]])
    end

end
