-- Add Default Admin and User to the Database
BEGIN TRANSACTION;

-- Create Admin and User
INSERT INTO users (username, password_hash, role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username, password_hash, role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('sefanit','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('coyo','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('jackie','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('andrew','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Create 3 Default Recipes
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Cheese Pizza', 'https://images.unsplash.com/photo-1639744210916-74793fdd9a88?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1336&q=80', E'Gooey, cheesy goodness on a crispy crust. Perfect quick family meal.', 10, 'pizza, cheese', true, true);
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'Sourdough Bread', 'https://images.unsplash.com/photo-1620921586333-b7566c34550a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1335&q=80', E'Sourdough bread is a delicious and nutritious bread that is made with a fermented starter.', 6, 'bread, sourdough', true, true);
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Spaghetti', 'https://images.unsplash.com/photo-1627286400579-027de47e9e73?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80', 'Delicious red tomato sauce and amazing spaghetti.', 2, 'spaghetti, meatballs, italian', true, true);

-- Create 5 Different Tags
INSERT INTO tags (tag) VALUES ('vegetarian');
INSERT INTO tags (tag) VALUES ('pescetarian');
INSERT INTO tags (tag) VALUES ('vegan');
INSERT INTO tags (tag) VALUES ('dairy-free');
INSERT INTO tags (tag) VALUES ('gluten-free');
INSERT INTO tags (tag) VALUES ('paleo');
INSERT INTO tags (tag) VALUES ('raw-food');
INSERT INTO tags (tag) VALUES ('keto');

--Links vegan to pizza
INSERT INTO recipes_tags (tag_id, recipe_id) VALUES (1,1);

--Adding cheese to ingredients table
INSERT INTO ingredients (ingredient) VALUES ('14 oz cheese');
INSERT INTO ingredients (ingredient) VALUES ('1/2 gal of milk');
INSERT INTO ingredients (ingredient) VALUES ('1 tomato');

--Links cheese to pizza
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (1, 1);

-- Adding Cheese, Milk, and Tomato to the "user" 'Grocery List'
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 1, 1, false);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 2, 1, true);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 3, 1, false);

-- Adding 3 Steps to Pizza
INSERT INTO steps (rank, instruction) VALUES (1, 'Preheat Oven to 400 Degrees');
INSERT INTO steps (rank, instruction) VALUES (2, 'Roll Dough');
INSERT INTO steps (rank, instruction) VALUES (3, E'Don\'t eat the raw dough.');

-- Add Steps to Pizza
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (1,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (2,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (3,1);

-- Add Recipe 2 to "user" Favorites
INSERT INTO users_recipes (user_id, recipe_id) VALUES (1,2);

COMMIT TRANSACTION;