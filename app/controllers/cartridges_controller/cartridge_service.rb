class CartridgesController::CartridgeService
  attr_accessor :cartridge

  def self.create(params_cartridge)
    @cartridge = Department.new(params_cartridge)

    if @cartridge.valid?
      @cartridge.save!
    end

    @cartridge
  end
end
