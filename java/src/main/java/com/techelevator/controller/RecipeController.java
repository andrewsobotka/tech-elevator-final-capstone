package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class  RecipeController {
    private final RecipeDao recipeDao;
    private final RecipeService recipeService;
    public RecipeController(RecipeDao recipeDao, RecipeService recipeService) {
        this.recipeDao = recipeDao;
        this.recipeService = recipeService;
    }
    @GetMapping("/recipes")
    public List<Recipe> getRecipes() {
        return recipeDao.getListOfRecipes();
    }
    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId) {
        return recipeService.getRecipe(recipeId);
    }
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/recipes")
    public Integer createRecipe(@RequestBody Recipe recipe, Principal principal) {
        return recipeService.createRecipe(recipe, principal);
    }
    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes() {
        return recipeDao.getFeaturedRecipesByRecipeId();
    }
    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url) {
        return recipeService.importRecipe(url);
    }
    @GetMapping("/keywords")
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords) {
        return recipeDao.getRecipesByKeyWords(keywords);
    }
    @GetMapping("/ingredients")
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient) {
        return recipeService.getRecipesByIngredient(ingredient);
    }
}
