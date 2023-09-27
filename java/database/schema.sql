BEGIN TRANSACTION;

-- SAGE(ALPHA)
-- Default Database

-- Essential Primary Tables

-- Users
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
	user_id SERIAL,
	username varchar (50) NOT NULL UNIQUE,
	profile_url varchar (255),
	password_hash varchar (200) NOT NULL,
	role varchar (50) NOT NULL,
	is_private boolean DEFAULT false,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

-- Recipes
DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
    recipe_id SERIAL,
    creator_id int,
    title varchar (63) NOT NULL UNIQUE,
    image_url varchar (255),
    description text NOT NULL,
    serving_size int NOT NULL,
    is_published boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    CONSTRAINT PK_recipe PRIMARY KEY (recipe_id)
);

-- Ingredients
DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
    ingredient_id SERIAL,
    ingredient varchar (63),
    quantity varchar (64),
    CONSTRAINT PK_ingredient PRIMARY KEY (ingredient_id)
);

-- Steps
DROP TABLE IF EXISTS steps CASCADE;
CREATE TABLE steps (
    step_id SERIAL,
    rank int NOT NULL,
    instruction text,
    CONSTRAINT PK_steps PRIMARY KEY (step_id)
);

-- Meals
DROP TABLE IF EXISTS meals CASCADE;
CREATE TABLE meals (
    meal_id int,
    meal_name varchar (63),
    meal_date date,
    CONSTRAINT PK_meals PRIMARY KEY (meal_id)
);

-- Essential Joined Table

-- Joining users on recipes
DROP TABLE IF EXISTS users_recipes CASCADE;
CREATE TABLE users_recipes (
    user_id int NOT NULL,
    recipe_id int NOT NULL
);

ALTER TABLE users_recipes
    ADD CONSTRAINT "fk_user_id"
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);

ALTER TABLE users_recipes
    ADD CONSTRAINT "fk_recipe_id"
    FOREIGN KEY (recipe_id)
    REFERENCES recipes (recipe_id);

-- Joining steps on recipes
DROP TABLE IF EXISTS steps_recipes CASCADE;
CREATE TABLE steps_recipes (
    step_id int NOT NULL,
    recipe_id int NOT NULL
);

ALTER TABLE steps_recipes
    ADD CONSTRAINT "fk_step_id"
    FOREIGN KEY (step_id)
    REFERENCES steps (step_id);

ALTER TABLE steps_recipes
    ADD CONSTRAINT "fk_steps_recipe_id"
    FOREIGN KEY (recipe_id)
    REFERENCES recipes (recipe_id);

-- Joining ingredients on recipes
DROP TABLE IF EXISTS ingredients_recipes CASCADE;
CREATE TABLE ingredients_recipes (
   ingredient_id int NOT NULL,
   recipe_id int NOT NULL
);

ALTER TABLE ingredients_recipes
    ADD CONSTRAINT "fk_ingredient_id"
    FOREIGN KEY (ingredient_id)
    REFERENCES ingredients (ingredient_id);

ALTER TABLE ingredients_recipes
    ADD CONSTRAINT "fk_ingredients_recipe_id"
    FOREIGN KEY (recipe_id)
    REFERENCES recipes (recipe_id);

-- Joining meals on recipes
DROP TABLE IF EXISTS meals_recipes CASCADE;
CREATE TABLE meals_recipes (
    meal_id int NOT NULL,
    recipe_id int NOT NULL
);

ALTER TABLE meals_recipes
    ADD CONSTRAINT "fk_meals_id"
    FOREIGN KEY (meal_id)
    REFERENCES meals (meal_id);

ALTER TABLE meals_recipes
    ADD CONSTRAINT "fk_meals_recipes_id"
    FOREIGN KEY (recipe_id)
    REFERENCES recipes (recipe_id);

COMMIT TRANSACTION;
