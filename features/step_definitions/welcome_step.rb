require 'watir-webdriver'

browser = Watir::Browser.new :firefox

Given(/^I am on the Browser$/) do
  puts 'Browser'
end

When(/^type Pluto site link$/) do  
  browser.goto('http://localhost:3000')
end

Then(/^Pluto homepage shoud appears$/) do
  puts 'Pluto - Financial App!'
  sleep(10)
  browser.close
end
