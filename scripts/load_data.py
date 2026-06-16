import json
import sqlite3
from pathlib import Path

import pandas as pd


BASE_DIR = Path(__file__).resolve().parent.parent
DATA_PATH = BASE_DIR / "data" / "netflix_clean.json"
DATABASE_DIR = BASE_DIR / "database"
DATABASE_PATH = DATABASE_DIR / "netflix.db"

DATABASE_DIR.mkdir(exist_ok=True)


def create_relation_table(data, source_column, target_column):
    rows = []

    for item in data:
        show_id = item.get("show_id")
        values = item.get(source_column, [])

        for value in values:
            if value:
                rows.append({
                    "show_id": show_id,
                    target_column: value
                })

    return pd.DataFrame(rows)


with open(DATA_PATH, "r", encoding="utf-8") as file:
    data = json.load(file)

df = pd.DataFrame(data)

titles_columns = [
    "show_id",
    "type",
    "title",
    "date_added",
    "release_year",
    "rating",
    "duration",
    "description"
]

titles_df = df[titles_columns].copy()

titles_df["date_added"] = pd.to_datetime(
    titles_df["date_added"],
    errors="coerce"
).dt.strftime("%Y-%m-%d")

directors_df = create_relation_table(data, "directors", "director")
cast_df = create_relation_table(data, "cast_list", "actor")
countries_df = create_relation_table(data, "countries", "country")
genres_df = create_relation_table(data, "genres", "genre")

conn = sqlite3.connect(DATABASE_PATH)

titles_df.to_sql("titles", conn, if_exists="replace", index=False)
directors_df.to_sql("title_directors", conn, if_exists="replace", index=False)
cast_df.to_sql("title_cast", conn, if_exists="replace", index=False)
countries_df.to_sql("title_countries", conn, if_exists="replace", index=False)
genres_df.to_sql("title_genres", conn, if_exists="replace", index=False)

conn.execute("CREATE INDEX IF NOT EXISTS idx_titles_show_id ON titles(show_id)")
conn.execute("CREATE INDEX IF NOT EXISTS idx_directors_show_id ON title_directors(show_id)")
conn.execute("CREATE INDEX IF NOT EXISTS idx_cast_show_id ON title_cast(show_id)")
conn.execute("CREATE INDEX IF NOT EXISTS idx_countries_show_id ON title_countries(show_id)")
conn.execute("CREATE INDEX IF NOT EXISTS idx_genres_show_id ON title_genres(show_id)")

conn.close()

print("Dane zostały załadowane do bazy SQLite.")
print(f"Baza danych: {DATABASE_PATH}")
print(f"Liczba tytułów: {len(titles_df)}")
print(f"Liczba reżyserów w relacji: {len(directors_df)}")
print(f"Liczba aktorów w relacji: {len(cast_df)}")
print(f"Liczba krajów w relacji: {len(countries_df)}")
print(f"Liczba gatunków w relacji: {len(genres_df)}")