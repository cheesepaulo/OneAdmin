class PrintersController::PrinterService
  attr_accessor :printer

  def self.create(params_printer)
    @printer = Printer.new(params_printer)

    if @printer.valid?
      @printer.save!
    end

    @printer
  end
end
