require 'rails_helper'

RSpec.describe Room, type: :model do
  subject do
    Room.new(location: 'San Francisco', created_at: Time.now, updated_at: Time.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).to_not be_valid
  end
end
