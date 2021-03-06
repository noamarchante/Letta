CREATE TABLE events (
	id INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) NOT NULL,
	title VARCHAR(50) NOT NULL,
	description VARCHAR(250) NOT NULL,
	category VARCHAR(10) check(category in ('deportes', 'cine', 'teatro', 'tv', 'series', 'libros', 'ocio')) NOT NULL,
	eventDate datetime NOT NULL,
	capacity INTEGER NOT NULL,
	place VARCHAR(150) NOT NULL,
	img VARCHAR(256),
	idPartaker INTEGER NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE users (
	login VARCHAR(100) NOT NULL,
	password VARCHAR(64) NOT NULL,
	PRIMARY KEY (login)
);