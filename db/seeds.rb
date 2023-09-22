# Sample User data
User.create(name: "John Doe")
User.create(name: "Jane Smith")
User.create(name: "Michael Johnson")
User.create(name: "Emily Davis")

# Sample Room data
Room.create(
  room_number: "101",
  capacity: 4,
  location: "Building A",
  floor: "1st Floor",
  img: "room1.jpg",
  price_per_day: 100.00,
  description: "Cozy room with a view",
  comment: "Great room for a comfortable stay",
  available: true,
  rating: 4,
  hosted_by: "Host ABC",
  likes: 10
)

Room.create(
  room_number: "201",
  capacity: 2,
  location: "Building B",
  floor: "2nd Floor",
  img: "room2.jpg",
  price_per_day: 150.00,
  description: "Spacious and modern room",
  comment: "Highly recommended for a luxurious stay",
  available: true,
  rating: 5,
  hosted_by: "Host XYZ",
  likes: 5
)

Room.create(
  room_number: "301",
  capacity: 3,
  location: "Building C",
  floor: "3rd Floor",
  img: "room3.jpg",
  price_per_day: 120.00,
  description: "Elegant room with a balcony",
  comment: "Perfect for a relaxing getaway",
  available: true,
  rating: 4,
  hosted_by: "Host PQR",
  likes: 8
)

# Sample Reservation data
Reservation.create(
  user_id: User.first.id,
  room_id: Room.first.id,
  start_date: Date.today,
  end_date: Date.today + 3
)

Reservation.create(
  user_id: User.last.id,
  room_id: Room.last.id,
  start_date: Date.today + 1,
  end_date: Date.today + 4
)

# Additional Reservation data
3.times do
  Reservation.create(
    user_id: User.all.sample.id,
    room_id: Room.all.sample.id,
    start_date: Date.today + rand(5..10),
    end_date: Date.today + rand(11..15)
  )
end

