@cap5
Feature: Easter Egging
  Come Sviluppatore
  Vorrei che nel blog fosse presente un mio logo
  Per firmare il mio lavoro

  Background:
    Given apro RBlog

  Scenario: EasterEgg
    Given non è presente il logo nell'intestazione
    When clicco sull'area del pié di pagina
    Then è presente il logo