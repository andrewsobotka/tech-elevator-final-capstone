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
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Cheese Pizza', 'https://i0.wp.com/prettysimplesweet.com/wp-content/uploads/2015/12/margherita_pizza.jpg?w=680&quality=89&ssl=1', E'Gooey, cheesy goodness on a crispy crust. Perfect quick family meal.', 10, 'pizza, marinara, dinner, cheese', true, true);


-- --Links vegan to pizza
-- INSERT INTO recipes_tags (tag_id, recipe_id) VALUES (1,1);




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
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Hummus', 'https://www.inspiredtaste.net/wp-content/uploads/2019/03/How-to-Make-Homemade-Hummus-1200.jpg', 'Creamy and delicious hummus dip.', 6, 'hummus, dip, vegan, mediterranean, greek, chickpea, snacks, dips, appetizer', false, true);

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

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegan'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
-- );


-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'pescetarian'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
-- );



-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
--  );

-- Start a Transaction for Lemon Sorbet Recipe


-- Insert Lemon Sorbet Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Lemon Sorbet', 'https://i1.wp.com/lmld.org/wp-content/uploads/2022/07/Lemon-Sorbet-6.jpg', 'Refreshing and tangy lemon sorbet.', 4, 'lemon, sorbet, dessert, vegan, summer, sorbet, ice cream, sorbets', false, true);

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


-- -- INSERT INTO recipes_tags (tag_id, recipe_id)
-- -- VALUES (
-- --   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
-- --   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
-- -- );

-- -- -- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
-- -- INSERT INTO recipes_tags (tag_id, recipe_id)
-- -- VALUES (
-- --   (SELECT tag_id FROM tags WHERE tag = 'vegan'),
-- --   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
-- -- );

-- -- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
-- );
-- -- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'dairy-free'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
-- );
-- -- Commit the Transaction for Lemon Sorbet Recipe


INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Pie', 'https://www.lemonblossoms.com/wp-content/uploads/2020/09/Pumpkin-Pie-S3.jpg', 'A classic pumpkin pie with a flaky crust.', 8, 'pumpkin, pumpkin spice, desserts, pies, dessert, fall recipes, autumn, fall recipe', true, true);

-- Insert Ingredients for Pumpkin Pie Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (20, '1 1/2 cups (360g) canned pumpkin puree');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (21, '1/2 cup (100g) granulated sugar');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (22, '1 teaspoon (2g) ground cinnamon');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (23, '1/2 teaspoon (1g) ground ginger');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (24, '1/4 teaspoon (0.5g) ground nutmeg');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (25, '1/4 teaspoon (0.5g) ground cloves');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (26, '2 large eggs');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (27, '1 9-inch (23cm) unbaked pie crust');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (28, '1 cup (240ml) evaporated milk');

