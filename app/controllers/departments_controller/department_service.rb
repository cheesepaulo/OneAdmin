class DepartmentsController::DepartmentService
  attr_accessor :department

  def self.create(params_department)
    @department = Department.new(params_department)

    if @department.valid?
      @department.save!
    end

    @department
  end
end
