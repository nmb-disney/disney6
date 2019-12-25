class Admin::LabelsController < Admin::ApplicationController
  def create
  	@label = Label.new(label_params)
    @label.save
    redirect_to new_admin_list_path
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    redirect_to  new_admin_list_path
  end


  private

  def label_params
    params.require(:label).permit(:label_name)
  end

end
