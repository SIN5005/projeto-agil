# coding: utf-8
require "watir-webdriver"

###Scenario: See transactions page
Given(/^I am at the site home page$/) do
  visit "/home"
end
When(/^I click at the transactions link$/) do
  click_link("Transações")
end
Then(/^the transactions page should appears$/) do
  page.should have_content("Conta:")
  page.should have_content("Quantia:")
  page.should have_content("Categoria:")
end


###Scenario: Register a transaction
Given(/^I am on transactions page$/) do
  visit "/transactions/new"
end
When(/^I select account_id  with an account$/) do
  find("#transaction_account_id").find(:xpath, "option[2]").click
end
When(/^I fill amount with a value$/) do
  fill_in("transaction_amount", with: 12.54)
end
When(/^I select category_id with a category$/) do
    find("#transaction_category_id").find(:xpath, "option[2]").click
end
When(/^I click on the insert transaction button$/) do
  click_button('Incluir')
end
Then(/^I should see a message saying the transaction was registered$/) do
  page.should have_content("Transação registrada")
end

