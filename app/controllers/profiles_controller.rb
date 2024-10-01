class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path(@user.username), notice: "Profile updated successfully"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :username, :bio)
  end
end
