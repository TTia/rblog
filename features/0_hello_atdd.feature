Feature: Hello ATDD!
  Come studente
  Vorrei che l'applicazione rblog fosse visitabile
  Per poter documentare la mia tesi

  Scenario: Visita alla pagina iniziale
    Given Il sito è online
    When Navigo verso la home page
    Then Esiste un collegamento alla pagina dell'autore
    And Esiste un collegamento alla pagina dell'abstract

  Scenario Outline: Visita alle pagine statiche
    Given Il sito è online
    When Navigo verso "<url>"
    Then Il titolo "<title>" è presente
    And Esiste un collegamento alla home page
  Examples:
    | url            | title    |
    | /              | RBlog    |
    | /author.html   | Autore   |
    | /abstract.html | Abstract |