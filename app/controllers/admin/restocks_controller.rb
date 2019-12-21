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

    @restock_restock_count_sum = Restock.find(@restock.id)#何を足したいのかを見つけてくる
    @cd = Cd.where(stock: @restock.id)#Lastで最新のデータを指定する
    @restock_restock_count_sum.restock_count += @cd.stock#実際の足し算
    @restock_restock_count_sum.update(stock: @cd_stock_sum.stock)#updateで引数で何をたすかを見つけてくる指定


  	redirect_to admin_cds_path(@restock.id)
  end

  def update
  end

private

    def restock_params
     params.require(:restock).permit(:restock_date, :restock_count, :cd_id)
    end


end
