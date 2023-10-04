-- Add Default Admin and User to the Database
BEGIN TRANSACTION;

-- Create Admin and User
INSERT INTO users (username, password_hash, role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username, password_hash, role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Creating our user Accounts
INSERT INTO users (username, password_hash, role) VALUES ('sefanit','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('coyo','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('jackie','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username, password_hash, role) VALUES ('andrew','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- Create 3 Default Recipes
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Cheese Pizza', 'https://images.unsplash.com/photo-1639744210916-74793fdd9a88?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1336&q=80', E'Gooey, cheesy goodness on a crispy crust. Perfect quick family meal.', 10, 'pizza, cheese', true, true);

INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'Sourdough Bread', 'https://images.unsplash.com/photo-1620921586333-b7566c34550a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1335&q=80', E'Sourdough bread is a delicious and nutritious bread that is made with a fermented starter.', 6, 'bread, sourdough', false, true);
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
INSERT INTO ingredients (ingredient) VALUES ('1/2 recipe homemade pizza dough');
INSERT INTO ingredients (ingredient) VALUES ('1 Tablespoon (15ml) olive oil, divided');
INSERT INTO ingredients (ingredient) VALUES ('1 Tablespoon (8g) cornmeal');
INSERT INTO ingredients (ingredient) VALUES ('1/2-3/4 cup (127-190g) pizza sauce');
INSERT INTO ingredients (ingredient) VALUES ('8 oz sliced mozzarella cheese');
INSERT INTO ingredients (ingredient) VALUES ('1 and 1/2 cups (6oz or 168g) shredded mozzarella cheese');
INSERT INTO ingredients (ingredient) VALUES ('2-3 Tablespoons (10-15g) grated parmesan cheese');
INSERT INTO ingredients (ingredient) VALUES ('dried basil or Italian seasoning to taste');


--Links cheese to pizza
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (1, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (2, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (3, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (4, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (5, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (6, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (7, 1);
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (8, 1);

-- Adding Cheese, Milk, and Tomato to the "user" 'Grocery List'
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 1, 1, false);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 2, 1, true);
INSERT INTO users_ingredients (user_id, ingredient_id, recipe_id, is_completed) VALUES (1, 3, 1, false);

-- Adding 6 Steps to Pizza
INSERT INTO steps (rank, instruction) VALUES (1, E'Dough: Prepare pizza dough through step 3. If using store-bought frozen pizza dough, make sure it is thawed.');
INSERT INTO steps (rank, instruction) VALUES (2, E'Preheat oven to 475 Degrees F (246 Degrees C). Allow it to heat for at least 15-20 minutes as you shape the pizza in the next step. If using a pizza stone, place it in the oven to preheat as well. Lightly grease a large baking sheet or pizza pan with 1/2 Tablespoon of olive oil. Sprinkle lightly with cornmeal, which gives the crust extra crunch and flavor.');
INSERT INTO steps (rank, instruction) VALUES (3, E'Shape the dough: When the homemade dough is ready, punch it down to release any air bubbles. Divide the dough in half and freeze half the dough for another time—see freezing instructions in the pizza dough recipe. On a lightly floured work surface using lightly floured hands or rolling pin, gently flatten the dough into a disc. Place on prepared pan and, using lightly floured hands, stretch and flatten the disc into a 12-inch circle, about 1/2-inch thick. If the dough keeps shrinking back as you try to stretch it, stop what you\'re doing, cover it lightly and let it rest for 5-10 minutes, then try again. Once shaped into a 12-inch circle, lift the edge of the dough up to create a lip around the edges. I simply pinch the edges up to create the rim. If using a pizza stone, place the dough directly on a baker\'s peel dusted with cornmeal. Cover dough lightly with plastic wrap or a clean kitchen towel and allow to rest for a few minutes as you gather the pizza toppings.');
INSERT INTO steps (rank, instruction) VALUES (4, E'Top & bake the pizza: Using your fingers, push dents into the surface of the dough to prevent bubbling. Brush remaining olive oil all over the dough. Top the dough with the pizza sauce, then the sliced mozzarella, the shredded mozzarella, and grated parmesan. Sprinkle lightly with basil or Italian seasoning.');
INSERT INTO steps (rank, instruction) VALUES (5, E'Bake for 14-15 minutes or until the crust is golden brown. Remove from the oven.');
INSERT INTO steps (rank, instruction) VALUES (6, E'Slice hot pizza and serve immediately. Cover leftover pizza tightly and store in the refrigerator for up to 1 week. Freezing and reheating instructions below.');

-- Add Steps to Pizza
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (1,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (2,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (3,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (4,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (5,1);
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (6,1);

-- Add Recipe 2 to "user" Favorites
INSERT INTO users_recipes (user_id, recipe_id) VALUES (1,2);



-- NEW Recipes



-- Insert Hummus Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Hummus', 'https://www.inspiredtaste.net/wp-content/uploads/2019/03/How-to-Make-Homemade-Hummus-1200.jpg', 'Creamy and delicious hummus dip.', 6, 'hummus, dip, appetizer', false, true);

-- Insert Ingredients for Hummus Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cans (30 oz) of chickpeas, drained and rinsed');
INSERT INTO ingredients (ingredient) VALUES ('1/3 cup (80ml) of tahini');
INSERT INTO ingredients (ingredient) VALUES ('2 cloves of garlic, minced');
INSERT INTO ingredients (ingredient) VALUES ('1/4 cup (60ml) of fresh lemon juice');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) of olive oil');
INSERT INTO ingredients (ingredient) VALUES ('1 teaspoon (5g) of ground cumin');
INSERT INTO ingredients (ingredient) VALUES ('Salt and pepper to taste');
INSERT INTO ingredients (ingredient) VALUES ('2 tablespoons (30ml) of water');

-- Link Ingredients to Hummus Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (9, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (10, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (11, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (12, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (13, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (14, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (15, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (16, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

-- Insert Steps for Hummus Recipe
INSERT INTO steps (rank, instruction) VALUES (7, 'In a food processor, combine the chickpeas, tahini, minced garlic, lemon juice, olive oil, and ground cumin.');
INSERT INTO steps (rank, instruction) VALUES (8, 'Process until the mixture is smooth and creamy, adding water as needed to achieve the desired consistency.');
INSERT INTO steps (rank, instruction) VALUES (9, 'Season with salt and pepper to taste.');
INSERT INTO steps (rank, instruction) VALUES (10, 'Transfer the hummus to a serving bowl, drizzle with a bit of olive oil, and garnish with fresh herbs, if desired.');

-- Link Steps to Hummus Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (7, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (8, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (9, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (10, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));


-- Start a Transaction for Lemon Sorbet Recipe


-- Insert Lemon Sorbet Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Lemon Sorbet', 'https://www.mybakingaddiction.com/wp-content/uploads/2009/06/close-up-lemon-sorbet-hero.jpg', 'Refreshing and tangy lemon sorbet.', 4, 'lemon, sorbet, dessert', true, true);

-- Insert Ingredients for Lemon Sorbet Recipe
INSERT INTO ingredients (ingredient) VALUES ('2 cups (480ml) of fresh lemon juice');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (240ml) of water');
INSERT INTO ingredients (ingredient) VALUES ('1 cup (200g) of granulated sugar');

-- Link Ingredients to Lemon Sorbet Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (17, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (18, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (19, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));

-- Insert Steps for Lemon Sorbet Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (11, 1, 'In a mixing bowl, combine fresh lemon juice, water, and granulated sugar.');
INSERT INTO steps (step_id, rank, instruction) VALUES (12, 2, 'Stir until sugar is dissolved.');
INSERT INTO steps (step_id, rank, instruction) VALUES (13, 3, 'Pour the mixture into an ice cream maker and churn according to the manufacture instructions until it reaches a sorbet consistency.');
INSERT INTO steps (step_id, rank, instruction) VALUES (14, 4, 'Transfer the sorbet to an airtight container and freeze for a few hours until firm.');
INSERT INTO steps (step_id, rank, instruction) VALUES (15, 5, 'Serve the lemon sorbet in chilled bowls or cones.');

-- Link Steps to Lemon Sorbet Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (11, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (12, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (13, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (14, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (15, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet'));

-- Commit the Transaction for Lemon Sorbet Recipe





COMMIT TRANSACTION;




