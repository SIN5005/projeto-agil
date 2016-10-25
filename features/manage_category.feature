Feature: Categoria page
        In order to work with Categoria 
        As an explicit system actor
        I want to interact with Categoria page

        Scenario: See Categoria List page
        Given I am logged in Pluto
        When I click on Categoria
        Then Categoria page should appears 
	And shows categories' list

        Scenario: Create a new category
        Given I am on the Categoria page
	When I click on "Nova Categoria"
        Then A form to insert a new category should appears
	When I fill title of the new category
	And click on "Save"
	Then I should be redirected back to Categoria page

