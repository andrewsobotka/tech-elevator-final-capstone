<template>
<<<<<<< HEAD
  <div class="cardsContainer">
    <RecipeCard 
=======

 <div class="cardsContainer">
     <RecipeCard 
>>>>>>> 8f6a6518da0600f5bbd7440743ac3e2a0efd6cf2
    v-for="recipe in $store.state.recipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe="recipe"
      class="recipes"/>> 
<<<<<<< HEAD
  </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue"
export default {
  name: 'RecipeList',
  components:{RecipeCard}
=======
 
 </div>
</template>

<script>
import RecipeCard from '../components/RecipeCard.vue'

export default {
  name: 'RecipeList',
 components: {    
   RecipeCard
 }

>>>>>>> 8f6a6518da0600f5bbd7440743ac3e2a0efd6cf2
}

</script>

<style scoped>

</style>