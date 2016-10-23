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
