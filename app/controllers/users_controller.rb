class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end
  def create


    if @users.save
      # UserMailer.post_created.deliver_later
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end




  end
  def ban
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
    else
      @user.lock_access!

    end
    redirect_to users_path
                # notice:  "User access locked: #{@user.access_locked?} "
  end
end

private
def user_params
  params.require(:user).permit(:role_id, :firstname, :lastname, :phone, :email, :password)
end

