class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum de roles
  enum role: {  user: 'user',
                admin: 'admin',
  }, _default: 'user'

  # Relación uno a muchos con vehicles
  has_many :vehicles, dependent: :destroy

  # Método para obtener el nombre completo del usuario en la vista index de vehicles
  def full_name
    "#{firstname} #{lastname}"
  end

end
