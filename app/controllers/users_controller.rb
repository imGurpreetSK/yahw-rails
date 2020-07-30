class UsersController < ApplicationController

  before_action :set_user, only: %i[edit update]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(get_required_params)
    if @user.save
      session[:user_id] = @user.id
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
      redirect_to @user
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
