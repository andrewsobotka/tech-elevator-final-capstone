package com.techelevator.dao;

import com.techelevator.model.Step;

import java.util.List;

public interface StepDao {

    List<Step> getListOfSteps();

    List<Step> getListOfStepsByRecipeId(int recipe_id);

}
