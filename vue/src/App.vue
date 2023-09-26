<template>
  <div id="app">
    <div id="nav">
      <TheHeader/>
      <NavigationMenu/>   
       
    </div>
    <router-view />
    <TheFooter/>  
  </div>
</template>



<script>
import TheHeader from './components/TheHeader.vue'
import TheFooter from './components/TheFooter.vue'
import NavigationMenu from './components/NavigationMenu.vue'


export default {

  name: 'app',
  props:{

  },
  components: {
  TheHeader,
  TheFooter,
  NavigationMenu
    
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;1,300&family=Caprasimo&family=DM+Sans:opsz,wght@9..40,200;9..40,300;9..40,500&family=Lexend:wght@200;300&family=Montserrat:wght@300;400&display=swap');


#app{
  background: #fae7dd;
  /* background-image: url('https://media.istockphoto.com/id/1531971918/photo/colour-old-concrete-wall-texture-background-close-up-retro-plain-cream-color-cement-wall.webp?b=1&s=170667a&w=0&k=20&c=d9Rw-za44oCqaTBT7ayhHocKmGPh-AOA9bTVxqytpRs='); */
  background-size: cover;
  

}




</style>
