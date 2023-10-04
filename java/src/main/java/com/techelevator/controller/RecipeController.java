package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
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
    @GetMapping("/recipes/{recipeId}/creator")
    public String getCreatorUsernameByRecipeId(@PathVariable int recipeId) {
        return recipeService.getCreatorUsernameByRecipeId(recipeId);
    }
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/recipes")
    public Integer createRecipe(@RequestBody Recipe recipe, Principal principal) {
        return recipeService.createRecipe(recipe, principal);
    }

    @GetMapping("/recipes/tags/{tagId}")
    public List<Recipe> getRecipesByTagId(@PathVariable int tagId){
        return recipeService.getRecipesByTagId(tagId);
    }

    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes() {
        return recipeDao.getFeaturedRecipesByRecipeId();
    }

    @RequestMapping(path = "/recipes/{recipeId}/featured",method = RequestMethod.PUT)
    public Recipe update(@Valid @RequestBody Recipe recipe, @PathVariable int recipeId) {
        recipe.setRecipeId(recipeId);
        try {
            Recipe updatedRecipe = recipeDao.setFeaturedRecipe(recipe);
            return updatedRecipe;

        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, " Recipe not found");
        }
    }

    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url) {
        return recipeService.importRecipe(url);
    }
    @GetMapping("/keywords")
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords){        //retrieving list of recipes by keywords
        return recipeDao.getRecipesByKeyWords(keywords);
    }
    @GetMapping("/ingredients")
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient) {
        return recipeService.getRecipesByIngredient(ingredient);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path ="/recipes/{id}", method = RequestMethod.DELETE)
    public void delete (@PathVariable int recipeId){
        recipeDao.deleteRecipeByRecipeId(recipeId);
    }



}
