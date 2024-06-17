USE library;

-- PROCEDURES  (TRANSACTION IMPLEMENTATION)

-- 1.) rent a book
DELIMITER //
CREATE PROCEDURE rent_book (
    IN p_user_id INT,
    IN p_book_id INT
)
BEGIN
    DECLARE p_count INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- V případě chyby provést rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred during the rental process.';
    END;

    -- Začít transakci
    START TRANSACTION;

    -- Kontrola dostupnosti knihy
    SELECT count INTO p_count
    FROM library.inventory
    WHERE book_id = p_book_id;

    IF p_count > 0 THEN
        -- Snížení počtu o 1
        UPDATE library.inventory
        SET count = count - 1
        WHERE book_id = p_book_id;

        -- Vložení nové řádky do tabulky rental
        INSERT INTO library.rental (date_1, date_2, date_max, user_id, book_id)
        VALUES (CURDATE(), NULL, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), p_user_id, p_book_id);

        -- Opětovná kontrola dostupnosti knihy
        SELECT count INTO p_count
        FROM library.inventory
        WHERE book_id = p_book_id;

        -- Pokud je počet knih nula, nastavit dostupnost na false
        IF p_count = 0 THEN
            UPDATE library.book
            SET available = 0
            WHERE book_id = p_book_id;
        END IF;
    ELSE
        -- Pokud kniha není dostupná, vyvolat uživatelskou chybu
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book is not available for rental.';
    END IF;

    -- Potvrdit transakci
    COMMIT;
END //
DELIMITER ;

-- 2.) return a book
DELIMITER //
CREATE PROCEDURE return_book (
    IN p_user_id INT,
    IN p_book_id INT
)
BEGIN
    DECLARE p_rental_id INT;
    DECLARE p_count INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        -- V případě chyby provést rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An error occurred during the return process.';
    END;

    -- Začít transakci
    START TRANSACTION;

    -- Najít aktivní záznam o půjčce pro daného uživatele a knihu
    SELECT rental_id INTO p_rental_id
    FROM library.rental
    WHERE user_id = p_user_id AND book_id = p_book_id AND date_max > CURDATE() AND rental.date_2 IS NULL
    LIMIT 1;

    -- Pokud byl záznam nalezen, nastavit datum vrácení (date_2)
    IF p_rental_id IS NOT NULL THEN
        UPDATE library.rental
        SET date_2 = CURDATE()
        WHERE rental_id = p_rental_id;

        -- Zvýšit počet knih v inventáři
        UPDATE library.inventory
        SET count = count + 1
        WHERE book_id = p_book_id;

        -- Opětovná kontrola dostupnosti knihy
        SELECT count INTO p_count
        FROM library.inventory
        WHERE book_id = p_book_id;

        -- Pokud je počet knih větší než nula, nastavit dostupnost na true
        IF p_count > 0 THEN
            UPDATE library.book
            SET available = 1
            WHERE book_id = p_book_id;
        END IF;
    ELSE
        -- Pokud záznam neexistuje, vyvolat uživatelskou chybu
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No active rental found for the given user and book.';
    END IF;

    -- Potvrdit transakci
    COMMIT;
END //
DELIMITER ;

-- 3.) user password change
DELIMITER //
CREATE PROCEDURE user_password_change(
	IN p_user_id INT,
    IN new_password VARCHAR(256)
    )
		BEGIN
			UPDATE library.user
            SET user.password = new_password
            WHERE user.user_id = p_user_id;
		END //
DELIMITER ;
		
-- 4.) user active change
DELIMITER //
CREATE PROCEDURE user_active_change (
	IN p_user_id INT,
    IN state BOOL
    )
		BEGIN 
			UPDATE library.user
            SET user.active = state
            WHERE user.user_id = p_user_id;
		END //
DELIMITER ;

-- 5.) insertion of a book
DELIMITER //
CREATE PROCEDURE book_insert (
    IN p_title VARCHAR(90),
    IN p_year SMALLINT,
    IN p_isbn VARCHAR(13),
    IN p_pages SMALLINT,
    IN p_description VARCHAR(200),
    IN p_available BOOL,
    IN p_author_id INT,
    IN p_publisher_id INT
	)
		BEGIN
			INSERT INTO library.book
			(title, year, isbn, pages, description, available, author_id, publisher_id) 
			VALUES
			(p_title, p_year, p_isbn, p_pages, p_description, p_available, p_author_id, p_publisher_id);
		END //
DELIMITER ;

-- 6.) insertion of an author
DELIMITER //
CREATE PROCEDURE author_insert (
	IN p_first_name VARCHAR(70),
    IN p_last_name VARCHAR(70),
    IN p_birth SMALLINT,
    IN p_death SMALLINT,
    IN p_nobel BOOL,
    IN p_nationality_id INT
    )
		BEGIN 
			INSERT INTO library.author
            (first_name, last_name, birth, death, nobel, nationality_id)
            VALUES
            (p_first_name, p_last_name, p_birth, p_death, p_nobel, p_nationality_id);
		END //
DELIMITER ;

-- 7.) check of late return of a book
DELIMITER //
CREATE PROCEDURE user_late_return ()
BEGIN
        SELECT 
        u.user_id,
        u.username,
        u.first_name,
        u.last_name,
        u.email,
        r.book_id,
        b.title,
        r.rental_id,
        r.date_1 AS rental_date,
        r.date_2 AS return_date,
        r.date_max AS max_return_date
    FROM 
        library.rental r
    INNER JOIN 
        library.user u ON r.user_id = u.user_id
    INNER JOIN 
        library.book b ON r.book_id = b.book_id
    WHERE 
        r.date_2 > r.date_max
        AND r.date_2 IS NOT NULL;
END //
DELIMITER ;

-- 8.) create a new user
DELIMITER //
CREATE PROCEDURE create_user (
	IN p_username VARCHAR(60),
    IN p_password VARCHAR(256),
    IN p_first_name VARCHAR(80),
    IN p_last_name VARCHAR(80),
    IN p_email VARCHAR(190),
    IN p_telephone CHAR(12),
    IN p_active BOOL
    )
		BEGIN
			INSERT INTO library.user 
            (username, password, first_name, last_name, email, telephone, active)
            VALUES
            (p_username, p_password, p_first_name, p_last_name, p_email, p_telephone, p_active);
		END //
DELIMITER //




			



