module PrintersHelper
  OptionsForKinds = Struct.new(:id, :name)
  OptionsForStatus = Struct.new(:id, :name)

  def options_for_kinds
    Printer.kinds_i18n.map do | key, value |
      OptionsForKinds.new(key, value)
    end
  end

  def options_for_status
    Printer.statuses_i18n.map do | key, value |
      OptionsForStatus.new(key, value)
    end
  end
end
