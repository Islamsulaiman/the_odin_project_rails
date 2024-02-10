class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)

    if @user.save!
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :email)
    # params.permit(:user_name, :password, :email) #with the form_helper, because it dose'nt nest the objects inside the model name as in form_with helper
  end
end
