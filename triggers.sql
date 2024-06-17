USE library;

-- TRIGGERS

-- 1.) Add a row to library.inventory after insert to library.book
DELIMITER //

CREATE TRIGGER book_inventory_insert
AFTER INSERT ON library.book
FOR EACH ROW
BEGIN
    DECLARE t_inventory_id INT;
    
    SELECT inventory_id INTO t_inventory_id
    FROM library.inventory
    WHERE book_id = NEW.book_id;
    
    IF t_inventory_id IS NULL THEN
        INSERT INTO library.inventory (count, book_id)
        VALUES (5, NEW.book_id);
    ELSE 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error: Book already in inventory';
    END IF;
END //

DELIMITER ;