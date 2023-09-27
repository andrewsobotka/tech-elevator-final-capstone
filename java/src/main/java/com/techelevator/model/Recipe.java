package com.techelevator.model;

public class Recipe {

    private int recipeId;
    private String recipeName;
    private String recipeDescription;
    private double servingSize;
    private Ingredient ingredient;
    private Step step;
    private String imgUrl;

    public Recipe() { }                                     //Required for mapRowToRecipe in jdbcRecipeDao to work

    public Recipe(int recipe_id, String title, String description, double serving_size) {
        this.recipeId = recipe_id;
        this.recipeName = title;
        this.recipeDescription = description;
        this.servingSize = serving_size;
    }

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getRecipeDescription() {
        return recipeDescription;
    }

    public void setRecipeDescription(String recipeDescription) {
        this.recipeDescription = recipeDescription;
    }

    public double getServingSize() {
        return servingSize;
    }

    public void setServingSize(double servingSize) {
        this.servingSize = servingSize;
    }

}
