require 'watir-webdriver'

browser = nil

Given(/^I am on the Browser$/) do
	browser = Watir::Browser.new :firefox
	puts 'Browser'
end

When(/^type Pluto site link$/) do  
	browser.goto('http://localhost:3000')
end

Then(/^Pluto homepage shoud appears$/) do
	puts 'Pluto - Financial App!'
	sleep(5)
	browser.close
end





Given(/^I am logged into the system$/) do
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000/login')	
end

When(/^I click on logout$/) do	
	browser.text_field(:name => "email").set 'heriklyma@hotmail.com'
	browser.text_field(:name => "password").set '1234'
	browser.button(:name => 'entrar').click
	browser.link(:text => "Sair").when_present.click
end

Then(/^Plutos homepage shoud appears$/) do
	expect(browser.text.include?("PLUTO - Financial App")).to be_truthy
	sleep(5)
	browser.close
end