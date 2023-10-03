package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Ingredient;
import com.techelevator.model.Tag;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.relational.core.sql.In;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcIngredientDao implements IngredientDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcIngredientDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Ingredient> getListOfIngredients() {                    //list of ALL ingredients in "main library"
        List<Ingredient> ingredients = new ArrayList<>();
        String sql = "select * from ingredients";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Ingredient ingredient = mapRowToIngredient(results);
            ingredients.add(ingredient);
        }

        return ingredients;
    }

    @Override
    public List<Ingredient> getListOfIngredientsByRecipeId(int recipe_id) {
        List<Ingredient> ingredients = new ArrayList<>();

        String sql = "select * from ingredients " +
                "join ingredients_recipes on ingredients_recipes.ingredient_id = ingredients.ingredient_id " +
                "join recipes on ingredients_recipes.recipe_id = recipes.recipe_id " +
                "where recipes.recipe_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
        while (results.next()) {
            Ingredient ingredient = mapRowToIngredient(results);
            ingredients.add(ingredient);
        }

        return ingredients;
    }

    private Ingredient getIngredientByIngredientName(String ingredientName) {                   //helper method LOCAL so private
        Ingredient ingredient = null;
        String sql = "SELECT * FROM ingredients WHERE ingredient ILIKE ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, ingredientName);
            if (results.next()) {
                ingredient = mapRowToIngredient(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return ingredient;
    }

    @Override
    public Integer createIngredient(Ingredient ingredient) {

        String sql = "INSERT INTO ingredients (ingredient) " +
                "VALUES (?) " +
                "RETURNING ingredient_id;";

        Integer ingredientId;

        try{
            ingredientId = jdbcTemplate.queryForObject(sql, Integer.class, ingredient.getIngredient());
        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return ingredientId;
    }

    @Override
    public Integer createIngredientForRecipe(Ingredient ingredient, int recipe_id) {
        String sql = "INSERT INTO ingredients (ingredient) " +
                "VALUES (?) " +
                "RETURNING ingredient_id;";

        String sql2 = "INSERT INTO ingredients_recipes (ingredient_id, recipe_id) " +
                "VALUES (?, ?);";

        Integer ingredientId;
        Ingredient existingIngredient = getIngredientByIngredientName(ingredient.getIngredient());            //variable to check if ing is in database already..

        try {
            if(existingIngredient == null){                                //if this ing doesn't exist in the database...
                ingredientId = jdbcTemplate.queryForObject(sql, Integer.class, ingredient.getIngredient());
            } else {                                                //if this ing is already in the database...
                ingredientId = existingIngredient.getIngredient_id();
            }
            jdbcTemplate.update(sql2, recipe_id, ingredientId);

        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return ingredientId;
    }

    @Override
    public int deleteIngredientByIngredientId(int ingredient_id){
        int numberOfRows = 0;
        String sql = "DELETE FROM ingredients WHERE ingredient_id = ?";
        try {
            numberOfRows = jdbcTemplate.update(sql, ingredient_id);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return numberOfRows;
    }

    private Ingredient mapRowToIngredient(SqlRowSet rs) {
        Ingredient ingredient = new Ingredient();
        ingredient.setIngredient_id(rs.getInt("ingredient_id"));
        ingredient.setIngredient(rs.getString("ingredient"));
        return ingredient;
    }

}
