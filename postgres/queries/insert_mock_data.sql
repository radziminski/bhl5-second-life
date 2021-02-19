--- INSERT MOCK user_profile
DELETE FROM user_profile;
ALTER SEQUENCE user_profile_user_id_seq RESTART WITH 1;

insert into user_profile (user_name, user_lastname, radius) values ('Wes', 'Buzine', 1.942);
insert into user_profile (user_name, user_lastname, radius) values ('Maren', 'Matveyev', 1.514);
insert into user_profile (user_name, user_lastname, radius) values ('Peterus', 'Dempsey', 1.672);
insert into user_profile (user_name, user_lastname, radius) values ('Napoleon', 'Joddens', 1.403);
insert into user_profile (user_name, user_lastname, radius) values ('Curtis', 'Alvis', 1.182);
insert into user_profile (user_name, user_lastname, radius) values ('Gerick', 'Levi', 1.91);
insert into user_profile (user_name, user_lastname, radius) values ('Avigdor', 'Brough', 1.215);
insert into user_profile (user_name, user_lastname, radius) values ('Haywood', 'Cristofano', 1.029);
insert into user_profile (user_name, user_lastname, radius) values ('Yanaton', 'Butland', 1.884);
insert into user_profile (user_name, user_lastname, radius) values ('Odey', 'Heimes', 1.422);
insert into user_profile (user_name, user_lastname, radius) values ('Zorah', 'Fruser', 1.385);
insert into user_profile (user_name, user_lastname, radius) values ('Marlene', 'Thamelt', 1.93);
insert into user_profile (user_name, user_lastname, radius) values ('Laurie', 'Hatter', 1.825);
insert into user_profile (user_name, user_lastname, radius) values ('Gerta', 'McFarlane', 1.013);
insert into user_profile (user_name, user_lastname, radius) values ('Raina', 'Sagg', 1.094);
insert into user_profile (user_name, user_lastname, radius) values ('Kelley', 'Papps', 1.359);
insert into user_profile (user_name, user_lastname, radius) values ('Austin', 'Mc Queen', 1.373);
insert into user_profile (user_name, user_lastname, radius) values ('Missy', 'Reboul', 1.313);
insert into user_profile (user_name, user_lastname, radius) values ('Karlik', 'Kas', 1.874);
insert into user_profile (user_name, user_lastname, radius) values ('Gerhardt', 'Disbrow', 1.743);

--- INSERT MOCK advertisement
DELETE FROM advertisement;
ALTER SEQUENCE advertisement_advertisement_id_seq RESTART WITH 1;

insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Father of Invention', 'Destruction of chorioretinal lesion by laser photocoagulation', 39.81889, 117.42361, '2021-03-29', 10, 1);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('I''m Not Scared (Io non ho paura)', 'Removal of implant of breast', -7.2139764, 106.8740816, '2020-08-02', 8, 2);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Craig Ferguson: A Wee Bit o'' Revolution', 'Other incision of cranial and peripheral nerves', -11.7871994, 43.2702822, '2020-08-31', 20, 4);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Pope''s Toilet, The (El bano del Papa)', 'Endovascular replacement of unspecified heart valve', 4.7406191, 7.0848063, '2020-04-22', 1, 2);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Equinox Flower (Higanbana)', 'Ophthalmoscopy', 61.1174188, 28.5010914, '2021-02-28', 17, 2);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Running Man, The', 'Suture of corneal laceration', 36.9635917, 56.3712327, '2021-03-13', 20, 1);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('New Year''s Eve', 'Other respiratory procedures', 40.7038775, -74.16442, '2020-04-11', 3, 2);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Kid Brother, The', 'Other intubation of respiratory tract', -10.8237579, -65.3688335, '2020-06-01', 3, 5);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('I Love Your Work', 'Relaxation of scar or web contracture of skin', 23.12911, 113.264385, '2020-10-29', 7, 5);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Cursed', 'Color vision study', -7.7798092, 110.3562018, '2020-03-25', 3, 3);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Chicago', 'Microscopic examination of specimen from other site, other microscopic examination', -8.3120496, 123.2814017, '2020-05-19', 13, 3);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('No Way Out', 'Operations on other structures adjacent to valves of heart', 1.0087005, 100.2656209, '2021-03-02', 2, 4);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Double, The', 'Biopsy of spermatic cord, epididymis, or vas deferens', -7.3756404, 112.758414, '2021-01-18', 4, 1);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Mad Max', 'Biopsy of bone, radius and ulna', 11.8042973, 15.8613233, '2021-02-05', 4, 2);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Yellow', 'Percutaneous [endoscopic] gastrojejunostomy', 31.848896, 35.159029, '2020-09-29', 11, 1);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Elephant Boy', 'Free skin graft, not otherwise specified', 28.274601, 88.520031, '2020-09-08', 3, 3);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Cowboy', 'Other injection of locally-acting therapeutic substance into soft tissue of hand', 45.08338, -73.36585, '2020-08-08', 3, 4);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Horror Express', 'Endoscopic dilation of ampulla and biliary duct', -32.4499018, -71.2325958, '2020-05-06', 18, 3);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('The Bloodstained Butterfly', 'Incision of perirectal tissue', 9.0796794, 6.0097018, '2020-10-31', 18, 1);
insert into advertisement (title, description, latitude, longitude, appearance_date, owner_id, price_category) values ('Imagine That', 'Nephrocystanastomosis, not otherwise specified', 32.026097, 112.232692, '2020-04-28', 11, 1);

