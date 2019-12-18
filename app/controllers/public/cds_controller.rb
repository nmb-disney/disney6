class Public::CdsController < Public::ApplicationController
  def index
    @cds = Cd.all
    @interest_new = Interest.new
  end

  def show
    @cd = Cd.find(params[:id])
    @interest_new = Interest.new
  end

  def search
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

end
