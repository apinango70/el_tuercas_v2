class Vehicle < ApplicationRecord
  belongs_to :user
  has_one :appointment, dependent: :destroy
  #Para ceptar atributos anidados
  accepts_nested_attributes_for :appointment
  belongs_to :service
  has_and_belongs_to_many :services

  validates :brand, :model, :plate_number, presence: true
end
