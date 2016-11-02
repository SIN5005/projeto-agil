require 'watir-webdriver'

browser = nil

Given(/^I am on Pluto Homepage$/) do
	browser = Watir::Browser.new :firefox
	browser.goto('http://localhost:3000')	
end

When(/^click login link$/) do
	browser.link(:text => "Login").when_present.click
end

Then(/^login page shoud appears$/) do
	puts 'Login!'
	sleep(5)
	browser.close
end
