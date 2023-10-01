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

<<<<<<< HEAD
    Recipe createNewRecipe(Recipe recipe);          //deleted user

=======
    Integer createRecipe(Recipe recipe, Principal principal);
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
}
