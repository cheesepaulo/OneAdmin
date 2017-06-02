class Department < ApplicationRecord
  has_many :printers
  validates_presence_of :name
end
