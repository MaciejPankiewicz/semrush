Feature: Bing Search with Category Filtering
  As a Bing user,
  I want to search for a keyword and apply a content category filter,
  So that I can view relevant results specific to my selection.

  Scenario Outline: Search for a keyword and apply a content filter
    Given I am on the Bing homepage
    When I enter "<search_term>" in the search bar
    And I click the search button
    And I click on the "<filter_category>" filter
    Then I should see search results related to "<search_term>" under "<filter_category>"

    Examples:
      | search_term | filter_category |
      | semrush     | shop            |
      | semrush     | images          |
      | semrush     | video           |
      | semrush     | local           |
      | semrush     | news            |
