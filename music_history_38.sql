-- 1. Query all of the entries in the Genre table
SELECT * FROM Genre;


-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist(ArtistId, ArtistName, YearEstablished) VALUES(null, 'Hanson', 1992);


-- 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album(AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES(null, 'Underneath', '4/20/2004', 3628, '3CG', 28, 7);

INSERT INTO Album(AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES(null, 'Shout It Out', '6/8/2010', 2969, '3CG', 28, 7);


-- 4. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES(null, 'Strong Enough to Break', 212, '4/20/2004', 7, 28, 23);

INSERT INTO Song(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES(null, 'Penny & Me', 243, '4/20/2004', 7, 28, 23);

INSERT INTO Song(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES(null, 'Give a Little', 225, '6/8/2010', 7, 28, 24);

INSERT INTO Song(SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES(null, 'Waiting for This', 197, '6/8/2010', 7, 28, 24);


-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT s.Title, a.Title, ar.ArtistName
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
WHERE ar.ArtistName = 'Hanson';


-- 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title, COUNT(s.SongId) AS 'Song Count'
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

SELECT a.Title AS 'Album Title', s.Title AS 'Song Title'
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

-- 7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT ar.ArtistName, COUNT(s.SongId)
FROM Song s 
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
GROUP BY s.ArtistId;


-- 8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT(s.SongId) AS 'Song Count'
FROM Song s 
LEFT JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId;


-- 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, MAX(AlbumLength)
FROM Album;


-- 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, MAX(SongLength)
FROM Song;


-- 11. Modify the previous query to also display the title of the album.
SELECT a.Title "Album Title", s.Title "Song Title", MAX(s.SongLength) "Song Length"
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId;