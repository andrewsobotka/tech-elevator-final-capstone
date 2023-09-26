<template>
  <div>
    <RecipeCard 
    v-for="recipe in $store.state.recipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe="recipe"
      class="recipes"/>> 
  </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue"
export default {
  components:{RecipeCard}

}
</script>

<style>

</style>