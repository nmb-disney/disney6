class Public::ReviewsController < Public::ApplicationController

  def create
  	@review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save!
    redirect_to public_cd_path(@review.cd)
  end

  def show
  	 @reviews = Review.all

  end

  private
    def review_params
      params.require(:review).permit(:cd_id, :comment, :user_id)
    end

end
