@cap4
Feature: Navigazione dei post
  Come Lettore
  Vorrei che nel blog fossero presenti dei post
  Per potermi informare

  Background:
    Given apro RBlog

  @clean_up_needed
  Scenario: Visualizzazione dei post
    Given il post "Lorem Ipsum" esiste
    And il post "Lorem Ipsum" è leggibile su RBlog
    Then ogni post ha un titolo
    And ogni post ha del contenuto

  @clean_up_needed
  Scenario: Espansione dell'anteprima di un post
    Given il post "Lorem Ipsum" esiste
    And il post "Lorem Ipsum" è leggibile su RBlog
    Then il contenuto del post "Lorem Ipsum" è un'anteprima dell'intero post
    When espando il post "Lorem Ipsum"
    Then il contenuto del post "Lorem Ipsum" rappresenta l'intero post

  @clean_up_needed
  Scenario: Lettura di un post
    Given il post "Lorem Ipsum" esiste
    And il post "Lorem Ipsum" è leggibile su RBlog
    When espando il post "Lorem Ipsum"
    Then il titolo del post è "Lorem Ipsum"
    And il contenuto del titolo inizia con "Lorem ipsum"
    And il contenuto del titolo termina con "quis enim."
    And la pagina è intitolata "Lorem Ipsum"
    And posso tornare alla pagina iniziale

  Scenario: Navigazione fra i post presenti su RBlog
    Given il post "Lorem Ipsum" esiste
    And il post "Lorem Ipsum" è leggibile su RBlog
    When espando il post "Lorem Ipsum"
    Then il titolo del post è "Lorem Ipsum"
    And il contenuto del titolo inizia con "Lorem ipsum"
    And il contenuto del titolo termina con "quis enim."
    And la pagina è intitolata "Lorem Ipsum"
    And posso tornare alla pagina iniziale

