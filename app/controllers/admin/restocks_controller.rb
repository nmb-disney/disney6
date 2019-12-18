class Admin::RestocksController < Admin::ApplicationController

  def index
    @restocks = Restock.all
    @artists = Artist.all
  end

  def new
  	@restock = Restock.new
    @artist = Artist.new
    @cd = Cd.new
    @artists = Artist.all
    @cds = Cd.all
  end

  def create
  	@restock = Restock.new(restock_params)
  	@restock.save!
  	redirect_to admin_cds_path(@restock.id)
  end

  def update
  end

private

    def restock_params
     params.require(:restock).permit(:restock_date, :restock_count)
    end


end
