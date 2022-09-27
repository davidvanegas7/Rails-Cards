# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[juan andrea jonathan jehicoob].each do |name|
  User.create email: "#{name}@test.com", password: '123456'
end
  
puts 'Users has been created'

%w[Alfabeto Animales Anime Astrología Bebidas Bebé Belleza Ciencia Cine Ciudad Comida Cultura Datos Deportes Finanzas Historia Hogar Industria Juegos Lenguaje Música Naturaleza Negocios Personas Personajes Plantas Programación Red Salud Seguridad Social Transporte Viajes Otros].each do |name|
  Category.create name:, description: '--'
end

puts 'Categories has been created'

[['Alfabeto', 'Create Deck 1', 'Test Cards Deck 1 - Seeds', 'jehicoob@test.com'],
['Animales', 'Create Deck 2', 'Test Cards Deck 2 - Seeds', 'jehicoob@test.com'],
['Anime', 'Create Deck 3', 'Test Cards Deck 3 - Seeds', 'andrea@test.com'],
['Ciencia', 'Create Deck 4', 'Test Cards Deck 4 - Seeds', 'andrea@test.com'],
['Comida', 'Create Deck 5', 'Test Cards Deck 5 - Seeds', 'jehicoob@test.com']].each do |category, name, description, owner|
  Deck.create(
    category: Category.find_by(name: category),
    name: name,
    description: description,
    owner: User.find_by(email: owner)
  )
end

puts 'Decks has been created'

[['Card 1 for Deck 1', 'Test card 1 for Deck 1 - Seeds', 'Create Deck 1'],
['Card 2 for Deck 1', 'Test card 2 for Deck 1 - Seeds', 'Create Deck 1'],
['Card 3 for Deck 1', 'Test card 3 for Deck 1 - Seeds', 'Create Deck 1'],
['Card 4 for Deck 1', 'Test card 4 for Deck 1 - Seeds', 'Create Deck 1'],
['Card 5 for Deck 1', 'Test card 5 for Deck 1 - Seeds', 'Create Deck 1']].each do |question, description, deck|
  Card.create(
    question: question,
    description: description,
    deck: Deck.find_by(name: deck),
    user: User.find_by(email: 'jehicoob@test.com')
  )
end

puts 'Cards for Deck 1 has been created'

[['Card 1 for Deck 2', 'Test card 2 for Deck 2 - Seeds', 'Create Deck 2'],
['Card 2 for Deck 2', 'Test card 2 for Deck 2 - Seeds', 'Create Deck 2'],
['Card 3 for Deck 2', 'Test card 3 for Deck 2 - Seeds', 'Create Deck 2'],
['Card 4 for Deck 2', 'Test card 4 for Deck 2 - Seeds', 'Create Deck 2'],
['Card 5 for Deck 2', 'Test card 5 for Deck 2 - Seeds', 'Create Deck 2']].each do |question, description, deck|
  Card.create(
    question: question,
    description: description,
    deck: Deck.find_by(name: deck),
    user: User.find_by(email: 'jehicoob@test.com')
  )
end

puts 'Cards for Deck 2 has been created'

[['Card 1 for Deck 3', 'Test card 3 for Deck 3 - Seeds', 'Create Deck 3'],
['Card 2 for Deck 3', 'Test card 2 for Deck 3 - Seeds', 'Create Deck 3'],
['Card 3 for Deck 3', 'Test card 3 for Deck 3 - Seeds', 'Create Deck 3'],
['Card 4 for Deck 3', 'Test card 4 for Deck 3 - Seeds', 'Create Deck 3'],
['Card 5 for Deck 3', 'Test card 5 for Deck 3 - Seeds', 'Create Deck 3']].each do |question, description, deck|
  Card.create(
    question: question,
    description: description,
    deck: Deck.find_by(name: deck),
    user: User.find_by(email: 'andrea@test.com')
  )
end

puts 'Cards for Deck 3 has been created'

[['Card 1 for Deck 4', 'Test card 4 for Deck 4 - Seeds', 'Create Deck 4'],
['Card 2 for Deck 4', 'Test card 2 for Deck 4 - Seeds', 'Create Deck 4'],
['Card 3 for Deck 4', 'Test card 3 for Deck 4 - Seeds', 'Create Deck 4'],
['Card 4 for Deck 4', 'Test card 4 for Deck 4 - Seeds', 'Create Deck 4'],
['Card 5 for Deck 4', 'Test card 5 for Deck 4 - Seeds', 'Create Deck 4']].each do |question, description, deck|
  Card.create(
    question: question,
    description: description,
    deck: Deck.find_by(name: deck),
    user: User.find_by(email: 'andrea@test.com')
  )
end

puts 'Cards for Deck 4 has been created'

[['Card 1 for Deck 5', 'Test card 5 for Deck 5 - Seeds', 'Create Deck 5'],
['Card 2 for Deck 5', 'Test card 2 for Deck 5 - Seeds', 'Create Deck 5'],
['Card 3 for Deck 5', 'Test card 3 for Deck 5 - Seeds', 'Create Deck 5'],
['Card 4 for Deck 5', 'Test card 4 for Deck 5 - Seeds', 'Create Deck 5'],
['Card 5 for Deck 5', 'Test card 5 for Deck 5 - Seeds', 'Create Deck 5']].each do |question, description, deck|
  Card.create(
    question: question,
    description: description,
    deck: Deck.find_by(name: deck),
    user: User.find_by(email: 'jehicoob@test.com')
  )
end

puts 'Cards for Deck 5 has been created'