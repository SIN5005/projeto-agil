=begin
When(/^I am in the categories page$/) do
  visit '/categories'
end

When(/^click in "([^"]*)"$/) do |link|
  click_link(link)
end

When(/^fill the form$/) do
  fill_in 'Description', :with => "moradia"
  click_buttom 'Salvar'
end

Then(/^i should see my category in the list$/) do
  have_content('moradia')
end
=end