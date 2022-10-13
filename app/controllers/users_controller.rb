class UsersController < ApplicationController
  def index
    @users = User.all
  end




  # def create_user
  #   CreateBulkUserJob.perform_later
  #   redirect_to root_path
  # end
  def import

  User.import(params[:file])
  flash[:notice] = "Users Uploaded Sucessfully"
  redirect_to users_path
  end

  def import_page
    @users = User.all
  end

  def new
    @users = User.new
  end


  def create
    @users = User.new(user_params)
    if @users.save
      # UserMailer.with(user:current_user,user:@users).welcome_email.deliver_later
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

