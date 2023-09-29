package com.techelevator.dao;

import com.techelevator.model.Meal;

import java.util.List;

public interface MealDao {

    List<Meal> getListOfMeals();
    Meal getMealByMealId(int meal_id);

}
