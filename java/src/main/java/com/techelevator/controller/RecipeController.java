package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class RecipeController {

    private RecipeDao recipeDao;

    private RecipeService recipeService;

    public RecipeController(RecipeDao recipeDao, RecipeService recipeService) {
        this.recipeDao = recipeDao;
        this.recipeService = recipeService;
    }

    @GetMapping("/recipes")
    public List<Recipe> getRecipes(){               //retrieving all recipes from "main" library

        return recipeDao.getListOfRecipes();        //calling recipeDao

    }

    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId){    //retrieving recipe tags by recipeId

        return recipeService.getRecipeTags(recipeId);           //calling the recipe service

    }

    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes(@PathVariable int recipeId){     //retrieving featured recipes

        return recipeDao.getFeaturedRecipesByRecipeId(recipeId);            //calling recipeDao

    }

    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url){              //retrieving imported recipe

        return recipeService.importRecipe(url);                             //calling the recipe service

    }

    @GetMapping("/keywords")
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords){        //retrieving list of recipes

        return recipeDao.getRecipesByKeyWords(keywords);

    }

    @GetMapping("/ingredients")
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient){

        return recipeService.getRecipesByIngredient(ingredient);            //calling the recipe service

    }

}
