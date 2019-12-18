class Public::InterestsController < Public::ApplicationController
  def index
  	@interest = Interest.all
  end

  def create
  	@interest = current_user.interests.create(cd_id: params[:cd_id])
  	if  @interest.save
  		redirect_to public_interests_path
  	else
  		redirect_to root_path
    end
   end

  def destroy
  end

  # private

  # def interest_params
  #   params.require(:interest).permit(:cd_id, :user_id)
  # end

end
