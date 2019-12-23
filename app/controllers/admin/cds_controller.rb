class Admin::CdsController < Admin::ApplicationController
  def index
    @cds = Cd.page(params[:page]).per(5)
    @search_option = params[:option]
    @search_text = params[:search]
    case @search_option
    when "a"
      @search_a = Artist.search(params[:search], @search_option)
    when "t"
      @search_t = Cd.search(params[:search], @search_option)
    when "s"
      @search_s = Cd.search(params[:search], @search_option)
    end
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
    @cd.save

    @cd_stock_sum = Cd.find(@cd.id)#何を足したいのかを見つけてくる
    @restock = Restock.where(cd_id: @cd.id).last#Lastで最新のデータを指定する
    @cd_stock_sum.stock += @restock.restock_count#実際の足し算
    @cd_stock_sum.update(stock: @cd_stock_sum.stock)#updateで引数で何をたすかを見つけてくる指定

    redirect_to admin_restocks_path
   end


private

    def cd_params
     params.require(:cd).permit(:id, :cd_title, :jacket_image, :price, :release_date, :label_id, :artist_id, :status, :cd_id, :stock,
      :genre_id, :comment, discs_attributes: [:id, :disc_title, :disc_rank, :_destroy, musics_attributes: [:id, :music_title, :music_rank, :_destroy]], restocks_attributes: [:id, :restock_date ,:restock_count , :destroy])
    end

    def cd_find
      @user = User.find(params[:id])
    end

    def user_admin
       @users = User.all
       if  current_user.admin == false
           redirect_to new_user_session_path
       else
           render action: "index"
       end
    end


end
