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
import APIService from '../services/APIService.js';

export default {
  name: 'RecipeList',
  components: {RecipeCard},
  created(){
    APIService.getRecipes().then(response => {
      this.$store.commit('SET_RECIPES', response.data)
    })
  }

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