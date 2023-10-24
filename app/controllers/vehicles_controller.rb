class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy ]

  # GET /vehicles or /vehicles.json
  def index
    # Obtener todos los usuarios con sus vehículos asociados
    @users = User.includes(:vehicles)
    @pagy, @users = pagy(User.order(created_at: :desc), items: 5) # Paginación
    #HAbilitar para usar paginación
    #@pagy, @users = pagy(User.order(created_at: :desc), items: 5) # Paginación
    # Preparar un array de [user, Vehículos] para la vista
    @users_with_vehicles = @users.map { |user| [user, user.vehicles] }

  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
    @vehicle = Vehicle.find(params[:id])
    @user = @vehicle.user
    @appointment = @vehicle.appointment
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @user = User.find(params[:user_id]) # Obtén el usuario correspondiente
    @vehicle.user_id = @user.id # Asigna el user_id del usuario al vehículo
    @vehicle.build_appointment # Esto crea un objeto Appointment asociado al vehículo
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
    @appointment = @vehicle.appointment || @vehicle.build_appointment
  end

  # POST /vehicles or /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = params[:vehicle][:user_id] # Asigna el user_id del formulario al vehículo
    @user = User.find(params[:vehicle][:user_id]) # Obtén el usuario correspondiente

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])
    @appointment = @vehicle.appointment

    # Actualiza la fecha de cita en el Appointment, no en el Vehicle
    if @appointment.update(appointment_date: params[:vehicle][:appointment_date])
      respond_to do |format|
        if @vehicle.update(vehicle_params)
          format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
          format.json { render :show, status: :ok, location: @vehicle }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @vehicle.errors, status: :unprocessable_entity }
        end
      end
    else
      # Maneja errores de validación del appointment si es necesario
      # ...
    end
  end


  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(
        :brand,
        :model,
        :plate_number,
        :user_id,
        appointment_attributes: [:id, :appointment_date]  # Asegúrate de incluir los atributos del appointment
      )
    end

end
