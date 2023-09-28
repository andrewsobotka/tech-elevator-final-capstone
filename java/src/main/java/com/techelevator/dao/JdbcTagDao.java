package com.techelevator.dao;

import com.techelevator.model.Tag;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcTagDao implements TagDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcTagDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Tag> getTagsByRecipeId(int recipe_id){

        List<Tag> tags = new ArrayList<>();
        String sql = "select * from tags join recipes_tags on recipes_tags.tag_id = tags.tag_id " +
                "join recipes on recipes_tags.recipe_id = recipes.recipe_id where recipes.recipe_id = ? ;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
        while (results.next()) {
            Tag tag = mapRowToTag(results);
            tags.add(tag);
        }

        return tags;

    }

    private Tag mapRowToTag(SqlRowSet rs) {
        Tag tag = new Tag();
        tag.setTagId(rs.getInt("tag_id"));
        tag.setTag(rs.getString("tag"));

        return tag;
    }

}

