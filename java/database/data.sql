-- Add Default Admin and User to the Database
BEGIN TRANSACTION;

-- Create Admin and User
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Create 3 Default Recipes
INSERT INTO recipes (creator_id, title, description, serving_size) VALUES ((SELECT user_id FROM users WHERE username = 'user' LIMIT 1), 'Cheese Pizza2', E'Cheese, Sauce, and Crust. It\'s always good. Make it.', 10);
INSERT INTO recipes (creator_id, title, description, serving_size) VALUES ((SELECT user_id FROM users WHERE username = 'admin' LIMIT 1), 'Sourdough Bread', E'It\'s not actually sour, but it is bread.', 6);
INSERT INTO recipes (creator_id, title, description, serving_size) VALUES ((SELECT user_id FROM users WHERE username = 'user' LIMIT 1), 'Spaghetti', 'Delicious red tomato sauce and amazing spaghetti.', 2);

COMMIT TRANSACTION;