@cap1
Feature: Hello ATDD!
  Per poter documentare la mia tesi
  Come Laureando
  Vorrei che RBlog fosse visitabile

  Scenario: Visita alla pagina iniziale
    Given apro RBlog
    Then posso visitare la pagina dell'autore
    And posso visitare la pagina dell'abstract

  Scenario Outline: Visita alle pagine statiche:
  la pagina dell'autore
  e la pagina relativa all'abstract della tesi
    Given apro RBlog
    When navigo verso "<nome della pagina>"
    Then la pagina è intitolata "<nome della pagina>"
    And posso tornare alla pagina iniziale
  Examples:
    | nome della pagina |
    | Autore            |
    | Abstract          |