-- Define the games table
CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  platform VARCHAR(255),
  last_played_at TIMESTAMP
);

-- Define the authors table
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);
