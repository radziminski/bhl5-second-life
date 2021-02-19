DELETE FROM price_category;
ALTER SEQUENCE price_category_category_id_seq RESTART WITH 1;

INSERT INTO price_category (category_name)
VALUES
    ('SUPER_CHEAP'),
    ('CHEAP'),
    ('CUSTOM'),
    ('EXPENSIVE'),
    ('SUPER_EXPENSIVE');

DELETE FROM item_category;
ALTER SEQUENCE item_category_category_id_seq RESTART WITH 1;

INSERT INTO item_category (category_name)
VALUES
    ('SPORT'),
    ('ELECTRONICS'),
    ('FURNITURES'),
    ('TOYS'),
    ('OTHER');
