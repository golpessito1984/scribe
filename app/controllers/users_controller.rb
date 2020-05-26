class UsersController < ApplicationController
  before_action :set_user, only: :show

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login_as(@user)
      redirect_to user_path(@user), notice: 'User created successfully'
    else
      redirect_to signup_path, alert: 'User could not be created'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end

end