class UsersController < ApplicationController
  def index
  end

  def account
    @user = User.find_by(id:current_user.id)
  end

  def edit
    @user = User.find_by(id:current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name,:profile,:avatar))
      flash[:notice] = "Profile was successfully updated."
      redirect_to edit_user_path(@user.id)
    else
      render "edit"
    end
  end

end
