@cap6
Feature: Autenticazione su RBlog
  Come Autore di RBlog
  Vorrei che alcune operazioni sensibili siano permesse previa autenticazione
  Per poter garantire l'autenticità dei contenuti

  Background:
    Given apro RBlog

  Scenario: Possibilità di autenticarsi
    Given l'utente non è autenticato
    Then tramite l'intestazione posso autenticarmi

  @logout
  Scenario: Autenticazione su RBlog
    Given l'utente non è autenticato
    Then tramite l'intestazione posso autenticarmi
    When mi autentico come "mattia@rblog.io"
    Then l'utente è autenticato
    And tramite l'intestazione non posso autenticarmi
    And tramite l'intestazione posso disconnettermi

  Scenario: Disconnessione da RBlog
    Given l'utente non è autenticato
    When mi autentico come "mattia@rblog.io"
    Then tramite l'intestazione posso disconnettermi
    When quando mi disconnetto
    And l'utente non è autenticato

  @logout
  Scenario: Possibilità di compiere operazioni sensibili avendo compiuto l'accesso
    Given l'utente non è autenticato
    When mi autentico come "mattia@rblog.io"
    Then posso navigare verso la pagina per la creazione di un nuovo post

  Scenario: Autenticazione fallita su RBlog
    Given l'utente non è autenticato
    Then tramite l'intestazione posso autenticarmi
    When mi autentico come "anonymous@rblog.io"
    Then l'utente non è autenticato
    And compare l'errore di autenticazione "Credenziali invalide."