class Public::ReviewsController < Public::ApplicationController

  def create
  	@review = Review.new(review_params)
    @review.user_id = current_user.id
    if
      @review.save!
      redirect_to public_cd_path(@review.cd)
    else
      redirect_to root_path
    end
  end

  def show
  	 @reviews = Review.all

  end

  private
    def review_params
      params.require(:review).permit(:cd_id, :comment, :user_id)
    end

end
