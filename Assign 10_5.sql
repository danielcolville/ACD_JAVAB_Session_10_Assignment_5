use newschema;

select * from ( select * from albums join artists on albums.album_artist_id=artists.artist_id ) b1,
( select * from albums join artists on albums.album_artist_id=artists.artist_id ) b2
where b2.album_year=b1.album_year AND b1.album_type='live' AND b2.album_type='compilation' AND b1.artist_id=b2.artist_id;

select distinct artists.artist_name,album_artist_id from albums a1,artists
 where album_artist_id not in(select album_artist_id from albums a2  
 where a2.album_type='live' or a2.album_type='compilation' and a1.album_artist_id=a2.album_artist_id) AND artists.artist_id=a1.album_artist_id;

select distinct al1.album_title,al1.album_rating from albums al1,artists a1
where al1.album_rating > 
(select max(album_rating) from albums
 where a1.artist_id=albums.album_artist_id and albums.album_year<al1.album_year);
 

 select distinct al1.album_title from albums al1, artists ar1
 where ar1.nationality='english' 
 and  ar1.artist_id=al1.album_artist_id
 and al1.album_rating > 
 (select avg(al2.album_rating) from albums al2 where al1.album_year=al2.album_year and al1.album_id<>al2.album_id);
 
 select al1.album_title,ar1.artist_name from albums al,artists ar1 where album_year<='1999';
 
 select count(album_rating) from albums group by(album_artist_id,album_rating<3);