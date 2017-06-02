puts 'CADASTRANDO Administradores'
User.create!(name: 'Administrator', email: 'admin@admin.com', password: '123456',
            role: :full_access)
puts 'ADMINISTRADORES cadastrados com sucesso!'


puts 'CADASTRANDO Departamentos'
departments = ['Informática', 'Jurídico', 'Arquivo', 'Protocolo', 'Recursos Humanos']

departments.each do |department|
  Department.find_or_create_by!(name: department)
end
puts 'DEPARTAMENTOS cadastrados com sucesso!'
