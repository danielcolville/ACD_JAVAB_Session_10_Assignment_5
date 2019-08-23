
use newschema;
-- 1
select * from ( select * from albums join artists on albums.album_artist_id=artists.artist_id ) b1,
( select * from albums join artists on albums.album_artist_id=artists.artist_id ) b2
where b2.album_year=b1.album_year AND b1.album_type='live' AND b2.album_type='compilation' AND b1.artist_id=b2.artist_id;
-- 2
select distinct artists.artist_name,album_artist_id from albums a1,artists
 where album_artist_id not in(select album_artist_id from albums a2  
 where a2.album_type='live' or a2.album_type='compilation' and a1.album_artist_id=a2.album_artist_id) AND artists.artist_id=a1.album_artist_id;
-- 3
select distinct al1.album_title,al1.album_rating from albums al1,artists a1
where a1.artist_type='band' and al1.album_rating > 
(select max(album_rating) from albums
 where a1.artist_id=albums.album_artist_id and albums.album_year<al1.album_year);
 
-- 4
 select distinct al1.album_title from albums al1, artists ar1
 where ar1.nationality='english' 
 and  ar1.artist_id=al1.album_artist_id
 and al1.album_rating > 
 (select avg(al2.album_rating) from albums al2 where al1.album_year=al2.album_year and al1.album_id<>al2.album_id);
 
 -- 5
 select al1.album_title,ar1.artist_name,t1.track_name from albums al1,artists ar1,tracks t1 where album_year>='1999' and
 t1.track_album_id=al1.album_id and al1.album_artist_id=ar1.artist_id and t1.track_length<154 and al1.album_rating >= 4;
 
 
 -- 6
 select sum(tr.track_length),track_album_id from albums al,tracks tr
 where al.album_year and al.album_year between 1990 and 1999 and al.album_id=tr.track_album_id group by tr.track_album_id;

-- 7

select * from artists ar
where ar.artist_id not in
 (select ar.artist_id from artists ar, albums al,albums al2 
 where ar.artist_id=al.album_artist_id
 and ar.artist_id=al2.album_artist_id and al.album_id<> al2.album_id  and al.album_type='studio' 
 and datediff(al.album_year,al2.album_year) >4 order by al.album_year);
 
 -- 8
 select artist_name from artists ar
 where 
 (
select count(album_type) from albums a1 where
a1.album_type<>'studio' and a1.album_artist_id=ar.artist_id
 )>
  (
select count(album_type) from albums a2 where
a2.album_type='studio' and a2.album_artist_id=ar.artist_id
 );
 
 -- 9
 select al.album_title, sum(t.track_length)
 from albums al,tracks t,artists ar
 where ar.artist_id=al.album_artist_id and al.album_id=t.track_album_id 
 and al.album_id in (
 select t2.track_album_id
 from tracks t2 group by t2.track_album_id having max(t2.track_number)=count(t2.track_number)
 )
 group by al.album_title;
 
 -- 10
 
 select ar.artist_name,al.album_title,al.album_rating,al.album_type from artists ar, albums al
 where al.album_artist_id=ar.artist_id
 having count(al.album_type='studio'>=3) and count(al.album_type='live'>=2) and
 count(al.album_type='compilation'>=1) and min(al.album_rating)>=3;
 
 -- 11
 
 select count(artist_name) from artists ar,albums al
 where ar.artist_id=al.album_artist_id and al.album_rating='5' 
 and ar.nationality='American' and artist_type='band'
 and  not exists(
 select al2.album_year
 from albums al2
 where al.album_artist_id=al2.album_artist_id
 and al2.album_year<al.album_year
 );
 -- 12
 
 	
 select *, truncate ( (lt3/tot*100),2) as P  from
 (
	select ar1.artist_name,ar1.artist_id, count(*) as lt3
	from albums al2,artists ar1
	where al2.album_rating<3 and ar1.artist_id=al2.album_artist_id 
	group by ar1.artist_id
	) as t1
     join
    (
	select ar1.artist_name,ar1.artist_id,count(*) as tot
    from albums al2, artists ar1 where ar1.artist_id=al2.album_artist_id group by ar1.artist_id
     )  as t2  
     on t1.artist_id=t2.artist_id  
     order by P;


-- 13
select ar1.artist_name,count(distinct album_id)
from albums al1,artists ar1
where al1.album_artist_id=ar1.artist_id and al1.album_type='studio' 
group by ar1.artist_id
having count(distinct album_id)  >= all (
select count(distinct album_id) 
from albums al2,artists ar2,artists ar1
where ar1.nationality=ar2.nationality and al2.album_type='studio' AND al2.album_artist_id=ar2.artist_id
group by ar2.artist_id
)
;


-- 14
select al1.album_title as Higher ,al1.album_rating, al2.album_title as Lower,al2.album_rating
from albums al1 join artists ar1 on ar1.artist_id=al1.album_artist_id,
albums al2 join artists ar2 on ar2.artist_id=al2.album_artist_id
where ar2.artist_name!=ar1.artist_name and al1.album_year=al2.album_year and al1.album_rating >al2.album_rating;


-- 15
select count(al1.album_rating)/trc as ratio, al1.album_title
from (albums al1 join 
( select t1.track_album_id, count(t1.track_number) as trc
from tracks t1
group by t1.track_album_id
)
as tc on tc.track_album_id=al1.album_id
)
order by ratio DESC
