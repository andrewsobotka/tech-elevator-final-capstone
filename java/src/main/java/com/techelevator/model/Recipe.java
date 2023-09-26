package com.techelevator.model;

public class Recipe {

    private int recipe_id;
    private String title;

    private String description;

    private double serving_size;

    private boolean is_private;

    public Recipe(int recipe_id, String title, String description, double serving_size, boolean is_private) {
        this.recipe_id = recipe_id;
        this.title = title;
        this.description = description;
        this.serving_size = serving_size;
        this.is_private = is_private;
    }

    public int getRecipe_id() {
        return recipe_id;
    }

    public void setRecipe_id(int recipe_id) {
        this.recipe_id = recipe_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getServing_size() {
        return serving_size;
    }

    public void setServing_size(double serving_size) {
        this.serving_size = serving_size;
    }

    public boolean isIs_private() {
        return is_private;
    }

    public void setIs_private(boolean is_private) {
        this.is_private = is_private;
    }
}