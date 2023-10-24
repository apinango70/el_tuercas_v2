class Service < ApplicationRecord
  has_and_belongs_to_many :vehicles

  enum service_name: {
                      Mantenimiento: 'Mantenimiento',
                      Afinacion: 'Afinación',
                      Cambio_neumaticos: 'Cambio de neumáticos',
                      Alineado_balance: 'Alineado y balance',
                      Cambio_aceite_filtro: 'Cambio de aceite y filtro',
                      Reparacion_frenos: 'Reparación de frenos',
                      Latoneria_pintura: 'Latonería y pintura' }

  enum status: {
                en_progreso: 'en progreso',
                finalizado: 'finalizado' }

  validates :service_name, :status, presence: true
end
