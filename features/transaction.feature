Feature: Transaction Page
	 In order to include a transaction
	 As and explicit system actor
	 I want to see the transactions page

	 @registro
	 Scenario: See transactions page
	 Given I am at the site home page
	 When I click at the transactions link
	 Then the transactions page should appears
	 
	 @registra_conta
	 @registra_categoria
	 @registro
	 Scenario: Register a transaction
	 Given I am on transactions page
	 When I select account_id  with an account
	 When I fill amount with a value
	 When I select category_id with a category
	 And I click on the insert transaction button
	 Then I should see a message saying the transaction was registered
	 