Feature: Category page
	In order to see category page
	As an explicit system actor
	I want to see the Category page
	
	
    Scenario: Add categories
    
    When I am in the categories page 
    
    And click in "new"
    
    And fill the form
    
    Then i should see my category in the list 