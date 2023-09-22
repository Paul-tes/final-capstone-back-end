require 'rails_helper'

RSpec.describe Reservation, type: :model do
  user = User.create(name: 'John Doe')
  room = Room.create(location: 'San Francisco')
  subject do
    Reservation.new(user:, room:, start_date: Time.now, created_at: Time.now, updated_at: Time.now)
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
