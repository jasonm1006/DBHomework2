-- Создание таблицы Исполнители
CREATE TABLE IF NOT EXISTS Artists (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Создание таблицы Жанры
CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL
);

-- Создание связи многие ко многим Исполнители - Жанры
CREATE TABLE IF NOT EXISTS ArtistsGenres (
	artist_id INTEGER REFERENCES Artists(artist_id),
	genre_id INTEGER REFERENCES Genres(genre_id),
	CONSTRAINT pk1 PRIMARY KEY (artist_id, genre_id) 
);

-- Создание таблицы Альбомы
CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_release DATE NOT NULL
);

-- Создание связи многие ко многим Альбомы - Исполнители
CREATE TABLE IF NOT EXISTS AlbumsArtists (
	album_id INTEGER REFERENCES Albums(album_id),
	artist_id INTEGER REFERENCES Artists(artist_id),
	CONSTRAINT pk2 PRIMARY KEY (album_id, artist_id)
);

-- Создание таблицы Треки
CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	duration TIME NOT NULL,
	album_id INTEGER REFERENCES Albums(album_id)
);

-- Создание таблицы Сборники
CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_release DATE NOT NULL
);

-- Создание связи многие ко многим Треки - Сборники
CREATE TABLE IF NOT EXISTS TracksCollections (
	track_id INTEGER REFERENCES Tracks(track_id),
	collection_id INTEGER REFERENCES Collections(collection_id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, collection_id)
);
	



