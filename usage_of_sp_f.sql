use library;

-- test of function is_book_available
select is_book_available('test');
select is_book_available(1);
select is_book_available(100);


-- test of procedure author_insert
CALL author_insert('John', 'Tolkien', 1892, 1973, 0, 2);
select * from author;

-- test of procedure book_insert
CALL book_insert('The Lord of the Rings, Fellowshio of the Ring ', 1954, '9788845292613', 1077, 'The story began as a sequel to Tolkien''s 1937 children''s book The Hobbit, but eventually developed into a much larger work. The Lord of the Rings is one of the best-selling books ever written.', 1, 30, 2);
select * from book;

-- test of procedure create_user
CALL create_user ('lukas00', 'nothashedpasswordYET', 'Lukas', 'Fiala', 'lukas.fiala@gmail.com', '420123456789', 1);
select * from user;

-- test of procedure user_active_change
CALL user_active_change (6,0);
select * from user;

-- test of procedure user_password_change
CALL user_password_change (6, 'nothashedYET');
select * from user;

-- test of procedure rent_book
CALL rent_book (5, 32);   -- and once again -> should return error message (planned) multiple execute
select * from inventory;
select * from rental;
select * from book;

-- test of procedure return_book
CALL return_book (5,32);   -- (error messageS evoked correctly too)  multiple execute
select * from inventory;
select * from rental;
select * from book;

update rental
set date_2 = '2024-07-17'
where rental_id = 5;

-- test of procedure user_late_return
CALL user_late_return ();

-- test of function number_rental_user
select number_rental_user(5);







