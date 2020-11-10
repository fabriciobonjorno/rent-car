# Create user
puts "Criando Administrador"
User.create!(name: 'Fabricio', email: 'admin@admin.com', password: '123456',
password_confirmation: '123456')

# Create client
puts "Criando Cliente"
Client.create!(name: 'Fabricio', email: 'admin@admin.com', password: '123456',
password_confirmation: '123456', cpf: '12345678910')

# Create car
puts "Cadastrando carro 1"
Car.create!(model: 'Palio', brand: 'Fiat', board: 'xyz-2121', model_year: '2018', 
manufacture_year: '2019', rented: 'false')

puts "Cadastrando carro 2"
Car.create!(model: 'Gol', brand: 'Volws', board: 'xyz-2121', model_year: '2018', 
manufacture_year: '2019', rented: 'false')

puts "Cadastrando carro 3"
Car.create!(model: 'Meriva', brand: 'Chevrolet', board: 'xyz-2121', model_year: '2018', 
manufacture_year: '2019', rented: 'false')