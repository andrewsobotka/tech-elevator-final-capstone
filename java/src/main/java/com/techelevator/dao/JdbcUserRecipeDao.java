package com.techelevator.dao;

import com.techelevator.model.Recipe;
import com.techelevator.model.UserRecipe;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcUserRecipeDao implements UserRecipeDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcUserRecipeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

//    @Override
//    public List<UserRecipe> getListOfUsersRecipes() {                //All Recipes in main "library"
//        List<UserRecipe> userRecipes = new ArrayList<>();
//        String sql = "select * from recipes";                        //??????????????????
//
//        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
//        while (results.next()) {
//            UserRecipe userRecipe = mapRowToUserRecipe(results);
//            userRecipes.add(userRecipe);
//        }
//
//        return userRecipes;
//    }

}
