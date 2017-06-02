class Cartridge < ApplicationRecord
  enum kind: [:original, :recharged]

  validates_presence_of :name, :kind

  def name_with_kind
    "#{name} - #{kind}"
  end
end
