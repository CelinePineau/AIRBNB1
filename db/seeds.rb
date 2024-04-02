require "open-uri"

# Supprimer toutes les réservations, les maisons et les utilisateurs
Reservation.destroy_all
Home.destroy_all
User.destroy_all

# Création ou récupération des utilisateurs
user_1 = User.create(firstname: 'John', lastname: 'Doe', email: 'john@test.com', password: '123456')
user_2 = User.create(firstname: 'Jane', lastname: 'Doe', email: 'jane@test.com', password: '123456')
user_3 = User.create(firstname: 'Me', lastname: 'Nala', email: 'martine@test.com', password: '123456')


# Création des maisons
home_1 = Home.create(
  address: '10 rue machin, Paris',
  title: 'Maison de rêve 1',
  price: 100,
  user: user_2
)
photo_path_1 = Rails.root.join('app', 'assets', 'images', 'maison1.jpg')
home_1.photo.attach(io: File.open(photo_path_1), filename: 'maison1.jpg', content_type: 'image/jpeg')


home_2 = Home.create(
  address: '10 rue chose, Paris',
  title: 'Maison de rêve 2',
  price: 200,
  user: user_3
)
photo_path_2 = Rails.root.join('app', 'assets', 'images', 'maison2.jpg')
home_2.photo.attach(io: File.open(photo_path_2), filename: 'maison2.jpg', content_type: 'image/jpeg')

home_3 = Home.create(
  address: '10 rue martine, Paris',
  title: 'Maison de rêve 3',
  price: 300,
  user: user_2
)
photo_path_3 = Rails.root.join('app', 'assets', 'images', 'maison3.jpg')
home_3.photo.attach(io: File.open(photo_path_3), filename: 'maison3.jpg', content_type: 'image/jpeg')


# Création des réservations
Reservation.create(home: Home.first, user: user_2, start_date: Date.today, end_date: Date.today + 1, status: true)
Reservation.create(home: Home.last, user: user_1, start_date: Date.today + 2, end_date: Date.today + 3, status: true)
