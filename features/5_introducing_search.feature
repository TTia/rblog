#Capybara prende quanto eseguito sulla console di js e lo riporta
@cap5
Feature: Ricerca fra i post
  Come Lettore
  Vorrei poter ricercare i post su RBlog
  Per poter navigare fra i contenuti più velocemente

  Background:
    Given apro RBlog
    Given mi autentico come "mattia@rblog.io"

  @clean_up_needed
  @logout_needed
  Scenario: Autocompletamento della ricerca
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste

  @clean_up_needed
  @logout_needed
  @ignore
  Scenario: Ricerca di un post esistente
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste
    When ricerco "Lorem"
    Then il post "Lorem Ipsum" è leggibile
    When ricerco "lo"
    Then il post "Lorem Ipsum" è leggibile

  @clean_up_needed
  @logout_needed
  @ignore
  Scenario: Ricerca di un post non esistente
    Given nell'intestazione è presente la barra di ricerca
    Given il post "Lorem Ipsum" esiste
    When ricerco "XXX"
    Then il post "Lorem Ipsum" non è leggibile