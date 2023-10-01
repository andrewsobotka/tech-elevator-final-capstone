package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Recipe> getListOfRecipes() {                //Displayed on Explore Recipes page (whole "library" of recipes)
        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;
    }

    @Override
    public Recipe getRecipeByRecipeId(int recipe_id) {

        Recipe recipe = null;
        String sql = "SELECT * from recipes where recipe_id = ? ;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
            if (results.next()) {
                recipe = mapRowToRecipe(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return recipe;

    }

    @Override
<<<<<<< HEAD
    public Recipe createNewRecipe(Recipe recipe) {

        Recipe newRecipe = null;
//        String sql_users = "SELECT user_id FROM users WHERE username = ?";

        String sql_recipes = "INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords) " +
                "VALUES (?, ?, ?, ?, ?, ?) RETURNING recipe_id;";

        String sql_users_recipes = "INSERT INTO users_recipes (user_id, recipe_id) " +
                "VALUES (?, ?);";

        try {

//            int user_id = jdbcTemplate.queryForObject(sql_users, int.class, username);
            int newRecipeId = jdbcTemplate.queryForObject(sql_recipes, int.class,
                    1, recipe.getRecipeName(), recipe.getImgUrl(), recipe.getDescription(), recipe.getServingSize(), recipe.getKeywords());
            jdbcTemplate.queryForObject(sql_users_recipes, int.class, 1, newRecipeId);

            newRecipe = getRecipeByRecipeId(newRecipeId);
            newRecipe.setCreatorId(1);

        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return newRecipe;
    }

    @Override
    public List<Recipe> getFeaturedRecipesByRecipeId(int recipe_id) {           //Display Top3-Featured Recipes

=======
    public List<Recipe> getFeaturedRecipesByRecipeId() {           //Display Top3-Featured Recipes
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
        List<Recipe> recipes = new ArrayList<>();
        String sql = "SELECT * FROM recipes WHERE is_featured = true;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }
        return recipes;
    }

    @Override
    public List<Recipe> getRecipesByKeyWords(String keywords) {           //Display Recipes from user input keywords

        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes where keywords ILIKE ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, '%'+keywords+'%');
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;

    }

    @Override
    public List<Recipe> getRecipesByIngredient(String ingredient) {

        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes " +
                "join ingredients_recipes on recipes.recipe_id = ingredients_recipes.recipe_id " +
                "join ingredients on ingredients_recipes.ingredient_id = ingredients.ingredient_id " +
                "where ingredient ILIKE ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, '%'+ingredient+'%');
        while (results.next()) {
            Recipe recipe = mapRowToRecipe(results);
            recipes.add(recipe);
        }

        return recipes;
    }

    @Override
    public Integer createRecipe(Recipe recipe, Principal principal) {           //principal works now!!! :)
        // Get the User ID by Username
        String sql_user_id = "SELECT user_id FROM users " +
                             "WHERE username = ?;";
        // Create New Recipe
        String sql_create_recipe = "INSERT INTO recipes (creator_id, recipe_name, image_url, description, serving_size, keywords, is_published, is_featured) " +
                     "VALUES (?,?,?,?,?,?,?,?) " +
                     "RETURNING recipe_id;";
        Integer recipeId, userId = 0;
        try {
            userId = jdbcTemplate.queryForObject(sql_user_id, Integer.class, principal.getName());
            recipeId = jdbcTemplate.queryForObject(sql_create_recipe, Integer.class, userId, recipe.getRecipeName(), recipe.getImgUrl(), recipe.getDescription(), recipe.getServingSize(), recipe.getKeywords(), recipe.isPublished(), recipe.isFeatured());
        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return recipeId;
    }

    private Recipe mapRowToRecipe(SqlRowSet rs) {
        Recipe recipe = new Recipe();
        recipe.setRecipeId(rs.getInt("recipe_id"));
        recipe.setCreatorId(rs.getInt("creator_id"));
        recipe.setRecipeName(rs.getString("recipe_name"));
        recipe.setImgUrl(rs.getString("image_url"));
        recipe.setDescription(rs.getString("description"));
        recipe.setServingSize(rs.getDouble("serving_size"));
        recipe.setKeywords(rs.getString("keywords"));
        recipe.setPublished(rs.getBoolean("is_published"));
        recipe.setFeatured(rs.getBoolean("is_featured"));

        return recipe;
    }


}
