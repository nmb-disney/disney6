class Admin::LabelsController < Admin::ApplicationController
  def create
  	@label = Label.new(cd_params)
    @label.save
    redirect_to ' new_admin_cd_path'
  end

  private

  def label_params
    params.require(:label).permit(:label_name)
  end

end
