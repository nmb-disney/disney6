class Admin::ReviewsController < Admin::ApplicationController

  def index
  	@reviews = Review.all
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

end
