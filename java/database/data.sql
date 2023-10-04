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

INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegan'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
);


INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'pescetarian'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
);



INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
 (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus'));

INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
 (SELECT recipe_id FROM recipes WHERE recipe_name = 'Hummus')
 );

-- Start a Transaction for Lemon Sorbet Recipe


-- Insert Lemon Sorbet Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'user'), 'Lemon Sorbet', 'https://i1.wp.com/lmld.org/wp-content/uploads/2022/07/Lemon-Sorbet-6.jpg', 'Refreshing and tangy lemon sorbet.', 4, 'lemon, sorbet, dessert', true, true);

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


INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
);

-- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegan'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
);

-- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
);
-- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'dairy-free'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Lemon Sorbet')
);
-- Commit the Transaction for Lemon Sorbet Recipe


INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Pie', 'https://www.lemonblossoms.com/wp-content/uploads/2020/09/Pumpkin-Pie-S3.jpg', 'A classic pumpkin pie with a flaky crust.', 8, 'pumpkin, pie, dessert', true, true);

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
INSERT INTO steps (step_id, rank, instruction) VALUES (16, 1, 'Preheat your oven to 425°F (220°C).');
INSERT INTO steps (step_id, rank, instruction) VALUES (17, 2, 'In a large mixing bowl, combine the pumpkin puree, granulated sugar, ground cinnamon, ground ginger, ground nutmeg, and ground cloves.');
INSERT INTO steps (step_id, rank, instruction) VALUES (18, 3, 'In a separate bowl, beat the eggs and add them to the pumpkin mixture. Mix well.');
INSERT INTO steps (step_id, rank, instruction) VALUES (19, 4, 'Gradually add the evaporated milk and mix until the filling is smooth.');
INSERT INTO steps (step_id, rank, instruction) VALUES (20, 5, 'Pour the pumpkin filling into the unbaked pie crust.');
INSERT INTO steps (step_id, rank, instruction) VALUES (21, 6, 'Bake in the preheated oven for 15 minutes, then reduce the oven temperature to 350°F (175°C) and continue baking for 40-50 minutes or until a knife inserted near the center comes out clean.');
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

INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);
INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegan'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Pie')
);




-- Insert Pumpkin Spiced Latte Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES ((SELECT user_id FROM users WHERE username = 'coyo'), 'Pumpkin Spiced Latte', 'https://www.inspiredtaste.net/wp-content/uploads/2011/11/Pumpkin-Spice-Latte-Recipe-1200.jpg', 'A warm and comforting pumpkin spiced latte.', 1, 'coffee, pumpkin, pumpkin spice, latte', true, true);





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





INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegetarian'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
);

-- Link "vegan" tag to "Pumpkin Spiced Latte" recipe
INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'vegan'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
);

INSERT INTO recipes_tags (tag_id, recipe_id)
VALUES (
  (SELECT tag_id FROM tags WHERE tag = 'gluten-free'),
  (SELECT recipe_id FROM recipes WHERE recipe_name = 'Pumpkin Spiced Latte')
);



-- Insert French Fries Recipe
INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_featured, is_published)
VALUES (
  (SELECT user_id FROM users WHERE username = 'jackie'), -- Replace 'jackie' with the actual username
  'French Fries',
  'https://www.fifteenspatulas.com/wp-content/uploads/2011/09/French-Fries-Recipe.jpg', -- Replace with the URL of the image
  'Delicious crispy french fries.',
  2, -- Adjust the serving size as needed
  'french fries, potatoes, snack', -- Keywords
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
  (32, 2, 'Heat the oil in a deep fryer or large pan to 350°F (175°C).'),
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





COMMIT TRANSACTION;




