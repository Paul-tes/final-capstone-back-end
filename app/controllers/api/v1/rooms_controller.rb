class Api::V1::RoomsController < ApplicationController
  before_action :set_room, only: %i[show update]

  def index
    @room = Room.where(available: true)
    render json: @room, status: :ok
  end

  def show
    if @room
      render json: @room, status: :ok
    else
      render json: { message: "Can't find a room with #{params[:id]} id" }, stauts: :ok
    end
  end

  def create
    room = Room.create(
      room_number: room_params[:room_no],
      capacity: room_params[:capacity],
      location: room_params[:location],
      floor: room_params[:floor],
      img: room_params[:img_url],
      price_per_day: room_params[:price].to_f,
      description: room_params[:description],
      comment: ' ',
      available: true,
      rating: 0,
      hosted_by: 'User_1',
      likes: 0
    )

    if room.save!
      render json: { message: 'Room has been successfully created' }, status: :ok
    else
      render json: { message: 'ERROR: Unable to create the Room' }, status: :unprocessable_entity
    end
  end

  def update
    room = Room.find_by(id: params[:id])
    if room
      if room.update(room_params)
        render json: { message: 'Room has been successfully updated' }, status: 200
      else
        render json: { message: 'ERROR: Unable to update the Room' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'ERROR: Room not found' }, status: :not_found
    end
  end

  def all
    rooms = Room.all
    render json: rooms, status: :ok
  end

  def destroy
    room = Room.find_by(id: params[:id])
    if room
      if room.destroy
        render json: { message: 'Room has been successfully deleted' }, status: 200
      else
        render json: { message: 'ERROR: Unable to delete the Room' }, status: :unprocessable_entity
      end
    else
      render json: { message: 'ERROR: Room not found' }, status: :not_found
    end
  end

  private

  def set_room
    @room = Room.find_by(id: params[:id])
  end

  def room_params
    params.require(:room).permit(%i[
                                   location
                                   capacity
                                   price
                                   room_no
                                   floor
                                   description
                                   img_url
                                 ])
  end
end
