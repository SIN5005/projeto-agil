When(/^I click on Categoria$/) do
  click_on('Categorias')
end

Then(/^Categoria page should appears$/) do
  expect(page).to have_current_path(category_list_path)
end

Then(/^shows categories' list$/) do
  categories = CategoryController.new
  expect(page).to have_content(categories.list)
end

Given(/^I am on the Categoria page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^A form to insert a new category should appears$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have a form to fill a new category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I fill title of the new category$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^click on "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the success message: "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be redirected back to the Categoria page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

