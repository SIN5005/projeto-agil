require 'watir-webdriver'

browser = nil

Given(/^I am on the Pluto homepage$/) do  
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000')
end

When(/^click Cadastro$/) do  
	browser.link(:text => "Cadastro").when_present.click
	browser.windows.last.use
end

Then(/^Users page shoud appears$/) do
	puts 'Users page!'	
	sleep(5)
	browser.close
end


Given(/^I am on the Cadastro page$/) do
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000/users')
end

When(/^I fill name, email, password and password confirmation and click on create user$/) do
	browser.text_field(:name => "user[name]").set 'Herik Lima'
	browser.text_field(:name => "user[email]").set 'heriklyma@hotmail.com'
	browser.text_field(:name => "user[password]").set '1234'
	browser.text_field(:name => "user[password_confirmation]").set '1234'
	browser.button(:name => 'commit').click
end

Then(/^save with shoud appears$/) do
	puts 'Salvo com sucesso.'   	
	sleep(5)
	browser.close
end