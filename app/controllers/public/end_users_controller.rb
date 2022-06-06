class Public::EndUsersController < ApplicationController
  
  def show
    @end_user = EndUser.find(params[:id])
    @questions = @end_user.questions
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end
  
  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path
  end
  
  private 
  
  def end_user_params
    params.require(:end_user).permit(:name, :profile_image)
  end
  
end
