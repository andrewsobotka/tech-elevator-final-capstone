package com.techelevator.dao;

import com.techelevator.model.Ingredient;

import java.util.List;

public interface IngredientDao {

    List<Ingredient> getListOfIngredients();

    List<Ingredient> getListOfIngredientsByRecipeId(int recipe_id);


}
