#Capybara prende quanto eseguito sulla console di js e lo riporta
#I tag non sono molto bdd
@cap5
@clear_and_logout
Feature: Ricerca fra i post
  Come Lettore
  Vorrei poter ricercare i post su RBlog
  Per poter navigare fra i contenuti più velocemente

  Background:
    Given apro RBlog
    Given mi autentico come "mattia@rblog.io"

  Scenario: Autocompletamento della ricerca
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste
    When inserisco il testo "Lorem" da ricercare
    Then viene proposto il post "Lorem Ipsum"
    When inserisco il testo "lor" da ricercare
    Then viene proposto il post "Lorem Ipsum"
    When inserisco il testo "xyz" da ricercare
    Then non è proposto alcun post
    When inserisco il testo "L" da ricercare
    Then non è proposto alcun post

  Scenario: Ricerca di un post esistente
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste
    When ricerco "Lorem"
    Then il post "Lorem Ipsum" è leggibile
    When ricerco "lo"
    Then il post "Lorem Ipsum" è leggibile

  Scenario: Ricerca di un post non esistente
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste
    When ricerco "XXX"
    Then il post "Lorem Ipsum" non è leggibile