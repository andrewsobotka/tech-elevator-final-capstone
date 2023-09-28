package com.techelevator.service;

import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.TagDao;
import com.techelevator.model.Recipe;
import com.techelevator.model.Tag;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecipeService {
//SERVICE CLASS IS THE MIDDLEMAN TO KEEP DAO (BUSINESS LOGIC) AND CONTROLLER (DIRECTS TRAFFIC) CLASSES CLEAN

    private RecipeDao recipeDao;

    private RecipeImportService recipeImportService;

    private TagDao tagDao;

    public RecipeService(RecipeDao recipeDao, RecipeImportService recipeImportService, TagDao tagDao) {
        this.recipeDao = recipeDao;
        this.recipeImportService = recipeImportService;
        this.tagDao = tagDao;
    }

    public Recipe importRecipe(String url) {
        return recipeImportService.importFromUrl(url);
    }

    public Recipe getRecipe(int recipe_id) {
        Recipe recipe = recipeDao.getRecipeByRecipeId(recipe_id);       //get recipes
        List<Tag> tags = tagDao.getTagsByRecipeId(recipe_id);        //get tags now...
        recipe.setTags(tags);
        //DO THIS FOR STEPS, INGREDIENTS
//        List<Tag> tags = recipeDao.getTagsByRecipeId(recipe_id);
//        recipe.setTags(tags);
        return recipe;
    }



}
