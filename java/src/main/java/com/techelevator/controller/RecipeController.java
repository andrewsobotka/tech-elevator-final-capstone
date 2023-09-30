package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class  RecipeController {

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
//    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/recipes")
    public Recipe createNewRecipe(@RequestBody Recipe recipe){
//TODO: NEED TO GET THE LOGGED IN USER'S ID...USING USER_ID = 1 FOR NOW..........

        return recipeDao.createNewRecipe(recipe);

    }

    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId){    //retrieving recipe by recipeId

        return recipeService.getRecipe(recipeId);           //calling the recipe service

    }

    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes(@PathVariable int recipeId){     //retrieving featured recipes by recipeId

        return recipeDao.getFeaturedRecipesByRecipeId(recipeId);            //calling recipeDao

    }
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url){              //retrieving imported recipe

        return recipeService.importRecipe(url);                             //calling the recipe service

    }

    @GetMapping("/keywords")
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords){        //retrieving list of recipes by keywords

        return recipeDao.getRecipesByKeyWords(keywords);

    }

    @GetMapping("/ingredients")
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient){        //retrieving list of recipes by ingredient

        return recipeService.getRecipesByIngredient(ingredient);            //calling the recipe service

    }



}
