# Netflix SQL Analysis

Projekt analityczny oparty na oczyszczonym zbiorze danych Netflix z Kaggle.

Ten sam plik z danymi został wcześniej wykorzystany w projekcie **Netflix Search App** jako lokalny katalog filmów i seriali. W tym repo wykorzystuję go ponownie, ale tym razem do pracy z bazą SQLite i zapytaniami SQL.

## Cel projektu

Celem projektu jest przećwiczenie podstawowej analizy danych z użyciem SQL. Dane z pliku JSON zostały załadowane do bazy SQLite, a następnie podzielone na kilka tabel, żeby można było wykonywać zapytania, agregacje i proste analizy.

## Dane

Źródłowy zbiór danych pochodzi z Kaggle i zawiera informacje o filmach oraz serialach Netflix.

Dane zostały wcześniej oczyszczone przy użyciu Pythona i Pandas na potrzeby aplikacji **Netflix Search App**. Czyszczenie obejmowało m.in. poprawienie problemów z tekstem, usunięcie niepotrzebnych kolumn oraz przygotowanie pól takich jak gatunki, obsada, reżyserzy i kraje w formie list.

W tym projekcie używany jest plik:

`data/netflix_clean.json`

## Powiązany projekt

**Netflix Search App**  
GitHub: https://github.com/martakla/netflix-search-app  
Demo: https://netflix-search-app.vercel.app/

## Struktura bazy

Skrypt `scripts/load_data.py` tworzy bazę SQLite:

`database/netflix.db`

oraz tabele:

- `titles` — podstawowe informacje o filmach i serialach
- `title_directors` — reżyserzy przypisani do tytułów
- `title_cast` — obsada przypisana do tytułów
- `title_countries` — kraje przypisane do tytułów
- `title_genres` — gatunki przypisane do tytułów

Taki podział pozwala pracować z danymi w bardziej relacyjny sposób i ćwiczyć zapytania z agregacjami oraz łączeniem tabel.

## Zakres analizy

W projekcie analizuję m.in.:

- liczbę filmów i seriali,
- najczęściej występujące ratingi,
- zakres lat produkcji,
- najpopularniejsze gatunki,
- kraje z największą liczbą produkcji,
- liczbę produkcji według roku.

## Narzędzia

- Python
- Pandas
- SQLite
- SQL
- PyCharm
- DataGrip

## Struktura repozytorium

- `data/netflix_clean.json` — oczyszczony plik z danymi
- `scripts/load_data.py` — skrypt ładujący dane do SQLite
- `database/netflix.db` — baza SQLite utworzona na podstawie pliku JSON
- `sql/` — zapytania SQL
- `results/` — krótkie podsumowanie wyników analizy