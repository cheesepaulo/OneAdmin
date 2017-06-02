class Printer < ApplicationRecord
  belongs_to :department

  enum kind: [:laser, :inkjet]
  enum status: [:active, :inactive]

  validates_presence_of :name, :ip_address, :status, :kind
end
