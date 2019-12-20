class Admin::ReviewsController < Admin::ApplicationController

  def index
  @reviews = Review.page(params[:page]).per(10)

  end

  def destroy
  end

private

    def review_params
     params.require(:review).permit(:id)
    end

end
