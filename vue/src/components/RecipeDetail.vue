<template>
  <div class="container">
    <h2 class="recipe-name">{{ recipe.recipeName }}</h2>    
    <h3>{{recipe.recipeDescription}}</h3>
    <h3>Serving Size: {{recipe.servingSize}}</h3>
    <ul>
      <!-- <li v-for="recipe in recipes"></li> -->
    </ul>  

  </div>
</template>

<script>
export default {
  name: 'recipeDetail',
  props:{
    recipe: Object

  },
  components: {
    
  }
}
</script>

<style>

</style>