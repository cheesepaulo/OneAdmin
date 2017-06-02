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
      flash[:notice] = "Usuário salvo com sucesso!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    remove_password_if_not_present

    if @user.update(params_user)
      flash[:notice] = "Usuário atualizado com sucesso!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Usuário excluído com sucesso!"
      redirect_to users_path
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
