Given(/^I am on the Browser$/) do
	puts 'Browser'
end

When(/^type Pluto site link$/) do  
	visit(root_path)
end

Then(/^Pluto homepage shoud appears$/) do
	expect(page).to have_current_path(root_path)
end
