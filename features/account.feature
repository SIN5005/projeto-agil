Feature: Account page
	In order to manage the accounts
	As an explicit system actor
	I want to see the account page

	@registro
	Scenario: See account page
	Given I am at the home page
	When I click at the account link
	Then The account page should appears
	
	@registro
	Scenario: See create an account page
	Given I am on the account page
	When I click at create new account
	Then The create new account page should appears
	
	@registro
	Scenario: Create and Delete an account
	Given I am on the create an account page
	When I fill the name of an account and the balance
	And I click on the create account button
	Then The account should be created
	And I should see a message saying that the account was created
	Then I should remove the account
