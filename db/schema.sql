CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER NOT NULL PRIMARY KEY,
    content TEXT NOT NULL,
    priority INTEGER,
    created_at INTEGER NOT NULL,
    updated_at INTEGER NOT NULL
);
