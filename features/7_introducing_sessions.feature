@cap7
Feature: S

  Scenario: Sessioni
    Given comincio una sessione di testing
    Given mi autentico come "mattia@rblog.io" - sessione
    Then l'utente è autenticato - sessione
    When resetto la sessione di testing
    Then l'utente non è autenticato - sessione

  Scenario: Uso contemporaneo di RBlog