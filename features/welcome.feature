Feature: Pluto homepage
	In order to access the system
	As an explicit system actor
	I want to see the homepage

	Scenario: See Pluto homepage

	Given I am on the Browser

	When type Pluto site link

	Then Pluto homepage shoud appears



	Scenario: Logout

	Given I am logged into the system

	When I click on logout

	Then Plutos homepage shoud appears