class Printer < ApplicationRecord
  validates_presence_of :name, :kind, :status, :leased
  belongs_to :department

  enum kind: [:laser, :inkjet]
  enum status: [:active, :inactive]
end
