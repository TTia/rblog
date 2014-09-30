@cap3
Feature: Gestione dei post
  Come Laureando
  Vorrei poter inserire, modificare e rimuovere dei post su RBlog
  Per poter documentare la mia tesi

  Background:
    Given apro RBlog

  @clean_up_needed
  Scenario: Scrittura di un nuovo post
    Given il post "Lorem Ipsum" non è leggibile su RBlog
    And apro la pagina per la creazione di un nuovo post
    When inserisco "Lorem Ipsum" come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then il post "Lorem Ipsum" è stato creato con successo
    And il post "Lorem Ipsum" è leggibile su RBlog

  Scenario: Cancellazione di un post
    Given il post "Lorem Ipsum" esiste
    When cancello il post "Lorem Ipsum"
    Then il post "Lorem Ipsum" è stato cancellato con successo
    And il post "Lorem Ipsum" non è leggibile su RBlog

  @clean_up_needed
  Scenario: Modifica di un post
    Given il post "Lorem Ipsum2" esiste
    When modifico il post "Lorem Ipsum2"
    And inserisco "Lorem Ipsum" come titolo
    And inserisco "Questo post è stato modificato" come contenuto
    And salvo il post
    Then il post "Lorem Ipsum2" non è leggibile su RBlog
    And il post "Lorem Ipsum" è leggibile su RBlog

  @clean_up_needed
  Scenario: Tentativo di creazione di un post duplicato
    Given il post "Lorem Ipsum" esiste
    Given apro la pagina per la creazione di un nuovo post
    When inserisco "Lorem Ipsum" come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then compare l'errore "Esiste già un post con questo titolo"
    And il post "Lorem Ipsum" è leggibile su RBlog

  Scenario: Tentativo di creazione di un post con titolo invalido
    Given apro la pagina per la creazione di un nuovo post
    When inserisco "L.I." come titolo
    And inserisco del testo riempitivo come contenuto
    And salvo il post
    Then compare l'errore "Il titolo deve essere almeno di 5 caratteri"
    And il post "L.I." non è leggibile su RBlog

  Scenario: Tentativo di creazione di un post con contenuto invalido
    Given apro la pagina per la creazione di un nuovo post
    When inserisco "Lorem Ipsum" come titolo
    And inserisco "Body" come contenuto
    And salvo il post
    Then compare l'errore "L'articolo deve essere almeno di 5 caratteri"
    And il post "Lorem Ipsum" non è leggibile su RBlog