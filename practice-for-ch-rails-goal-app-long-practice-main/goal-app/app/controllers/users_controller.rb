class UsersController < ApplicationController
  def new
    redner :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
end
