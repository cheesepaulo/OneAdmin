require 'ffaker'
namespace :utils do
  desc "Cria Usuarios Fake"
  task generate_users: :environment do
    puts "CRIANDO Usuarios Fake"
    10.times do
      User.create!(
        name: FFaker::NameBR::first_name,
        email: FFaker::Internet::email,
        password: '123456',
        role: [0,0,1,1,1].sample
      )
    end
    puts "USUARIOS Fake criados com sucesso"
  end
end
