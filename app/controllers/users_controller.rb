class UsersController < ApplicationController
  
  # required to create registration form and receive input data from new user
  def new
    @user = User.new
  end
  
  #creates and saves new user
  def create
    @user = User.new(user_params)
    if @user.save
      #Success
    else
      #Error
    end
  end
  
end
