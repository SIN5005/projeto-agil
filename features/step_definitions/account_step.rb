When(/^I click on Contas$/) do
  click_on('Contas')
end

Then(/^Contas page should appears$/) do
  pending #expect(page).to have_current_path(category_list_path)
end

Then(/^shows accounts' list$/) do
  pending
end
