# language: it
@cap4
@clear_and_logout
Funzionalità: Navigazione dei post
  Come Lettore
  Vorrei che nel blog fossero presenti dei post
  Per potermi informare

  Contesto:
    Dato apro RBlog
    Dato mi autentico come "mattia@rblog.io"

  Scenario: Visualizzazione dei post
    Dato il post "Lorem Ipsum" esiste
    Allora il post "Lorem Ipsum" è leggibile su RBlog
    Allora ogni post ha un titolo
    E ogni post ha dei dettagli
    E ogni post ha del contenuto

  Scenario: Espansione dell'anteprima di un post
    Dato il post "Lorem Ipsum" esiste
    E il post "Lorem Ipsum" è leggibile su RBlog
    Allora il contenuto del post "Lorem Ipsum" è un'anteprima dell'intero post
    Quando espando il post "Lorem Ipsum"
    Allora il contenuto del post "Lorem Ipsum" rappresenta l'intero post

  Scenario: Lettura di un post
    Dato il post "Lorem Ipsum" esiste
    E il post "Lorem Ipsum" è leggibile su RBlog
    Quando espando il post "Lorem Ipsum"
    Allora il titolo del post è "Lorem Ipsum"
    E il contenuto del titolo include "Lorem ipsum"
    E la pagina è intitolata "Lorem Ipsum"
    E posso tornare alla pagina iniziale