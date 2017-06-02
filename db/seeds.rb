puts 'CADASTRANDO Administradores'
User.create(name: 'Administrator', email: 'admin@admin.com', password: '123456',
            kind: :full_access)

puts 'ADMINISTRADORES cadastrados com sucesso!'
