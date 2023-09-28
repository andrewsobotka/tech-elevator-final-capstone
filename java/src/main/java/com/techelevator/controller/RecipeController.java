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
    public List<Recipe> getRecipes(){

        return recipeDao.getListOfRecipes();

    }

    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId){

        return recipeService.getRecipe(recipeId);       //calling the service

    }

    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes(@PathVariable int recipeId){

        return recipeDao.getFeaturedRecipesByRecipeId(recipeId);

    }

    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url){

        return recipeService.importRecipe(url);

    }

    //TODO: Create keywords endpoint

    //TODO: Create tags endpoint

}
