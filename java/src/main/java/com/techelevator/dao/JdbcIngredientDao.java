package com.techelevator.dao;

import com.techelevator.model.Ingredient;
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

    private Ingredient mapRowToIngredient(SqlRowSet rs) {
        Ingredient ingredient = new Ingredient();
        ingredient.setIngredient_id(rs.getInt("ingredient_id"));
        ingredient.setIngredient(rs.getString("ingredient"));
        return ingredient;
    }

}
