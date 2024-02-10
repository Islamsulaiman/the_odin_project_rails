class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(permit_user)

    if @user.save!
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private

  def permit_user
    params.require(:user).permit(:user_name, :password, :email)
    # params.permit(:user_name, :password, :email) #with the form_helper, because it dose'nt nest the objects inside the model name as in form_with helper
  end
end
