@cap5
Feature: Autenticazione su RBlog
  Come Lettore
  Vorrei poter ricercare i post su RBlog
  Per poter navigare fra i contenuti più velocemente

  Scenario: Barra di ricerca
    Given tramite l'intestazione è possibile effettuare una ricerca
    And non è possibile inserire del testo da ricercare
    When seleziono la ricerca
    Then è possibile inserire del testo da ricercare

  Scenario: Ricerca di un post esistente
    Given il post "Lorem Ipsum" esiste
    Given il post "Lorem Ipsum - 2" esiste
    When ricerco "Lorem Ipsum - 2"
    Then il post "Lorem Ipsum - 2" è leggibile su RBlog
    Then il post "Lorem Ipsum" non è leggibile su RBlog

  Scenario: Ricerca di un post non esistente
    When ricerco "Lorem Ipsum"
    Then il post "Lorem Ipsum" è leggibile su RBlog