package com.techelevator.dao;

import com.techelevator.model.Tag;

import java.util.List;

public interface TagDao {

    List<Tag> getTagsByRecipeId(int recipe_id);

}
