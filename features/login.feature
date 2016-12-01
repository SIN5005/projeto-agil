Feature: Pluto login
	In order to access the system
	As an explicit system actor
	I want to see the login page

	Scenario: See Pluto login

	Given I am on Pluto Homepage

	When click login link

	Then login page shoud appears


	Scenario: Login

	Given I am on the Login pages

	When I fill email with a correct password

	Then I Should be redirected to main page


	Scenario: Temporary block

	Given I am on the Login page

	When I fill email with an incorrect password three times

	Then temporary block appears