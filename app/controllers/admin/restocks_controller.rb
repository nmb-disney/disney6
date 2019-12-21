class Admin::RestocksController < Admin::ApplicationController

  def index
    @artists = Artist.all
    @restocks = Restock.page(params[:page]).per(10)
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


    @new = Cd.find(@restock.cd_id)

    @restock2 = @restock.restock_count
    @stock = @restock.cd.stock
    @stock += @restock2
    @new.stock = @stock
    @new.save

  	redirect_to admin_cds_path(@restock.id)
  end

  def update
  end

private

    def restock_params
     params.require(:restock).permit(:restock_date, :restock_count, :cd_id)
    end


end
