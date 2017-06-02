class DepartmentsController < ApplicationController
  before_action :set_department, only: [:edit, :update]

  def index
    @departments = Department.all.order(:name)
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(params_department)
    if @department.save
      flash[:notice] = "Departamento salvo com sucesso!"
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @department.update(params_department)
      flash[:notice] = "Departamento atualizado com sucesso!"
      redirect_to departments_path
    else
      render :edit
    end
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def params_department
    params.require(:department).permit(:name)
  end
end
