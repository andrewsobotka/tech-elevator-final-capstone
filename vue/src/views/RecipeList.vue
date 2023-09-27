<template>

 <div class="cardsContainer">
     <RecipeCard
      v-for="recipe in $store.state.recipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
 </div>
</template>

<script>
import RecipeCard from '../components/RecipeCard.vue';

export default {
  name: 'RecipeList',
  components: {RecipeCard}

}

</script>

<style scoped>
.cardsContainer{
  margin: 2rem;
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: .3rem;
}


</style>