class CartridgesController < ApplicationController
  before_action :set_cartridge, only: [:edit, :update, :destroy]

  def index
    @cartridges = Cartridge.all.order(:name)
  end

  def new
    @cartridge = Cartridge.new
  end

  def create
    @cartridge = Cartridge.new(params_cartridge)
    if @cartridge.save
      redirect_to cartridges_path, notice: "O cartucho #{@cartridge.name} foi criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cartridge.update(params_cartridge)
      redirect_to cartridges_path, notice: "O cartucho #{@cartridge.name} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    cartridge_name = @cartridge.name
    if @cartridge.destroy
      redirect_to cartridges_path, notice: "O cartucho #{cartridge_name} foi excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def set_cartridge
    @cartridge = Cartridge.find(params[:id])
  end

  def params_cartridge
    params.require(:cartridge).permit(:name, :kind)
  end
end
