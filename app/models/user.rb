class User < ApplicationRecord
  enum role: [:full_access, :restricted_accesss]

  scope :with_full_access, -> { where(role: 'full_access')}
  scope :with_restricted_access, -> { where(role: 'restricted_accesss')}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
