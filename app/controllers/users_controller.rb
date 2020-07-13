class UsersController < ApplicationController

  before_action :set_user, only: %i[edit update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_required_params)
    if @user.save
      flash[:notice] = "Successfully created user #{@user.username}."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(get_required_params)
      flash[:notice] = 'User information successfully updated'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def get_required_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
