package com.techelevator.dao;

import com.techelevator.model.Recipe;
import com.techelevator.model.Tag;
import com.techelevator.model.User;

import java.security.Principal;
import java.util.List;

public interface RecipeDao {

    List<Recipe> getListOfRecipes();

    Recipe getRecipeByRecipeId(int recipe_id);

    List<Recipe> getFeaturedRecipesByRecipeId();

    List<Recipe> getRecipesByKeyWords(String keywords);

    List<Recipe> getRecipesByIngredient(String ingredient);

    Integer createRecipe(Recipe recipe, int userId);

    int deleteRecipeByRecipeId(int recipe_id);

    String getCreatorUsernameByRecipeId(int recipeId);
    Recipe getRecipeByTagId(int tag_id);
}
