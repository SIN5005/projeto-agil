Given(/^I am on the Pluto homepage$/) do  
	visit(root_path)
end

When(/^click Cadastro$/) do  
	click_on('Cadastro')
end

Then(/^Users page shoud appears$/) do
	expect(page).to have_current_path(users_path+'/')
end


Given(/^I am on the Cadastro page$/) do
	visit(users_path)
	sleep(2)
end

When(/^I fill name, email, password and password confirmation and click on create user$/) do
	fill_in 'user[name]', :with => 'Herik Lima'
	fill_in 'user[email]', :with => 'heriklyma@hotmail.com'
	fill_in 'user[password]', :with => '1234'
	fill_in 'user[password_confirmation]', :with => '1234'
	click_on('Create User')
end

Then(/^save with shoud appears$/) do
	expect(page).to have_content('Salvo com sucesso.')
end
