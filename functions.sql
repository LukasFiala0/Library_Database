USE library;

-- FUNCTIONS

-- 1.) is book in inventory?
DELIMITER //

CREATE FUNCTION is_book_available(f_book_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE available BOOLEAN;
    SELECT COUNT(*) > 0 INTO available
    FROM library.inventory
    WHERE book_id = f_book_id AND count > 0;
    RETURN available;
END //

DELIMITER ;

-- 2.) number of user rentals
DELIMITER //

CREATE FUNCTION number_rental_user (f_user_id INT)
RETURNS SMALLINT DETERMINISTIC
BEGIN
    DECLARE number_of_rentals SMALLINT;
    
    SELECT COUNT(r.rental_id) INTO number_of_rentals
    FROM library.rental AS r
    WHERE r.user_id = f_user_id;
    
    RETURN number_of_rentals;
END //

DELIMITER ;

