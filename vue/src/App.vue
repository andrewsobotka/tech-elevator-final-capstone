<template>
  <div id="app">
    <div id="nav">
      <NavigationMenu />
      <!-- <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link> -->
    <!-- <router-view /> -->


      
    </div>
  </div>
</template>



<script>
import NavigationMenu from './components/NavigationMenu.vue'
// import RecipeCard from './components/RecipeCard.vue'

export default {

  name: 'app',
  props:{

  },
  components: {
  // RecipeCard,
  NavigationMenu 
    
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;1,300&family=Caprasimo&family=DM+Sans:opsz,wght@9..40,200;9..40,300;9..40,500&family=Lexend:wght@200;300&family=Montserrat:wght@300;400&display=swap');

*{
  top: 0px;
  left: 0px;
  background: #fae7dd;
  background-size: auto;
}
#app{
 
  background-image: url('https://img.freepik.com/premium-photo/abstract-white-background-text-paper-page-texture_84485-2550.jpg?w=740');
  background-size: repeat;
 padding-bottom: 100%;
}




</style>
