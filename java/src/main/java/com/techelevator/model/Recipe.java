package com.techelevator.model;

import java.util.List;

public class Recipe {

    private int recipeId;
    private int creatorId;
    private String recipeName;
    private String description;
    private double servingSize;
    private String keyWords;
    private List<Ingredient> ingredients;
    private List<Step> steps;
    private String imgUrl;
    private boolean isPublished;
    private boolean isFeatured;


    public Recipe() { }                                     //Required for mapRowToRecipe in jdbcRecipeDao to work

    public Recipe(int recipeId, int creatorId, String recipeName, String description, Double servingSize, String keyWords, List<Ingredient> ingredients, List<Step> steps, String imgUrl, boolean isPublished, boolean isFeatured) {
        this.recipeId = recipeId;
        this.creatorId = creatorId;
        this.recipeName = recipeName;
        this.description = description;
        this.servingSize = servingSize;
        this.keyWords = keyWords;
        this.ingredients = ingredients;
        this.steps = steps;
        this.imgUrl = imgUrl;
        this.isPublished = isPublished;
        this.isFeatured = isFeatured;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getServingSize() {
        return servingSize;
    }

    public void setServingSize(Double servingSize) {
        this.servingSize = servingSize;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public boolean isPublished() {
        return isPublished;
    }

    public void setPublished(boolean published) {
        isPublished = published;
    }

    public boolean isFeatured() {
        return isFeatured;
    }

    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }
    
}
