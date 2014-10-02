#mock scaffolding
@cap6
Feature: Autenticazione su RBlog
  Come Autore di RBlog
  Vorrei che alcune operazioni sensibili siano permesse previa autenticazione
  Per poter garantire l'autenticità dei contenuti

  Background:
    Given apro RBlog

  @ignore
  Scenario: Possibilità di autenticarsi
    Given l'utente non è autenticato
    Then tramite l'intestazione posso autenticarmi

  @ignore
  Scenario: Autenticazione su RBlog
    Given l'utente non è autenticato
    Then tramite l'intestazione posso autenticarmi
    When mi autentico come "mattia@rblog.io"
    Then l'utente è autenticato
    And tramite l'intestazione non posso autenticarmi
    And tramite l'intestazione posso disconnettermi

  @ignore
  Scenario: Disconnessione da RBlog
    Given l'utente è autenticato
    When quando mi disconnetto
    Then tramite l'intestazione posso disconnettermi
    And l'utente non è autenticato

  @ignore
  Scenario: Possibilità di compiere operazioni sensibili
    Given l'utente è autenticato
    Then apro la pagina per la creazione di un nuovo post

  @ignore
  Scenario: Impossibilità di compiere operazioni sensibili
    Given l'utente non è autenticato
    Then non è visualizabile il collegamento alla pagina di creazione dei post
    And la pagina di creazione dei post non è raggiungibile