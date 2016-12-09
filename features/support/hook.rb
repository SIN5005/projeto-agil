Before('@registro') do
  visit "/users"
  fill_in('user_name', with: 'bruno')
  fill_in('user_email', with: 'brncasado@gmail.com')
  fill_in('user_password', with: '1234')
  fill_in('user_password_confirmation', with: '1234')
  click_button('Criar conta')
  visit "/login"
  fill_in('email', with: 'brncasado@gmail.com')
  fill_in('password', with: '1234')
  click_button('Entrar')
  page.should have_content("Bem vindo")
end

Before("@registra_conta") do
  visit "/accounts/new"
  fill_in("account[name]", with: "Cucumber")
  fill_in("account[balance]", with: 1.0)
  click_button("Criar Conta")
end

Before("@registra_categoria") do
  visit "/categories/new"
  fill_in("category_description", with: "Capybara")
  click_button("Salvar")
end

