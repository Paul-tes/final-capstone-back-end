require 'rails_helper'

RSpec.describe Reservation, type: :model do
  user = User.create(name: 'John Doe')
  room = Room.create(
    room_number: '101',
    capacity: 4,
    location: 'Building A',
    floor: '1st Floor',
    img: 'room1.jpg',
    price_per_day: 100.00,
    description: 'Cozy room with a view',
    comment: 'Great room for a comfortable stay',
    available: true,
    rating: 4,
    hosted_by: 'Host ABC',
    likes: 10
  )
  subject do
    Reservation.new(user:, room:, start_date: Time.now, end_date: Time.now, created_at: Time.now, updated_at: Time.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a start_date' do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a room_id' do
    subject.room_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
