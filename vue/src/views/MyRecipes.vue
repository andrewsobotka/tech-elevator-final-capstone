<template>

    <div id="my-recipes" >
      <div id ="recipe">
      <h2 id="recipe-title">My Recipes</h2>
      </div>
      <div class="cardsContainer">
      <RecipeCard
        v-for="recipe in myRecipes"
        v-bind:key="recipe.recipeId"
        v-bind:recipe="recipe"
      />
      </div>
    </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue";

export default {
  name: "RecipeList",
  components: { RecipeCard },
  computed: {
    myRecipes() {
      return this.$store.state.recipes.filter((recipe) => {
        return recipe.creatorUsername == this.$store.state.user.username;
      });
    },
  },
};
</script>

<style scoped>
.cardsContainer{
  /* margin: 2rem; */
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: .3rem;
  justify-content: center;
}
#my-recipes{
  text-align: center;
}
#recipe-title {
  display: flex;
  justify-content: center;
  text-align: center;
}



</style>