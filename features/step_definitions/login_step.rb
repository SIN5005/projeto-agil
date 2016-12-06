require 'watir-webdriver'

browser = nil
configureBdd = ConfigureBDD.new



Given(/^I am on Pluto Homepage$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl)
end

When(/^click login link$/) do
	browser.link(:text => "Login").when_present.click
end

Then(/^login page shoud appears$/) do
	expect(browser.text.include?("Login")).to be_truthy
	sleep(5)
	browser.close
end






Given(/^I am on the Login pages$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/login')	
end

When(/^I fill email with a correct password$/) do	
	browser.text_field(:name => "email").set configureBdd.getGeneratedEmail
	browser.text_field(:name => "password").set '1234'
	browser.button(:name => 'entrar').click
end

Then(/^I Should be redirected to main page$/) do
	expect(browser.text.include?("PLUTO - Financial App")).to be_truthy
	sleep(5)
	browser.close
end






Given(/^I am on the Login page$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/login')	
end

When(/^I fill email with an incorrect password three times$/) do
	for i in 1..4
		browser.text_field(:name => "email").set configureBdd.getGeneratedEmail
		browser.text_field(:name => "password").set '12345'
		browser.button(:name => 'entrar').click						
		sleep(2)
	end	
end

Then(/^temporary block appears$/) do
	expect(browser.text.include?("Conta temporariamente bloqueada.")).to be_truthy
	sleep(5)
	browser.close
end






Given(/^I am on the Logins page$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/login')	
end

When(/^I click on forgot password$/) do
	browser.link(:text => "Esqueceu sua senha? Clique aqui").when_present.click
end

Then(/^forgot password appears$/) do
	expect(browser.text.include?("Esqueci minha Senha")).to be_truthy
	sleep(5)
	browser.close
end


#bundle exec cucumber features/login.feature