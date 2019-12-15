class Admin::RestocksController < Admin::ApplicationController

  def index
  end

  def new
  	@restock = Restock.new
    @artist = Artist.new
    @cd = Cd.new
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
     params.require(:restock).permit()
    end


end
