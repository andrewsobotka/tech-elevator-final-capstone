package com.techelevator.service;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import com.techelevator.model.Tag;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecipeService {
//SERVICE CLASS IS THE MIDDLEMAN TO KEEP DAO (BUSINESS LOGIC) AND CONTROLLER (DIRECTS TRAFFIC) CLASSES CLEAN

    private RecipeDao recipeDao;

    public RecipeService(RecipeDao recipeDao) {
        this.recipeDao = recipeDao;
    }

    public Recipe getRecipe(int recipe_id) {
        Recipe recipe = recipeDao.getRecipeByRecipeId(recipe_id);
        List<Tag> tags = recipeDao.getTagsByRecipeId(recipe_id);
        recipe.setTags(tags);
        //DO THIS FOR STEPS, INGREDIENTS
//        List<Tag> tags = recipeDao.getTagsByRecipeId(recipe_id);
//        recipe.setTags(tags);
        return recipe;
    }



}
