class Admin::ReviewsController < Admin::ApplicationController

  def index
  	@reviews = Review.all
    @reviews = Review.page(params[:page]).per(10)
  end

  def destroy
  	@review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "レビューを削除しました。"
      redirect_to admin_reviews_path
    else
      render :index
  	end
  end

private

    def review_params
     params.require(:review).permit(:id)
    end

end
