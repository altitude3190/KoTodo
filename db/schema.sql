DROP TABLE tasks;
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    task TEXT NOT NULL,
    deadline INTEGER,
    created_at INTEGER NOT NULL,
    updated_at INTEGER NOT NULL
);
