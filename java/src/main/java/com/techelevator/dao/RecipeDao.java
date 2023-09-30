package com.techelevator.dao;

import com.techelevator.model.Recipe;
import com.techelevator.model.Tag;
import com.techelevator.model.User;

import java.util.List;

public interface RecipeDao {

    List<Recipe> getListOfRecipes();

    Recipe getRecipeByRecipeId(int recipe_id);

    List<Recipe> getFeaturedRecipesByRecipeId(int recipe_id);

    List<Recipe> getRecipesByKeyWords(String keywords);

    List<Recipe> getRecipesByIngredient(String ingredient);

    Recipe createNewRecipe(Recipe recipe);          //deleted user

}
