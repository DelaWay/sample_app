class UsersController < ApplicationController
  
  def index
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
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
  
