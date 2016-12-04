=begin
require 'watir-webdriver'

browser = nil

Given(/^I am loged in Pluto homepage$/) do  	
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000/home')
end

When(/^click Account$/) do  
	browser.link(:text => "Contas").when_present.click	
end

Then(/^Accounts page shoud appears$/) do
	puts 'Accounts page!'	
	sleep(5)
	browser.close
end


Given(/^I am on the Account page$/) do
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000/accounts')
end

When(/^I fill name and balance and click on create account$/) do
	browser.text_field(:name => "account[name]").set 'Cartão de Crédito'
	browser.text_field(:name => "account[balance]").set '0.00'
	browser.button(:name => 'commit').click
end

Then(/^save with shoud appears$/) do
	puts 'Salvo com sucesso.'   	
	sleep(5)
	browser.close
end
=end