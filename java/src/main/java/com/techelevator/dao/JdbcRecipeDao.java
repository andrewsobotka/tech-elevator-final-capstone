package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRecipeDao implements RecipeDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Recipe> getListOfRecipes() {                //All Recipes in main "library"
        List<Recipe> recipes = new ArrayList<>();
        String sql = "select * from recipes";

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


    //Get a recipe by username...accessing your own "library" of recipes
//    @Override
//    public Recipe getRecipeByUsername(String username) throws UsernameNotFoundException {
//        String sql = "SELECT title, description, serving_size FROM recipes WHERE username ILIKE ?;";
//        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, username);
//        if (rowSet.next()){
//            return mapRowToRecipe(rowSet);
//        }
//        throw new UsernameNotFoundException("User " + username + " was not found.");
//    }

    @Override
    public Recipe getRecipe(int recipe_id) {

        String sql = "SELECT * FROM recipes where recipe_id = ?";

        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, recipe_id);
        Recipe recipe = null;

        if (rowSet.next()) {
            recipe = mapRowToRecipe(rowSet);
        }

        return recipe;
    }

    private Recipe mapRowToRecipe(SqlRowSet rs) {
        Recipe recipe = new Recipe();
        recipe.setRecipeId(rs.getInt("recipe_id"));
        recipe.setCreatorId(rs.getInt("creator_id"));
        recipe.setRecipeName(rs.getString("recipe_name"));
        recipe.setImgUrl(rs.getString("image_url"));
        recipe.setDescription(rs.getString("description"));
        recipe.setServingSize(rs.getDouble("serving_size"));
        recipe.setKeyWords(rs.getString("keywords"));
        recipe.setPublished(rs.getBoolean("is_published"));
        recipe.setFeatured(rs.getBoolean("is_featured"));

        return recipe;
    }
}
