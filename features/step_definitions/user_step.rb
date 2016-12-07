require 'watir-webdriver'

browser = nil
configureBdd = ConfigureBDD.new
generatedEmail = nil

Given(/^I am on the Pluto homepage$/) do  	
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl)
end

When(/^click Cadastro$/) do  
	browser.link(:text => "Cadastro").when_present.click	
end

Then(/^Users page shoud appears$/) do	
	expect(browser.text.include?("Criar Conta de Usuário")).to be_truthy
	sleep(5)
	browser.close
end


Given(/^I am on the Cadastro page$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/users')
end

When(/^I fill name, email, password and password confirmation and click on create user$/) do
	number = rand(1...1000000)
	generatedEmail = "heriklyma#{number}@hotmail.com"
	File.open("features/configuration/email", 'w') {|f| f.write(generatedEmail) }	
	browser.text_field(:name => "user[name]").set 'Herik Lima'
	browser.text_field(:name => "user[email]").set generatedEmail
	browser.text_field(:name => "user[password]").set '1234'
	browser.text_field(:name => "user[password_confirmation]").set '1234'
	browser.button(:name => 'commit').click
end

Then(/^save with success shoud appears$/) do
	expect(browser.text.include?("Salvo com sucesso.")).to be_truthy	
	sleep(5)
	browser.close
end


Given(/^I log into the system$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/login')
	browser.text_field(:name => "email").set generatedEmail
	browser.text_field(:name => "password").set '1234'
	browser.button(:name => 'entrar').click	
	sleep(2)
end

When(/^I click on Change Password$/) do	
	browser.link(:text => "Alterar Senha").when_present.click	
end

Then(/^change password should appears$/) do	
	expect(browser.text.include?("Alterar Senha")).to be_truthy	
	sleep(5)
	browser.close
end	