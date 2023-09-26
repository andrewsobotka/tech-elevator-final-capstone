<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>

<RecipeCard/>
      
    </div>
    <router-view />
  </div>
</template>



<script>
import RecipeCard from './components/RecipeCard.vue'

export default {

  name: 'app',
  props:{

  },
  components: {
  RecipeCard
    
  }
}
</script>

<style scoped>

#app{
  background: rgb(150, 111, 92);
}




</style>
