require 'watir-webdriver'

Given(/^I am at the home page$/) do
  visit "/home"
end

When(/^I click at the account link$/) do
  click_link('Contas')
end

Then(/^The account page should appears$/) do
  page.should have_content("Nome")
  page.should have_content("Saldo")
  page.should have_content("Excluir")
  page.should have_content("Criar nova conta")
end

Given(/^I am on the account page$/) do
  visit "/accounts"
end

When(/^I click at create new account$/) do
  click_link('Criar nova conta')
end

Then(/^The create new account page should appears$/) do
  page.should have_content("Cadastro de Contas")
  page.should have_content("Nome")
  page.should have_content("Saldo")
  page.should have_content("Criar Conta")
end

Given(/^I am on the create an account page$/) do
  visit "/accounts/new"
end

When(/^I fill the name of an account and the balance$/) do
  page.should have_content("Criar Conta")
  fill_in('account[name]', with: 'Visa')
  fill_in('account[balance]', with: 10.0)
end

When(/^I click on the create account button$/) do
  click_button('Criar Conta')
end

Then(/^The account should be created$/) do
  page.should have_content("Visa")
  page.should have_content(10.0)
end

Then(/^I should see a message saying that the account was created$/) do
  page.should have_content("Salvo com sucesso!")
end

Then(/^I should remove the account$/) do
  click_button('Excluir')
  page.should have_no_content('Visa')
  page.should have_no_content(10.0)
end