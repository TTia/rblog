@cap2
Feature: Introducendo il (S)CSS
  Per rendere l'esperienza di navigazione gradevole
  Come Lettore
  Vorrei che il sito esponesse una grafica omogenea

  Background:
    Given apro RBlog

  Scenario: intestazione e pié di pagina
    Given è presente l'intestazione
    And è presente il pié di pagina
    Then l'intestazione è posizionata all'inizio
    And il piè di pagina è posizionato alla fine

  Scenario: l'intestazione ed il piè di pagina
  hanno lo stesso schema di colori
    Given è presente l'intestazione
    And l'intestazione ha un colore di sfondo
    And è presente il pié di pagina
    And il pié di pagina ha un colore di sfondo
    Then intestazione e pié di pagina hanno lo stesso colore di sfondo

  Scenario Outline: tramite l'intestazione è possibile navigare
  alle pagine dell'autore e dell'abstract
    Given è presente l'intestazione
    And l'intestazione permette la navigazione
    Then posso navigare verso "<nome della pagina>"
  Examples:
    | nome della pagina |
    | Abstract          |
    | Autore            |
    | RBlog             |

  Scenario Outline: l'intestazione contiene il titolo della pagina
    Given navigo verso "<nome della pagina>"
    Given la pagina ha un titolo
    Then il titolo della pagina è uguale al <nome della pagina>
  Examples:
    | nome della pagina |
    | Abstract          |
    | Autore            |
    | RBlog             |

  Scenario: l'intestazione espone dei semplici effetti cromatici
    Given è presente l'intestazione
    And l'intestazione permette la navigazione
    And i collegamenti non hanno sfondo
    When il cursore si sposta sui collegamenti
    Then lo sfondo del collegamento cambia

  Scenario: i collegamenti raffigurati tramite immagini devono
            anche avere una descrizione testuale
  Given sono presenti dei collegamenti raffigurati tramite immagini
  Then ogni collegamento ha una descrizione testuale