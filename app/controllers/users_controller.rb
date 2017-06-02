class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.order(:name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to users_path, notice: "O usuario #{@user.name} foi criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    remove_password_if_not_present

    if @user.update(params_user)
      redirect_to users_path, notice: "O usuario #{@user.name} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    user_name = @user.name
    if @user.destroy
      redirect_to users_path, notice: "O usuario #{user_name} foi excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def remove_password_if_not_present
    passwd = params[:password]
    passwd_confirmation = params[:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:user] = params[:user].except(:password, :password_confirmation)
    end
  end
end
