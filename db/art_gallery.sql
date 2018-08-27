DROP TABLE exhibits;
DROP TABLE artists;


CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE exhibits (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  artist_id INT4 REFERENCES artists(id)
);
