class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.reservations.includes([:room]).order(id: :desc), status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save!
      render json: { message: "Reservation for #{current_user.name} has been successfullu created" }, status: :ok
    else
      render json: { message: 'ERROR: Unable to create Reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    if reservation
      if reservation.destroy
        render json: { message: 'Reservation has been successfully deleted' }, status: :ok
      else
        render json: { message: 'ERROR: Unable to delete the Reservation' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'ERROR: Reservation not found' }, status: :not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation)
      .permit(:start_date, :end_date, :room_id)
      .merge(user_id: current_user.id)
  end
end
