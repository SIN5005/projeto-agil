require 'watir-webdriver'

browser = nil
configureBdd = ConfigureBDD.new

Given(/^I am on the Browser$/) do
	browser = Watir::Browser.new :firefox	
end

When(/^type Pluto site link$/) do  
	browser.goto(configureBdd.getDefaultUrl)
end

Then(/^Pluto homepage shoud appears$/) do
	expect(browser.text.include?("PLUTO - Financial App")).to be_truthy	
	sleep(5)
	browser.close
end


Given(/^I am logged into the system$/) do
	browser = Watir::Browser.new :firefox
	browser.goto(configureBdd.getDefaultUrl + '/login')	
end

When(/^I click on logout$/) do	
	browser.text_field(:name => "email").set configureBdd.getGeneratedEmail
	browser.text_field(:name => "password").set '1234'
	browser.button(:name => 'entrar').click
	browser.link(:text => "Sair").when_present.click
end

Then(/^Plutos homepage shoud appears$/) do
	expect(browser.text.include?("PLUTO - Financial App")).to be_truthy
	sleep(5)
	browser.close
end