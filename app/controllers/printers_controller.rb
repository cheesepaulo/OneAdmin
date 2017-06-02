class PrintersController < ApplicationController
  before_action :set_printer, only: [:edit, :update]

  def index
    @printers = Printer.all.order(:name)
  end

  def new
    @printer = Printer.new
  end

  def create
    @printer = PrinterService.create(params_printer)
    unless @printer.errors.any?
      redirect_to printers_path, notice: "A impressora #{@printer.name} foi criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @printer.update(params_printer)
      redirect_to printers_path, notice: "A impressora #{@printer.name} foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  private

  def set_printer
    @printer = Printer.find(params[:id])
  end

  def params_printer
    params.require(:printer).permit(:name)
  end
end
