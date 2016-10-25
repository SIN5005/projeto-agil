Feature: Contas page
        In order to work with Contas 
        As an explicit system actor
        I want to interact with Contas page

        Scenario: See Contas List page
        Given I am signed-on Pluto
        When I click on Contas
        Then Contas page should appears 
	And shows accounts' list
