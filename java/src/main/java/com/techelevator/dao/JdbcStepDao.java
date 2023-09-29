package com.techelevator.dao;

import com.techelevator.model.Ingredient;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
import com.techelevator.model.Step;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcStepDao implements StepDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcStepDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Step> getListOfSteps() {
        List<Step> steps = new ArrayList<>();
        String sql = "select * from steps";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Step step = mapRowToStep(results);
            steps.add(step);
        }

        return steps;
    }

    @Override
    public List<Step> getListOfStepsByRecipeId(int recipe_id) {
        List<Step> steps = new ArrayList<>();

        String sql = "select * from steps " +
                "join steps_recipes on steps_recipes.step_id = steps.step_id " +
                "join recipes on steps_recipes.recipe_id = recipes.recipe_id " +
                "where recipes.recipe_id = ?";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
        while (results.next()) {
            Step step = mapRowToStep(results);
            steps.add(step);
        }

        return steps;
    }

    private Step mapRowToStep(SqlRowSet rs) {
        Step step = new Step();
        step.setStep_id(rs.getInt("step_id"));
        step.setRank(rs.getInt("rank"));
        step.setInstruction(rs.getString("instruction"));
        return step;
    }

}
