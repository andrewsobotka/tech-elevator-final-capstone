<template>
  <div class="explore">
    <h3>Explore Recipes</h3>
    <div class="borderbox"></div>
    <div class="cardsContainer">
      <RecipeCard
        v-for="recipe in $store.state.recipes"
        v-bind:key="recipe.recipeId"
        v-bind:recipe="recipe"
      />
    </div>
  </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue";
import APIService from "../services/APIService.js";

export default {
  name: "RecipeList",
  components: { RecipeCard },
  created() {
    APIService.getRecipes().then((response) => {
      this.$store.commit("SET_RECIPES", response.data);
    });
  },
};
</script>

<style scoped>
h3 {
  text-align: center;
  text-decoration: none;
  font-size: 2.5rem;
}

.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
}

.cardsContainer {
  margin: 2rem;
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: 0.3rem;
  justify-content: center;
}
</style>