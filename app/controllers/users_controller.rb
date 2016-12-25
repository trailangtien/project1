class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
    # @users = User.where(activated: FILL_IN).paginate(page: params[:page])
   
    @users = User.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
 
  end


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Wellcome"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :phone, :email, :address, :password, :password_confirmation)
  end
  
  def logged_in_user
      unless is_logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end
  
  def admin_user
      redirect_to(root_url) unless current_user.is_admin?
  end
  
end