--- INSERT MOCK image_url
DELETE FROM image_url;
ALTER SEQUENCE image_url_image_id_seq RESTART WITH 1;

insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/131x232.bmp/5fa2dd/ffffff', 1);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/160x124.jpg/5fa2dd/ffffff', 6);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/223x132.png/5fa2dd/ffffff', 16);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/100x167.bmp/cc0000/ffffff', 1);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/195x225.png/cc0000/ffffff', 14);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/102x105.jpg/dddddd/000000', 20);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/157x228.bmp/cc0000/ffffff', 9);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/135x205.png/cc0000/ffffff', 18);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/102x111.bmp/dddddd/000000', 10);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/206x112.jpg/dddddd/000000', 8);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/142x239.jpg/ff4444/ffffff', 18);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/226x104.jpg/cc0000/ffffff', 11);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/231x227.jpg/cc0000/ffffff', 7);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/191x143.png/dddddd/000000', 15);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/129x187.jpg/dddddd/000000', 3);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/220x131.png/dddddd/000000', 19);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/200x180.bmp/cc0000/ffffff', 11);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/116x132.png/ff4444/ffffff', 3);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/199x163.jpg/5fa2dd/ffffff', 19);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/110x143.jpg/cc0000/ffffff', 6);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/168x169.jpg/cc0000/ffffff', 7);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/131x147.bmp/dddddd/000000', 2);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/222x135.jpg/5fa2dd/ffffff', 16);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/163x130.bmp/5fa2dd/ffffff', 13);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/239x204.jpg/dddddd/000000', 6);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/143x198.bmp/dddddd/000000', 16);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/178x107.bmp/5fa2dd/ffffff', 4);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/233x250.bmp/dddddd/000000', 2);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/230x154.bmp/ff4444/ffffff', 13);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/122x184.png/5fa2dd/ffffff', 20);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/148x240.png/dddddd/000000', 17);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/249x182.bmp/ff4444/ffffff', 7);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/195x142.jpg/dddddd/000000', 4);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/219x118.bmp/5fa2dd/ffffff', 16);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/217x110.bmp/cc0000/ffffff', 3);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/136x130.bmp/ff4444/ffffff', 6);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/125x212.bmp/dddddd/000000', 4);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/175x187.png/dddddd/000000', 17);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/183x115.bmp/dddddd/000000', 17);
insert into image_url (image_url, advertisement_id) values ('http://dummyimage.com/223x233.png/5fa2dd/ffffff', 4);


--- INSERT MOCK user_liked_advertisements
DELETE FROM user_liked_advertisements;
ALTER SEQUENCE user_liked_advertisements_connection_id_seq RESTART WITH 1;

insert into user_liked_advertisements (user_id, advertisement_id) values (5, 3);
insert into user_liked_advertisements (user_id, advertisement_id) values (2, 10);
insert into user_liked_advertisements (user_id, advertisement_id) values (11, 1);
insert into user_liked_advertisements (user_id, advertisement_id) values (18, 13);
insert into user_liked_advertisements (user_id, advertisement_id) values (3, 8);

--- INSERT MOCK advertisement_item_category
DELETE FROM advertisement_item_category;
ALTER SEQUENCE advertisement_item_category_connection_id_seq RESTART WITH 1;

insert into advertisement_item_category (advertisement_id, item_category_id) values (8, 3);
insert into advertisement_item_category (advertisement_id, item_category_id) values (17, 5);
insert into advertisement_item_category (advertisement_id, item_category_id) values (11, 3);
insert into advertisement_item_category (advertisement_id, item_category_id) values (16, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (16, 4);
insert into advertisement_item_category (advertisement_id, item_category_id) values (18, 5);
insert into advertisement_item_category (advertisement_id, item_category_id) values (8, 4);
insert into advertisement_item_category (advertisement_id, item_category_id) values (4, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (4, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (17, 5);
insert into advertisement_item_category (advertisement_id, item_category_id) values (12, 3);
insert into advertisement_item_category (advertisement_id, item_category_id) values (10, 3);
insert into advertisement_item_category (advertisement_id, item_category_id) values (7, 4);
insert into advertisement_item_category (advertisement_id, item_category_id) values (3, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (12, 4);
insert into advertisement_item_category (advertisement_id, item_category_id) values (8, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (4, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (9, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (7, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (17, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (5, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (20, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (15, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (4, 1);
insert into advertisement_item_category (advertisement_id, item_category_id) values (5, 3);
insert into advertisement_item_category (advertisement_id, item_category_id) values (9, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (6, 2);
insert into advertisement_item_category (advertisement_id, item_category_id) values (7, 4);
insert into advertisement_item_category (advertisement_id, item_category_id) values (10, 5);
insert into advertisement_item_category (advertisement_id, item_category_id) values (19, 3);
