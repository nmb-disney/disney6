class Admin::RestocksController < Admin::ApplicationController

  def index
    @artists = Artist.all
    @restocks = Restock.page(params[:page]).per(10)
    @cds = Cd.where.not(stock: nil).order("RANDOM()").limit(1)
  end

  def new
  	@restock = Restock.new
    @artist = Artist.new
    @cd = Cd.new
    @artists = Artist.all
    @cds = Cd.all
  end

  def create

  	@restock = Restock.new(restock_params)##ここで新しく作ったデータを取得できる
    @restock.save


    @new = Cd.find(@restock.cd_id)##ここでcdのidを取得できる

    @restock2 = @restock.restock_count##ここで新しく作ったデータの中の入荷枚数だけのデータを持ってこれている
    @stock = @restock.cd.stock##ここでcdのstockを持ってきている
    @stock += @restock2##最後に持ってきたものを足す
    @new.stock = @stock##ここでcdの中にあるstockカラムだけ更新することができる
    @new.save#cdをセーブ

  	redirect_to admin_cds_path(@restock.id)
  end

  def update
  end

private

    def restock_params
     params.require(:restock).permit(:restock_date, :restock_count, :cd_id)
    end


end
