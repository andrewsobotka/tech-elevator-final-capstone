package com.techelevator.dao;

import com.techelevator.model.Recipe;
import com.techelevator.model.User;

import java.util.List;

public interface RecipeDao {

    List<Recipe> getListOfRecipes();

    Recipe getRecipeByRecipeId(int recipe_id);

//    Recipe getRecipeByUsername(String username);

    Recipe getRecipe(int recipe_id);

    Recipe createRecipe(String title, String description, double serving_size);

}
