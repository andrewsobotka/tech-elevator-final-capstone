package com.techelevator.service;

import com.techelevator.dao.IngredientDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.StepDao;
import com.techelevator.dao.TagDao;
import com.techelevator.model.Ingredient;
import com.techelevator.model.Recipe;
import com.techelevator.model.Step;
import com.techelevator.model.Tag;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RecipeService {
//SERVICE CLASS IS THE MIDDLEMAN TO KEEP DAO (BUSINESS LOGIC) AND CONTROLLER (DIRECTS TRAFFIC) CLASSES CLEAN

    private RecipeDao recipeDao;

    private RecipeImportService recipeImportService;

    private IngredientDao ingredientDao;

    private TagDao tagDao;

    private StepDao stepDao;

    public RecipeService(RecipeDao recipeDao, RecipeImportService recipeImportService, TagDao tagDao, IngredientDao ingredientDao, StepDao stepDao) {
        this.recipeDao = recipeDao;
        this.recipeImportService = recipeImportService;
        this.tagDao = tagDao;
        this.ingredientDao = ingredientDao;
        this.stepDao = stepDao;
    }

    public Recipe importRecipe(String url) {
        return recipeImportService.importFromUrl(url);
    }

    public Recipe getRecipe(int recipe_id) {
        Recipe recipe = recipeDao.getRecipeByRecipeId(recipe_id);       //get recipe by recipeId

        List<Tag> tags = tagDao.getTagsByRecipeId(recipe_id);        //then get their tags now...
        recipe.setTags(tags);

        List<Ingredient> ingredients = ingredientDao.getListOfIngredientsByRecipeId(recipe_id);
        recipe.setIngredients(ingredients);

        List<Step> steps = stepDao.getListOfStepsByRecipeId(recipe_id);
        recipe.setSteps(steps);

        return recipe;
    }

    public List<Recipe> getRecipesByIngredient (String ingredient) {
        List<Recipe> recipes = recipeDao.getRecipesByIngredient(ingredient);
        return recipes;
    }

//TODO: CREATE A SERVICE FOR RETRIEVING A RECIPE BY STEPS


}
