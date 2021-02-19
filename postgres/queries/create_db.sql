

CREATE TABLE user_profile (
	user_id SERIAL PRIMARY KEY,
	user_name TEXT NOT NULL,
	user_lastname TEXT NOT NULL,
	radius REAL NOT NULL
);

CREATE TABLE price_category (
	category_id SERIAL PRIMARY KEY,
	category_name TEXT NOT NULL
);

CREATE TABLE item_category (
	category_id SERIAL PRIMARY KEY,
	category_name TEXT NOT NULL
);

CREATE TABLE advertisement (
	advertisement_id SERIAL PRIMARY KEY,
	title TEXT,
	description TEXT,
	latitude REAL NOT NULL,
	longitude REAL NOT NULL,
	appearance_date DATE,
	owner_id INT,
	price_category INT,
	CONSTRAINT fk_user
		FOREIGN KEY(owner_id)
			REFERENCES user_profile(user_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_price_category
		FOREIGN KEY(price_category)
			REFERENCES price_category(category_id)
			ON DELETE SET NULL
);

CREATE TABLE image_url (
	image_id SERIAL PRIMARY KEY,
	image_url TEXT,
	advertisement_id INT,
	CONSTRAINT fk_adverisement
		FOREIGN KEY(advertisement_id)
			REFERENCES advertisement(advertisement_id)
			ON DELETE CASCADE
);

CREATE TABLE messages (
	message_id SERIAL PRIMARY KEY,
	sender INT,
	receiver INT,
	message_content TEXT,
	advertisement_id INT,
	message_timestamp TIMESTAMP NOT NULL,
	CONSTRAINT fk_first
		FOREIGN KEY(sender)
			REFERENCES user_profile(user_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_second
		FOREIGN KEY(receiver)
			REFERENCES user_profile(user_id)
			ON DELETE CASCADE
);

CREATE TABLE user_liked_advertisements (
	connection_id SERIAL PRIMARY KEY,
	user_id INT,
	advertisement_id INT,
	CONSTRAINT fk_user
		FOREIGN KEY(user_id)
			REFERENCES user_profile(user_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_advertisement
		FOREIGN KEY(advertisement_id)
			REFERENCES advertisement(advertisement_id)
			ON DELETE CASCADE
);

CREATE TABLE advertisement_item_category (
	connection_id SERIAL PRIMARY KEY,
	advertisement_id INT,
	item_category_id INT,
	CONSTRAINT fk_advertisement
		FOREIGN KEY(advertisement_id)
			REFERENCES advertisement(advertisement_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_category
		FOREIGN KEY(item_category_id)
			REFERENCES item_category(category_id)
			ON DELETE CASCADE
);