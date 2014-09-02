class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  # required to create registration form and receive input data from new user
  def new
    @user = User.new
  end
  
  #creates and saves new user
  def create
    @user = User.new(user_params)
    if @user.save
      #Success
      flash[:success] = "You did this!"
      redirect_to @user
    else
      #Error
      flash[:error] = "Pffffff try again"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # Before filters
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." 
    end
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end
  
