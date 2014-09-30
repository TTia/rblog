##HOOKS

Feature: Gestione dei post
  Come Laureando
  Vorrei poter inserire, modificare e rimuovere dei post su RBlog
  Per poter documentare la mia tesi

  Background:
    Given apro RBlog

  Scenario: Scrittura di un nuovo post
    Given apro la pagina per la creazione di un nuovo post
    When inserisco 'Lorem Ipsum' come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then il post 'Lorem Ipsum' è leggibile su RBlog

  Scenario: Cancellazione di un post
    Given il post 'Lorem Ipsum' è leggibile su RBlog
    When cancello il post 'Lorem Ipsum'
    And confermo la cancellazione
    Then il post 'Lorem Ipsum' non è leggibile su RBlog

  Scenario: Modifica di un post
    Given il post 'Lorem Ipsum' è leggibile su RBlog
    When modifico il post 'Lorem Ipsum'
    And inserisco 'Lorem Ipsum2' come titolo
    And inserisco 'Questo post è stato modificato' come contenuto
    And salvo il post
    Then il post 'Lorem Ipsum' non è leggibile su RBlog
    And il post 'Lorem Ipsum2' è leggibile su RBlog

  Scenario: Tentativo di scrittura di un post duplicato
    Given il post 'Lorem Ipsum' è leggibile su RBlog
    Given apro la pagina per la creazione di un nuovo post
    When inserisco 'Lorem Ipsum' come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then compare l'errore 'testo'
    And il post 'Lorem Ipsum' è leggibile su RBlog

  Scenario: Tentativo di creazione di un post con titolo invalido
    Given apro la pagina per la creazione di un nuovo post
    When inserisco 'L.I.' come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then compare l'errore 'testo'
    And il post 'L.I.' non è leggibile su RBlog

  Scenario: Tentativo di creazione di un post con contenuto invalido
    Given apro la pagina per la creazione di un nuovo post
    When inserisco 'Lorem Ipsum' come titolo
    And inserisco 'Body' come contenuto
    And salvo il post
    Then compare l'errore 'testo'
    And il post 'Lorem Ipsum' non è leggibile su RBlog