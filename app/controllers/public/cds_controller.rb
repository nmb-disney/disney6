class Public::CdsController < Public::ApplicationController
  def index
    @cds = Cd.page(params[:page]).per(12)
    @interest_new = Interest.new
    @cart_cd_new = CartCd.new
    @reviews = Review.all
    @tax = 1.1
    @tentyo = Cd.where.not(comment: "")
    @tentyo = @tentyo.order("random()").limit(4)
  end

  def show
    @cd = Cd.find(params[:id])
    @interest_new = Interest.new
    @cart_cd_new = CartCd.new
    @cds = Cd.all
    @review = Review.new
    @tax = 1.1
  end

  def search
    @searchs = Cd.page(params[:page]).per(10)
    @search_option = params[:option]
    @search_text = params[:search]
    if @search_option == "2"
      @search_a = Artist.search(params[:search], @search_option)
    elsif @search_option == "3"
      @search_t = Cd.search(params[:search], @search_option)
    else
    	@search_a = Artist.search(params[:search], @search_option)
    	@search_t = Cd.search(params[:search], @search_option)
    end

  end

  private

    def cd_params
     params.require(:cd).permit(:id, :cd_id, :profile_image)

    end

    def user
      @user = User.find(params[:id])
    end

end

