class Api::V1::ReservationsController < ApplicationController
  def index
    render json: current_user.reservation.includes([:room]).order(id: :desc), status: :ok
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save!
      render json: { message: 'Room has been successfullu created' }, status: :ok
    else
      render json: { message: 'ERROR: Unable to create Reservation' }, status: :unprocessable_entity
    end
  end

  def destroy
    reservation = Reservation.find_by(id: params[:id])
    if reservation
      if reservation.destroy
        reservation json: { message: 'Reservation has been successfully deleted' }, status: 200
      else
        reservation json: { message: 'ERROR: Unable to delete the Reservation' }, status: :unprocessable_entity
      end
    else
      reservation json: { message: 'ERROR: Reservation not found' }, status: :not_found
    end
  end

  private

  def reservation_params
    params.require(:reservation)
  end
end