-- Link Ingredients to Pumpkin Pie Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (20, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (21, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (22, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (23, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (24, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (25, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (26, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (27, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (28, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));

-- Insert Steps for Pumpkin Pie Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (16, 1, 'Preheat your oven to 425*F (220*C).');
INSERT INTO steps (step_id, rank, instruction) VALUES (17, 2, 'In a large mixing bowl, combine the pumpkin puree, granulated sugar, ground cinnamon, ground ginger, ground nutmeg, and ground cloves.');
INSERT INTO steps (step_id, rank, instruction) VALUES (18, 3, 'In a separate bowl, beat the eggs and add them to the pumpkin mixture. Mix well.');
INSERT INTO steps (step_id, rank, instruction) VALUES (19, 4, 'Gradually add the evaporated milk and mix until the filling is smooth.');
INSERT INTO steps (step_id, rank, instruction) VALUES (20, 5, 'Pour the pumpkin filling into the unbaked pie crust.');
INSERT INTO steps (step_id, rank, instruction) VALUES (21, 6, 'Bake in the preheated oven for 15 minutes, then reduce the oven temperature to 350*F (175*C) and continue baking for 40-50 minutes or until a knife inserted near the center comes out clean.');
INSERT INTO steps (step_id, rank, instruction) VALUES (22, 7, 'Allow the pie to cool completely before serving.');
INSERT INTO steps (step_id, rank, instruction) VALUES (23, 8, 'Serve with whipped cream or vanilla ice cream.');

-- Link Steps to Pumpkin Pie Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (16, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (17, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (18, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (19, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (20, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (21, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (22, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (23, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
-- );
-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegan'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
-- );




-- Insert Pumpkin Spiced Latte Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Spiced Latte', 'https://www.inspiredtaste.net/wp-content/uploads/2011/11/Pumpkin-Spice-Latte-Recipe-1200.jpg', 'A warm and comforting pumpkin spiced latte.', 1, 'coffee, pumpkin, pumpkin spice, latte, fall recipes, fall, breakfast', true, true);





-- Insert Ingredients for Pumpkin Spiced Latte Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (29, '1 cup (240ml) brewed coffee');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (30, '2 tablespoons (30ml) pumpkin puree');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (31, '2 tablespoons (30ml) maple syrup');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (32, '1/2 teaspoon (1g) pumpkin pie spice');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (33, '1/4 cup (60ml) milk');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (34, 'Whipped cream, for topping (optional)');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (35, 'Ground cinnamon, for garnish (optional)');

-- Link Ingredients to Pumpkin Spiced Latte Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (29, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (30, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (31, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (32, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (33, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (34, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (35, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));

-- Insert Steps for Pumpkin Spiced Latte Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (24, 1, 'Brew a strong cup of coffee.');

INSERT INTO steps (step_id, rank, instruction) VALUES (25, 2, 'In a small saucepan, heat the pumpkin puree, maple syrup, and pumpkin pie spice over low heat, stirring until well combined.');

INSERT INTO steps (step_id, rank, instruction) VALUES (26, 3, 'Add the hot brewed coffee to the pumpkin mixture and stir well.');

INSERT INTO steps (step_id, rank, instruction) VALUES (27, 4, 'In a separate saucepan, heat the milk until hot but not boiling.');

INSERT INTO steps (step_id, rank, instruction) VALUES (28, 5, 'Froth the hot milk using a milk frother or whisk until it becomes creamy.');

INSERT INTO steps (step_id, rank, instruction) VALUES (29, 6, 'Pour the frothed milk into the coffee mixture and stir gently.');

INSERT INTO steps (step_id, rank, instruction) VALUES (30, 7, 'If desired, top with whipped cream and a sprinkle of ground cinnamon.');

-- Link Steps to Pumpkin Spiced Latte Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (24, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (25, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (26, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (27, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (28, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (29, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (30, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte'));





-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
-- );

-- -- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegan'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
-- );

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
--   (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
-- );



-- Insert French Fries Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES (
  (SELECT user_id FROM users WHERE username = 'jackie'), -- Replace 'jackie' with the actual username
  'French Fries',
  'https://www.fifteenspatulas.com/wp-content/uploads/2011/09/French-Fries-Recipe.jpg', -- Replace with the URL of the image
  'Delicious crispy french fries.',
  2, -- Adjust the serving size as needed
  'french fries, potatoes, snack, snacks, french, potato, vegan, salty', -- Keywords
  false, -- is_featured (if applicable)
  true -- is_published
);

-- Insert Ingredients for French Fries Recipe
-- Replace the ingredient_id and ingredient values with your specific ingredients
INSERT INTO ingredients (ingredient_id, ingredient)
VALUES
  (36, 'Potatoes'),
  (37, 'Salt'),
  (38, 'Oil');

-- Link Ingredients to French Fries Recipe
-- Replace recipe_id and ingredient_id values with the appropriate IDs
INSERT INTO ingredients_recipes (ingredient_id, recipe_id)
VALUES
  (36, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (37, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (38, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries'));

-- Insert Steps for French Fries Recipe
-- Replace the step_id and instruction values with your specific steps
INSERT INTO steps (step_id, rank, instruction)
VALUES
  (31, 1, 'Peel and cut the potatoes into thin strips.'),
  (32, 2, 'Heat the oil in a deep fryer or large pan to 350*F (175*C).'),
  (33, 3, 'Fry the potato strips in batches until golden brown, about 4-5 minutes per batch.'),
  (34, 4, 'Remove the fries from the oil and drain on paper towels.'),
  (35, 5, 'Sprinkle with salt to taste and serve.');

-- Link Steps to French Fries Recipe
-- Replace recipe_id and step_id values with the appropriate IDs
INSERT INTO steps_recipes (step_id, recipe_id)
VALUES
  (31, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (32, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (33, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (34, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries')),
  (35, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Fries'));





-- Insert Spaghetti Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Spaghetti', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvCnZmiKSCDbCzyXO_l-4euhS0Zj3yYE11Nw&usqp=CAU', 'Classic spaghetti recipe with tomato sauce and meatballs.', 4, 'spaghetti, pasta, Italian, cheese', false, true);

-- Insert Ingredients for Spaghetti Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (39, '8 oz (225g) spaghetti');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (40, '1 cup (240ml) tomato sauce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (41, '1/2 lb (225g) ground beef');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (42, '1/2 onion, finely chopped');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (43, '1 clove garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (44, '1/4 cup (60ml) red wine');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (45, '1/4 cup (60ml) water');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (46, '2 tablespoons (30ml) olive oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (47, 'Salt and pepper to taste');

-- Link Ingredients to Spaghetti Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (39, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (40, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (41, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (42, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (43, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (44, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (45, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (46, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (47, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));

-- Insert Steps for Spaghetti Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (36, 1, 'Boil a large pot of salted water.');
INSERT INTO steps (step_id, rank, instruction) VALUES (37, 2, 'Add the spaghetti to the boiling water and cook until al dente, following package instructions.');
INSERT INTO steps (step_id, rank, instruction) VALUES (38, 3, 'In a skillet, heat the olive oil over medium heat. Add the chopped onions and minced garlic, and sauté until fragrant.');
INSERT INTO steps (step_id, rank, instruction) VALUES (39, 4, 'Add the ground beef to the skillet and cook until browned, breaking it into small pieces with a spatula.');
INSERT INTO steps (step_id, rank, instruction) VALUES (40, 5, 'Pour in the red wine and cook for a few minutes until it reduces.');
INSERT INTO steps (step_id, rank, instruction) VALUES (41, 6, 'Stir in the tomato sauce and water. Simmer for about 15 minutes, allowing the flavors to meld.');
INSERT INTO steps (step_id, rank, instruction) VALUES (42, 7, 'Season the sauce with salt and pepper to taste.');
INSERT INTO steps (step_id, rank, instruction) VALUES (43, 8, 'Serve the cooked spaghetti with the tomato sauce and meatballs on top.');

-- Link Steps to Spaghetti Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (36, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (37, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (38, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (39, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (40, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (41, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (42, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (43, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Spaghetti'));




-- Insert Baked Salmon Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'andrew'), 'Baked Salmon', 'https://www.wholesomeyum.com/wp-content/uploads/2021/10/wholesomeyum-Baked-Salmon-Recipe-How-To-Cook-Salmon-In-The-Oven-1.jpg', 'A delicious and healthy baked salmon recipe.', 4, 'salmon, seafood, fish, healthy', false, true);

-- Insert Ingredients for Baked Salmon Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (48, '4 salmon fillets');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (49, '2 tablespoons (30ml) olive oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (50, '2 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (51, '1 lemon, sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (52, '1 teaspoon (2g) dried oregano');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (53, 'Salt and pepper to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (54, 'Fresh parsley, chopped, for garnish (optional)');

-- Link Ingredients to Baked Salmon Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (48, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (49, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (50, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (51, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (52, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (53, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (54, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));

-- Insert Steps for Baked Salmon Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (44, 1, 'Preheat your oven to 375*F (190*C).');
INSERT INTO steps (step_id, rank, instruction) VALUES (45, 2, 'Place the salmon fillets on a baking sheet lined with parchment paper or foil.');
INSERT INTO steps (step_id, rank, instruction) VALUES (46, 3, 'In a small bowl, mix the olive oil, minced garlic, and dried oregano.');
INSERT INTO steps (step_id, rank, instruction) VALUES (47, 4, 'Brush the olive oil mixture over the salmon fillets.');
INSERT INTO steps (step_id, rank, instruction) VALUES (48, 5, 'Season the salmon with salt and pepper to taste.');
INSERT INTO steps (step_id, rank, instruction) VALUES (49, 6, 'Place lemon slices on top of each salmon fillet.');
INSERT INTO steps (step_id, rank, instruction) VALUES (50, 7, 'Bake in the preheated oven for 15-20 minutes or until the salmon flakes easily with a fork.');
INSERT INTO steps (step_id, rank, instruction) VALUES (51, 8, 'Garnish with fresh parsley if desired.');

-- Link Steps to Baked Salmon Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (44, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (45, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (46, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (47, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (48, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (49, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (50, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (51, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon'));


-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'pescetarian'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
--  );

-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'dairy-free'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
--  );

-- VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'kosher'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
--  );

--  VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'renal-diet'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Baked Salmon')
--  );





-- Insert Ratatouille Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'andrew'), 'Ratatouille', 'https://cookieandkate.com/images/2019/09/best-ratatouille-recipe-1-1.jpg', 'A classic French vegetable stew bursting with flavors.', 4, 'ratatouille, French cuisine, vegetables, tomato, french, vegan, vegetarian, vegetables, summer, zucchini, marinara', false, true);

-- Insert Ingredients for Ratatouille Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (55, '1 large eggplant, diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (56, '2 zucchinis, diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (57, '2 red bell peppers, diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (58, '1 large onion, chopped');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (59, '4 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (60, '2 cups (480ml) tomato sauce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (61, '1 teaspoon (2g) dried thyme');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (62, '1 teaspoon (2g) dried basil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (63, 'Salt and pepper to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (64, 'Fresh basil leaves, for garnish (optional)');

-- Link Ingredients to Ratatouille Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (55, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (56, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (57, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (58, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (59, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (60, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (61, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (62, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (63, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (64, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));

-- Insert Steps for Ratatouille Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (52, 1, 'Heat olive oil in a large pot or Dutch oven over medium heat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (53, 2, 'Add the chopped onion and garlic, and sauté until they become translucent.');
INSERT INTO steps (step_id, rank, instruction) VALUES (54, 3, 'Add the diced eggplant, zucchinis, and red bell peppers to the pot.');
INSERT INTO steps (step_id, rank, instruction) VALUES (55, 4, 'Season with dried thyme, dried basil, salt, and pepper. Cook for about 10 minutes, stirring occasionally.');
INSERT INTO steps (step_id, rank, instruction) VALUES (56, 5, 'Pour in the tomato sauce and stir to combine. Reduce the heat to low, cover, and simmer for 20-30 minutes, or until the vegetables are tender.');
INSERT INTO steps (step_id, rank, instruction) VALUES (57, 6, 'Taste and adjust the seasoning if needed.');
INSERT INTO steps (step_id, rank, instruction) VALUES (58, 7, 'Serve the Ratatouille hot, garnished with fresh basil leaves if desired.');

-- Link Steps to Ratatouille Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (52, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (53, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (54, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (55, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (56, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (57, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (58, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ratatouille'));




-- Insert Mac and Cheese Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'jackie'), 'Mac and Cheese', 'https://ohsweetbasil.com/wp-content/uploads/southern-macaroni-and-cheese-recipe-6-scaled.jpg', 'Creamy and delicious macaroni and cheese.', 4, 'mac and cheese, cheese, macaroni, pasta, comfort food', false, true);

-- Insert Ingredients for Mac and Cheese Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (65, '2 cups (200g) elbow macaroni');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (66, '1/4 cup (60g) butter');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (67, '1/4 cup (30g) all-purpose flour');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (68, '2 cups (480ml) milk');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (69, '2 cups (200g) shredded cheddar cheese');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (70, 'Salt and pepper to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (71, '1/4 cup (25g) grated Parmesan cheese (optional)');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (72, '1/4 cup (25g) bread crumbs (optional)');

-- Link Ingredients to Mac and Cheese Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (65, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (66, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (67, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (68, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (69, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (70, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (71, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (72, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));

-- Insert Steps for Mac and Cheese Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (59, 1, 'Cook the elbow macaroni according to the package instructions. Drain and set aside.');
INSERT INTO steps (step_id, rank, instruction) VALUES (60, 2, 'In a large pot, melt the butter over medium heat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (61, 3, 'Stir in the all-purpose flour and cook for about 2 minutes, stirring constantly.');
INSERT INTO steps (step_id, rank, instruction) VALUES (62, 4, 'Gradually whisk in the milk and cook until the mixture thickens, stirring constantly.');
INSERT INTO steps (step_id, rank, instruction) VALUES (63, 5, 'Stir in the shredded cheddar cheese until smooth and creamy.');
INSERT INTO steps (step_id, rank, instruction) VALUES (64, 6, 'Add the cooked macaroni to the cheese sauce and stir until well combined. Season with salt and pepper to taste.');
INSERT INTO steps (step_id, rank, instruction) VALUES (65, 7, 'If desired, top with grated Parmesan cheese and bread crumbs for a crunchy topping.');
INSERT INTO steps (step_id, rank, instruction) VALUES (66, 8, 'Serve the Mac and Cheese hot and enjoy!');

-- Link Steps to Mac and Cheese Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (59, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (60, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (61, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (62, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (63, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (64, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (65, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Mac and Cheese'));



-- Insert Ramen Recipe by User "coyo"
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Ramen', 'https://thecozycook.com/wp-content/uploads/2023/02/Homemade-Ramen-f.jpg', 'A delicious and comforting bowl of homemade ramen.', 2, 'ramen, noodles, fall, winter, japanese, soup', true, true);

-- Insert Ingredients for Ramen Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (73, '2 packs of ramen noodles');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (74, '4 cups (960ml) chicken or vegetable broth');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (75, '2 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (76, '1 tablespoon (15ml) soy sauce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (77, '1 teaspoon (5g) sesame oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (78, '2 boiled eggs, halved');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (79, 'Sliced green onions, for garnish');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (80, 'Sliced seaweed, for garnish');

-- Link Ingredients to Ramen Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (73, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (74, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (75, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (76, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (77, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (78, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (79, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (80, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));

-- Insert Steps for Ramen Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (67, 1, 'Boil the ramen noodles according to the package instructions. Drain and set aside.');
INSERT INTO steps (step_id, rank, instruction) VALUES (68, 2, 'In a large pot, heat the chicken or vegetable broth over medium heat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (69, 3, 'Add minced garlic, soy sauce, and sesame oil to the broth. Stir well.');
INSERT INTO steps (step_id, rank, instruction) VALUES (70, 4, 'Divide the cooked ramen noodles into serving bowls.');
INSERT INTO steps (step_id, rank, instruction) VALUES (71, 5, 'Pour the hot broth over the noodles in each bowl.');
INSERT INTO steps (step_id, rank, instruction) VALUES (72, 6, 'Top each bowl with a boiled egg, sliced green onions, and sliced seaweed.');
INSERT INTO steps (step_id, rank, instruction) VALUES (73, 7, 'Serve the homemade Ramen hot and enjoy!');

-- Link Steps to Ramen Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (67, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (68, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (69, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (70, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (71, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (72, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (73, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen'));


--  VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
--  );

--  VALUES (
--   (SELECT tag_id FROM tags WHERE tag = 'dairy-free'),
--  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Ramen')
--  );




-- Insert Vegetable Stir-Fry Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Vegetable Stir-Fry', 'https://www.wholesomeyum.com/wp-content/uploads/2020/11/wholesomeyum-how-to-stir-fry-vegetables-vegetable-stir-fry-recipe-list-15.jpg', 'A healthy and flavorful vegetable stir-fry.', 4, 'vegetables, stir-fry, healthy', false, true);

-- Insert Ingredients for Vegetable Stir-Fry Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (81, '2 cups (240g) broccoli florets');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (82, '1 red bell pepper, thinly sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (83, '1 yellow bell pepper, thinly sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (84, '1 carrot, julienned');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (85, '1 zucchini, thinly sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (86, '1 cup (150g) snap peas');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (87, '3 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (88, '1 tablespoon (15ml) soy sauce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (89, '1 tablespoon (15ml) oyster sauce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (90, '1 tablespoon (15ml) vegetable oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (91, 'Salt and pepper to taste');

-- Link Ingredients to Vegetable Stir-Fry Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (81, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (82, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (83, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (84, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (85, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (86, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (87, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (88, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (89, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (90, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (91, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));

-- Insert Steps for Vegetable Stir-Fry Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (74, 1, 'Heat vegetable oil in a large skillet or wok over medium-high heat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (75, 2, 'Add minced garlic and stir-fry for 30 seconds until fragrant.');
INSERT INTO steps (step_id, rank, instruction) VALUES (76, 3, 'Add broccoli, red bell pepper, yellow bell pepper, carrot, zucchini, and snap peas to the skillet.');
INSERT INTO steps (step_id, rank, instruction) VALUES (77, 4, 'Stir-fry the vegetables for 4-5 minutes until slightly tender but still crisp.');
INSERT INTO steps (step_id, rank, instruction) VALUES (78, 5, 'Add soy sauce and oyster sauce. Stir well to combine and cook for an additional 2 minutes.');
INSERT INTO steps (step_id, rank, instruction) VALUES (79, 6, 'Season with salt and pepper to taste.');
INSERT INTO steps (step_id, rank, instruction) VALUES (80, 7, 'Remove from heat and transfer the vegetable stir-fry to a serving dish.');

-- Link Steps to Vegetable Stir-Fry Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (74, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (75, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (76, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (77, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (78, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (79, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (80, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetable Stir-Fry'));



-- Insert Carbonara Recipe by sefanit
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Classic Carbonara', 'https://www.simplyrecipes.com/thmb/SebeiYFLjCD0TivmMJj_HRUC7zg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Spaghetti-Carbonara-LEAD-6-b3880a6eb49f4158be6f13885c797ded.jpg', 'A classic Italian pasta dish featuring creamy sauce, eggs, pancetta, and cheese.', 2, 'carbonara, pasta, Italian, creamy', false, true);

-- Insert Ingredients for Classic Carbonara Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (100, '8 ounces (about 225g) spaghetti');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (101, '2 large eggs');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (102, '1 cup (about 100g) grated Pecorino Romano cheese');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (103, '4 ounces (about 100g) pancetta or guanciale, diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (104, '2 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (105, 'Salt and freshly ground black pepper, to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (106, 'Fresh parsley, chopped, for garnish');

-- Link Ingredients to Classic Carbonara Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (100, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (101, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (102, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (103, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (104, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (105, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (106, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));

-- Insert Steps for Classic Carbonara Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (150, 1, 'Bring a large pot of salted water to a boil. Add spaghetti and cook until al dente, according to the package instructions. Drain the pasta, reserving a cup of pasta water.');
INSERT INTO steps (step_id, rank, instruction) VALUES (151, 2, 'While the pasta is cooking, heat a large skillet over medium heat. Add diced pancetta or guanciale and cook until crispy and golden brown. Remove from heat and place on paper towels to drain excess fat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (152, 3, 'In a mixing bowl, whisk together eggs and grated Pecorino Romano cheese until well combined. Season with freshly ground black pepper.');
INSERT INTO steps (step_id, rank, instruction) VALUES (153, 4, 'In the same skillet used for the pancetta, add minced garlic and sauté for a minute until fragrant.');
INSERT INTO steps (step_id, rank, instruction) VALUES (154, 5, 'Return the cooked pasta to the skillet with garlic. Toss to combine and heat for a minute.');
INSERT INTO steps (step_id, rank, instruction) VALUES (155, 6, 'Remove the skillet from heat. Quickly pour the egg and cheese mixture over the pasta, stirring continuously to create a creamy sauce. If needed, add a little reserved pasta water to achieve desired consistency.');
INSERT INTO steps (step_id, rank, instruction) VALUES (156, 7, 'Add the crispy pancetta (or guanciale) to the pasta, and gently toss to combine.');
INSERT INTO steps (step_id, rank, instruction) VALUES (157, 8, 'Garnish with chopped fresh parsley.');
INSERT INTO steps (step_id, rank, instruction) VALUES (158, 9, 'Serve immediately, and enjoy your delicious homemade Carbonara!');

-- Link Steps to Classic Carbonara Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (150, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (151, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (152, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (153, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (154, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (155, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (156, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (157, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (158, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Classic Carbonara'));



-- Insert Green Lentil Soup Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Green Lentil Soup', 'https://thishealthykitchen.com/wp-content/uploads/2020/11/lentil-split-pea-soup-4.jpg', 'A hearty and nutritious soup made with green lentils, vegetables, and flavorful spices.', 4, 'lentil soup, vegetarian, healthy', false, true);

-- Insert Ingredients for Green Lentil Soup Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (200, '1 cup (200g) green lentils, rinsed and drained');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (201, '1 large onion, chopped');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (202, '2 carrots, peeled and diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (203, '2 celery stalks, chopped');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (204, '3 cloves garlic, minced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (205, '1 bay leaf');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (206, '1 teaspoon ground cumin');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (207, '1/2 teaspoon ground coriander');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (208, '1/2 teaspoon ground turmeric');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (209, '1/4 teaspoon paprika');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (210, '6 cups (1.5 liters) vegetable broth');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (211, '2 tablespoons olive oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (212, 'Salt and black pepper, to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (213, 'Fresh parsley, chopped, for garnish');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (214, 'Lemon wedges, for serving');

-- Link Ingredients to Green Lentil Soup Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (200, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (201, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (202, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (203, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (204, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (205, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (206, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (207, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (208, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (209, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (210, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (211, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (212, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (213, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (214, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));

-- Insert Steps for Green Lentil Soup Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (300, 1, 'In a large pot, heat olive oil over medium heat. Add chopped onion, carrots, and celery. Sauté until vegetables begin to soften, about 5 minutes.');
INSERT INTO steps (step_id, rank, instruction) VALUES (301, 2, 'Add minced garlic, ground cumin, ground coriander, ground turmeric, and paprika. Sauté for another 2 minutes until fragrant.');
INSERT INTO steps (step_id, rank, instruction) VALUES (302, 3, 'Stir in the rinsed green lentils and bay leaf. Season with salt and black pepper.');
INSERT INTO steps (step_id, rank, instruction) VALUES (303, 4, 'Pour in the vegetable broth and bring the mixture to a boil. Reduce heat, cover, and simmer for 25-30 minutes or until lentils and vegetables are tender.');
INSERT INTO steps (step_id, rank, instruction) VALUES (304, 5, 'Remove the bay leaf from the soup. Taste and adjust seasoning as needed.');
INSERT INTO steps (step_id, rank, instruction) VALUES (305, 6, 'Using an immersion blender, partially puree the soup to create a creamy texture while leaving some chunks of vegetables and lentils.');
INSERT INTO steps (step_id, rank, instruction) VALUES (306, 7, 'Serve hot, garnished with fresh parsley and lemon wedges for a burst of flavor.');
INSERT INTO steps (step_id, rank, instruction) VALUES (307, 8, 'Enjoy your delicious homemade Green Lentil Soup!');

-- Link Steps to Green Lentil Soup Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (300, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (301, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (302, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (303, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (304, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (305, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (306, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (307, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Green Lentil Soup'));



-- Insert Greek Salad Wraps Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'jackie'), 'Greek Salad Wraps', 'https://www.onesweetmess.com/wp-content/uploads/2014/04/Greek-Salad-Wrap.jpg', 'A fresh and healthy wrap filled with Greek salad ingredients and drizzled with tzatziki sauce.', 2, 'salad, greek, vegetarian, Greek salad, wraps, healthy', false, true);

-- Insert Ingredients for Greek Salad Wraps Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (400, '2 large whole-grain tortillas or wraps');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (401, '1 cup (150g) cherry tomatoes, halved');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (402, '1/2 cucumber, diced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (403, '1/2 red onion, thinly sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (404, '1/2 cup (70g) Kalamata olives, pitted and sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (405, '1/2 cup (75g) crumbled feta cheese');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (406, '1/4 cup (30g) fresh parsley, chopped');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (407, '2 tablespoons extra-virgin olive oil');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (408, '1 tablespoon red wine vinegar');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (409, 'Salt and black pepper, to taste');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (410, '1/2 cup (120g) tzatziki sauce');

-- Link Ingredients to Greek Salad Wraps Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (400, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (401, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (402, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (403, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (404, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (405, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (406, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (407, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (408, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (409, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (410, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

-- Insert Steps for Greek Salad Wraps Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (400, 1, 'In a large bowl, combine cherry tomatoes, cucumber, red onion, Kalamata olives, crumbled feta cheese, and chopped parsley.');
INSERT INTO steps (step_id, rank, instruction) VALUES (401, 2, 'In a small bowl, whisk together extra-virgin olive oil and red wine vinegar to make the dressing. Season with salt and black pepper.');
INSERT INTO steps (step_id, rank, instruction) VALUES (402, 3, 'Pour the dressing over the salad mixture and toss to coat all ingredients evenly.');
INSERT INTO steps (step_id, rank, instruction) VALUES (403, 4, 'Warm the whole-grain tortillas or wraps in a microwave for a few seconds or in a dry skillet.');
INSERT INTO steps (step_id, rank, instruction) VALUES (404, 5, 'Place half of the Greek salad mixture onto each tortilla or wrap, leaving some space at the edges.');
INSERT INTO steps (step_id, rank, instruction) VALUES (405, 6, 'Drizzle tzatziki sauce over the salad mixture.');
INSERT INTO steps (step_id, rank, instruction) VALUES (406, 7, 'Fold the sides of the tortilla in and roll it up tightly, securing the ends.');
INSERT INTO steps (step_id, rank, instruction) VALUES (407, 8, 'Cut each wrap in half diagonally to serve.');
INSERT INTO steps (step_id, rank, instruction) VALUES (408, 9, 'Enjoy your delicious and refreshing Greek Salad Wraps!');

-- Link Steps to Greek Salad Wraps Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (400, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (401, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (402, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (403, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (404, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (405, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (406, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (407, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (408, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

-- -- Link Tags to Greek Salad Wraps Recipe
-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES ((SELECT tag_id FROM tags WHERE tag = 'vegetarian'), (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES ((SELECT tag_id FROM tags WHERE tag = 'kosher'), (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));

-- INSERT INTO recipes_tags (tag_id, recipe_id)
-- VALUES ((SELECT tag_id FROM tags WHERE tag = 'pescetarian'), (SELECT recipe_id FROM recipes WHERE recipe_name = 'Greek Salad Wraps'));


-- Insert Vegetarian Spring Rolls Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Vegetarian Spring Rolls', 'https://tastesbetterfromscratch.com/wp-content/uploads/2013/03/Fresh-Spring-Rolls-15.jpg', 'Fresh and crispy vegetarian spring rolls with a flavorful dipping sauce.', 4, 'spring rolls, vegetarian, appetizer, asian, chinese, vegetable, healthy', false, true);

-- Insert Ingredients for Vegetarian Spring Rolls Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (500, '8 spring roll wrappers');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (501, '2 cups (200g) shredded lettuce');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (502, '1 cup (100g) shredded carrots');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (503, '1 cup (100g) cucumber, thinly sliced');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (504, '1/2 cup (50g) bean sprouts');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (505, '1/2 cup (50g) fresh mint leaves');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (506, '1/2 cup (50g) fresh cilantro leaves');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (507, '8 rice paper wrappers');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (508, 'Peanut dipping sauce, for serving');

-- Link Ingredients to Vegetarian Spring Rolls Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (500, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (501, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (502, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (503, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (504, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (505, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (506, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (507, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (508, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));

-- Insert Steps for Vegetarian Spring Rolls Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (500, 1, 'Fill a large bowl with warm water. Dip one rice paper wrapper into the water for a few seconds until it softens.');
INSERT INTO steps (step_id, rank, instruction) VALUES (501, 2, 'Lay the softened wrapper flat on a clean surface.');
INSERT INTO steps (step_id, rank, instruction) VALUES (502, 3, 'Place a small amount of shredded lettuce, carrots, cucumber, bean sprouts, fresh mint leaves, and fresh cilantro leaves in the center of the wrapper.');
INSERT INTO steps (step_id, rank, instruction) VALUES (503, 4, 'Fold the sides of the wrapper over the filling, then roll up tightly from the bottom to enclose the filling, like a burrito.');
INSERT INTO steps (step_id, rank, instruction) VALUES (504, 5, 'Repeat with the remaining wrappers and filling ingredients.');
INSERT INTO steps (step_id, rank, instruction) VALUES (505, 6, 'Serve the vegetarian spring rolls with peanut dipping sauce on the side.');

-- Link Steps to Vegetarian Spring Rolls Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (500, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (501, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (502, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (503, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (504, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (505, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Vegetarian Spring Rolls'));


-- Insert Chocolate Cheesecake Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'Chocolate Cheesecake', 'https://www.recipetineats.com/wp-content/uploads/2021/03/Nutella-Cheesecake_2.jpg', 'A rich and creamy chocolate cheesecake with a chocolate cookie crust.', 8, 'chocolate, cheesecake, cake, dessert', false, true);

-- Insert Ingredients for Chocolate Cheesecake Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (600, '1 1/2 cups (150g) chocolate cookie crumbs');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (601, '1/4 cup (60g) unsalted butter, melted');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (602, '3 cups (675g) cream cheese, softened');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (603, '1 1/2 cups (300g) granulated sugar');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (604, '1/2 cup (60g) unsweetened cocoa powder');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (605, '4 large eggs');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (606, '1 cup (240ml) heavy cream');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (607, '1 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (608, '1/2 cup (90g) semisweet chocolate chips');

-- Link Ingredients to Chocolate Cheesecake Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (600, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (601, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (602, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (603, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (604, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (605, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (606, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (607, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (608, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));

-- Insert Steps for Chocolate Cheesecake Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (600, 1, 'Preheat your oven to 325*F (160*C).');
INSERT INTO steps (step_id, rank, instruction) VALUES (601, 2, 'In a bowl, mix the chocolate cookie crumbs and melted butter. Press this mixture firmly into the bottom of a 9-inch (23cm) springform pan.');
INSERT INTO steps (step_id, rank, instruction) VALUES (602, 3, 'In a large bowl, beat the cream cheese until smooth and creamy.');
INSERT INTO steps (step_id, rank, instruction) VALUES (603, 4, 'Add granulated sugar and cocoa powder to the cream cheese and beat until well combined.');
INSERT INTO steps (step_id, rank, instruction) VALUES (604, 5, 'Add eggs one at a time, mixing well after each addition.');
INSERT INTO steps (step_id, rank, instruction) VALUES (605, 6, 'Stir in the heavy cream and vanilla extract.');
INSERT INTO steps (step_id, rank, instruction) VALUES (606, 7, 'Pour the cheesecake batter into the prepared crust.');
INSERT INTO steps (step_id, rank, instruction) VALUES (607, 8, 'Sprinkle chocolate chips evenly over the top.');
INSERT INTO steps (step_id, rank, instruction) VALUES (608, 9, 'Bake in the preheated oven for 45-50 minutes, or until the edges are set but the center is slightly jiggly.');

-- Link Steps to Chocolate Cheesecake Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (600, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (601, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (602, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (603, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (604, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (605, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (606, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (607, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (608, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Chocolate Cheesecake'));



-- Insert Peach Cobbler Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'sefanit'), 'Peach Cobbler', 'https://www.the-girl-who-ate-everything.com/wp-content/uploads/2013/06/peach-cobbler-16-scaled.jpg', 'A warm and comforting peach cobbler with a buttery crust and sweet peach filling.', 6, 'peach, cobbler, pie, cake, desserts, fall, autumn, dessert', true, true);

-- Insert Ingredients for Peach Cobbler Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (700, '4 cups (600g) sliced peaches (fresh or canned)');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (701, '1 cup (200g) granulated sugar');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (702, '1 cup (240ml) milk');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (703, '1/2 cup (115g) unsalted butter');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (704, '1 cup (120g) all-purpose flour');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (705, '2 teaspoons baking powder');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (706, '1/2 teaspoon salt');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (707, '1 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (708, 'Ground cinnamon, for sprinkling (optional)');

-- Link Ingredients to Peach Cobbler Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (700, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (701, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (702, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (703, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (704, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (705, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (706, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (707, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (708, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));

-- Insert Steps for Peach Cobbler Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (700, 1, 'Preheat your oven to 350*F (175*C).');
INSERT INTO steps (step_id, rank, instruction) VALUES (701, 2, 'In a saucepan, melt the butter over low heat.');
INSERT INTO steps (step_id, rank, instruction) VALUES (702, 3, 'In a mixing bowl, combine the flour, sugar, baking powder, and salt.');
INSERT INTO steps (step_id, rank, instruction) VALUES (703, 4, 'Stir in the milk and vanilla extract until the batter is smooth.');
INSERT INTO steps (step_id, rank, instruction) VALUES (704, 5, 'Pour the melted butter into a 9x13-inch (23x33cm) baking dish.');
INSERT INTO steps (step_id, rank, instruction) VALUES (705, 6, 'Pour the batter over the melted butter in the baking dish. Do not stir.');
INSERT INTO steps (step_id, rank, instruction) VALUES (706, 7, 'Distribute the sliced peaches evenly over the batter. Do not stir.');
INSERT INTO steps (step_id, rank, instruction) VALUES (707, 8, 'Sprinkle ground cinnamon on top if desired.');
INSERT INTO steps (step_id, rank, instruction) VALUES (708, 9, 'Bake for 45-50 minutes or until the cobbler is golden brown and bubbling.');

-- Link Steps to Peach Cobbler Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (700, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (701, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (702, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (703, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (704, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (705, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (706, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (707, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (708, (SELECT recipe_id FROM recipes WHERE recipe_name = 'Peach Cobbler'));

-- Insert French Toast Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'admin'), 'French Toast', 'https://hips.hearstapps.com/hmg-prod/images/how-to-make-french-toast-1589827448.jpg?crop=0.734xw:0.490xh;0.0897xw,0.323xh&resize=1200:*', 'Classic French toast made with thick slices of bread dipped in a sweet and custardy mixture.', 2, 'French toast, breakfast, brunch, french, bread', true, true);

-- Insert Ingredients for French Toast Recipe
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (800, '4 slices of thick bread (such as brioche or challah)');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (801, '2 large eggs');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (802, '1/2 cup (120ml) milk');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (803, '1/2 teaspoon vanilla extract');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (804, '1/4 teaspoon ground cinnamon (optional)');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (805, 'Pinch of salt');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (806, '2 tablespoons (30g) unsalted butter');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (807, 'Maple syrup, for serving');
INSERT INTO ingredients (ingredient_id, ingredient) VALUES (808, 'Fresh berries, for garnish (optional)');

-- Link Ingredients to French Toast Recipe
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (800, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (801, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (802, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (803, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (804, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (805, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (806, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (807, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO ingredients_recipes (ingredient_id, recipe_id) VALUES (808, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));

-- Insert Steps for French Toast Recipe
INSERT INTO steps (step_id, rank, instruction) VALUES (800, 1, 'In a shallow bowl, whisk together eggs, milk, vanilla extract, ground cinnamon (if using), and a pinch of salt.');
INSERT INTO steps (step_id, rank, instruction) VALUES (801, 2, 'Heat a non-stick skillet or griddle over medium-high heat and add 1 tablespoon of butter to melt.');
INSERT INTO steps (step_id, rank, instruction) VALUES (802, 3, 'Dip each slice of bread into the egg mixture, allowing it to soak for a few seconds on each side.');
INSERT INTO steps (step_id, rank, instruction) VALUES (803, 4, 'Place the dipped bread slices onto the hot skillet or griddle.');
INSERT INTO steps (step_id, rank, instruction) VALUES (804, 5, 'Cook until both sides are golden brown and crisp, about 3-4 minutes per side.');
INSERT INTO steps (step_id, rank, instruction) VALUES (805, 6, 'Remove the French toast from the skillet and keep warm.');
INSERT INTO steps (step_id, rank, instruction) VALUES (806, 7, 'Repeat with the remaining slices of bread, adding more butter to the skillet as needed.');
INSERT INTO steps (step_id, rank, instruction) VALUES (807, 8, 'Serve the French toast hot with maple syrup and fresh berries, if desired.');

-- Link Steps to French Toast Recipe
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (800, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (801, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (802, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (803, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (804, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (805, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (806, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));
INSERT INTO steps_recipes (step_id, recipe_id) VALUES (807, (SELECT recipe_id FROM recipes WHERE recipe_name = 'French Toast'));



COMMIT TRANSACTION;




