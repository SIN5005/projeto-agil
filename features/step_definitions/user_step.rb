require 'watir-webdriver'

browser = Watir::Browser.new :firefox

Given(/^I am on the Pluto homepage$/) do	    	
  browser.goto('http://localhost:3000')
end

When(/^click Cadastro$/) do  
  browser.link(:text => "Cadastro").when_present.click
  browser.windows.last.use
end

Then(/^Users page shoud appears$/) do
  puts 'Users page!'
  sleep(10)
  browser.close
end