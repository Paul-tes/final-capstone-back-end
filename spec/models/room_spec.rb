require 'rails_helper'

RSpec.describe Room, type: :model do
  subject do
    Room.create(
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
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
end
