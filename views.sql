use library;

-- VIEWS
CREATE VIEW author_view as
select a.author_id,
 a.first_name,
 a.last_name,
 a.birth,
 a.death,
 a.nobel,
 n.nation,
 count(b.book_id) as 'Number of books'
from author as a
join nationality as n on a.nationality_id = n.nationality_id
join book as b on a.author_id = b.author_id
group by a.author_id
order by count(b.book_id) desc;
select * from author_view;

CREATE VIEW book_view_full AS
    SELECT 
        b.book_id,
        b.title,
        b.year,
        b.isbn,
        b.pages,
        b.available,
        i.count,
        g.genre,
        b.description,
        a.author_id,
        a.last_name,
        p.publisher_id,
        p.publisher
    FROM
        book AS b
            JOIN
        author AS a ON b.author_id = a.author_id
            JOIN
        publisher AS p ON b.publisher_id = p.publisher_id
            JOIN
        inventory AS i ON b.book_id = i.book_id
            JOIN
        book_genre AS bg ON b.book_id = bg.book_id
            JOIN
        genre AS g ON bg.genre_id = g.genre_id;
select * from book_view_full;
create view book_view_short as
select
 b.title,
 b.isbn,
 b.pages,
 b.available,
 a.first_name,
 a.last_name
from book as b
join author as a
on b.author_id = a.author_id;

create view user_rental_view as
select
 u.user_id,
 u.username,
 u.password,
 u.first_name,
 u.last_name,
 u.email,
 u.telephone,
 u.active,
 coalesce(count(r.rental_id), 'never rent any') as 'Number of rentals total'
from user as u
join rental as r
on u.user_id = r.user_id
group by u.user_id;