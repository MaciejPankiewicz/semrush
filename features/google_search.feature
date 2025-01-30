Feature: Google Search with Date Filtering
  As a Google user,
  I want to search for a keyword and apply a date filter,
  So that I can view relevant results specific to my date selection.

  Scenario: Verify search results for "prowly" after applying a date filter
    Given the user navigates to "https://www.google.com"
    When the user enters "prowly" in the search bar
    And the user clicks the "Google Search" button
    And the user opens the "Tools" menu
    And the user selects a date filter "Past week"
    Then the search results should be updated
    And the search results should only contain articles from the past week


 Scenario: Ensure the date filter is applied correctly
    Given the user navigates to "https://www.google.com"
    When the user enters "prowly" in the search bar
    And the user clicks the "Google Search" button
    And the user opens the "Tools" menu
    And the user selects a date filter "Past 24 hours"
    Then each search result should have a publication date within the last 24 hours

Scenario: Validate that the "Custom range" date filter works correctly
    Given the user navigates to "https://www.google.com"
    When the user enters "prowly" in the search bar
    And the user clicks the "Google Search" button
    And the user opens the "Tools" menu
    And the user selects the "Custom range" option
    And the user sets the date range from "January 1, 2024" to "January 15, 2024"
    Then the search results should only display articles published between "January 1, 2024" and "January 15, 2024"