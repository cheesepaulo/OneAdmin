module CartridgesHelper
OptionsForKinds = Struct.new(:id, :name)
  def cartridge_options_for_kinds
    Cartridge.kinds_i18n.map do | key, value |
      OptionsForKinds.new(key, value)
    end
  end
end
