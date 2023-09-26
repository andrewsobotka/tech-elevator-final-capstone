<template>
<<<<<<< HEAD
 <div class="cardsContainer">
   <RecipeCard/>
 </div>
</template>

<script>
import RecipeCard from '../components/RecipeCard.vue'

export default {
  name: 'RecipeList',
 components: {    
   RecipeCard
 }
=======
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
>>>>>>> 19a7df63a1c8bbcad38068b4a2811d4d62478554

}

</script>

<style scoped>

</style>