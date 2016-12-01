Feature: User page
	In order to see sing-in page
	As an explicit system actor
	I want to see the Cadastro page

	Scenario: See Cadastro page

	Given I am on the Pluto homepage

	When click Cadastro

	Then Users page shoud appears

	

	Scenario: Create a account

	Given I am on the Cadastro page

	When I fill name, email, password and password confirmation and click on create user

	Then save with success shoud appears


	Scenario: Change password error different passwords

	Given I log into the system

	When I click on Change Password

	Then change password should appears