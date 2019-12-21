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

    @cd = @restock.cd.stock
    @restock_restock_count_sum = Restock.find(@restock.id)#何を足したいのかを見つけてくる
    @restock_restock_count_sum.restock_count += @cd    #restock_restock_count_sumはリスト追加での所で持ってきたいのは持ってきたいのは商品一覧のrestock_count
    @restock_restock_count_sum.update(stock: @restock_stock_sum.stock)#updateで引数で何をたすかを見つけてくる指定

  	redirect_to admin_cds_path(@restock.id)
  end

  def update
  end

private

    def restock_params
     params.require(:restock).permit(:restock_date, :restock_count, :cd_id)
    end


end
