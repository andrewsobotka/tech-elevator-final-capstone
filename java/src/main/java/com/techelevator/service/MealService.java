package com.techelevator.service;

import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
public class MealService {
    private final MealDao mealDao;
    public MealService(MealDao mealDao){
        this.mealDao = mealDao;
    }
    public Meal getMeal(int meal_id) {
        Meal meal = mealDao.getMealByMealId(meal_id);
        // TODO: Get All Recipes in a single Meal
        System.out.println("TODO: Get All Recipes in each Meal");
        return meal;
    }

    public List<Meal> getAllMyMealsByUserId(Principal principal) {
        return mealDao.getListOfMyMeals(principal);
    }
}
