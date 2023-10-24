class Vehicle < ApplicationRecord
  belongs_to :user
  has_one :appointment, dependent: :destroy
  #Para ceptar atributos anidados
  accepts_nested_attributes_for :appointment
end
