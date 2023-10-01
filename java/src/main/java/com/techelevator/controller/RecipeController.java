package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

<<<<<<< HEAD
import javax.validation.Valid;
=======
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
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
<<<<<<< HEAD
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

=======
    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId) {
        return recipeService.getRecipe(recipeId);
    }
    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/recipes")
    public Integer createRecipe(@RequestBody Recipe recipe, Principal principal) {
        return recipeService.createRecipe(recipe, principal);
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
    }
    @GetMapping("/featured")
<<<<<<< HEAD
    public List<Recipe> getFeaturedRecipes(@PathVariable int recipeId){     //retrieving featured recipes by recipeId

        return recipeDao.getFeaturedRecipesByRecipeId(recipeId);            //calling recipeDao

    }
    @PreAuthorize("hasRole('ROLE_ADMIN')")
=======
    public List<Recipe> getFeaturedRecipes() {
        return recipeDao.getFeaturedRecipesByRecipeId();
    }
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url) {
        return recipeService.importRecipe(url);
    }
    @GetMapping("/keywords")
<<<<<<< HEAD
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords){        //retrieving list of recipes by keywords

=======
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords) {
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
        return recipeDao.getRecipesByKeyWords(keywords);
    }
    @GetMapping("/ingredients")
<<<<<<< HEAD
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient){        //retrieving list of recipes by ingredient

        return recipeService.getRecipesByIngredient(ingredient);            //calling the recipe service

    }



=======
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient) {
        return recipeService.getRecipesByIngredient(ingredient);
    }
>>>>>>> bc60f87e77c324969b937eac362c1875f5bbcc07
}
