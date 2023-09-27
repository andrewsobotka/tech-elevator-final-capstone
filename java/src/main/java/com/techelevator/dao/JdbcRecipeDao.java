package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import com.techelevator.model.User;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

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

    @Override
    public Recipe createRecipe(String title, String description, double serving_size) {
        Recipe recipe = null;

        String sql = "INSERT INTO recipes (title, description, serving_size) " +
                "VALUES (?,?,?) RETURNING recipe_id ;";

//TODO: TO UPDATE INGREDIENT & STEPS TABLES

        try {

            int id = jdbcTemplate.queryForObject(sql, int.class,
                    recipe.getTitle(), recipe.getDescription(), recipe.getServing_size());

            return getRecipe(id);


        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException ("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException ("Data integrity violation", e);
        }
    }

//TODO: CREATE 'COPYRECIPE' METHOD
//    @Override
//    public Recipe copyRecipe(String title, String description, double serving_size) {
//
//    }

    private Recipe mapRowToRecipe(SqlRowSet rs) {
        Recipe recipe = new Recipe();
        recipe.setRecipe_id(rs.getInt("recipe_id"));
        recipe.setTitle(rs.getString("title"));
        recipe.setDescription(rs.getString("description"));
        recipe.setServing_size(rs.getDouble("serving_size"));
        return recipe;
    }
}
