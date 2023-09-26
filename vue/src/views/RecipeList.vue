<template>
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

}

</script>

<style scoped>

</style>