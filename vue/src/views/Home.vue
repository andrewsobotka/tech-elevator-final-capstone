<template>
<<<<<<< HEAD
<div class="container">
  <div class="buttons">
    
      <h3 id="welcome" >Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h3>
 
=======
  <div class="home title-servings-combo">
    <div id="top">
      <h2 id="welcome" >Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h2>
      </div>
      <div id="middle">
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
      <button id="login"  v-if="$store.state.token == ''"><router-link  v-bind:to="{name:'login'}" >Login</router-link></button>
  
      <button id="explore-button" ><router-link  v-bind:to="{name:'recipes'}" >Explore Recipes</router-link></button>
 
  </div>

  <div id="recipeCardContainer">
    <RecipeCard
      v-for="recipe in $store.state.recipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
  </div>
    
  </div>
</template>

<script>
import RecipeCard from '../components/RecipeCard.vue';
export default {
  components: { RecipeCard },
  name: "home",
  method:{
    loginPage(){
      this.$router.push("login");
    }
  }
};
</script>

<style scoped>


.container{
  background-color:transparent;
  font-family: "Montserrat";
  margin:auto;
  display: flex;
  align-items: center;

}

.buttons{
  display:flex;
  flex-direction: column;

  align-items: center;
  position: relative;
  margin-bottom: 1rem;

}

/* .title-servings-combo a {
  color:#333;
} */

<<<<<<< HEAD
/* #welcome{
  font-size: 2rem;
=======
#welcome{
>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664
  text-align: center;
} */

/* div.cardContainer{
  display: inline-flex;
  justify-content: center;
} */

/* div.body{
  display: flex;
  justify-content: center;  
} */

button{
  width:25%;
  height: 10%;;
  font-family: "Montserrat";
  font-size: 1.2rem;
  border: 1px solid rgba(51, 51, 51, 0.527);
  border-radius: 12px;
  background-color: #90af90;
  padding:3px;
  width: 15rem;
  margin: .5rem 0rem;
}

button:nth-child(odd){
  color:  #90af90;
  background: rgba(62, 117, 42, 0.849);
  
}
button:hover{
 background: rgba(231, 217, 92, 0.466);
 transition: .3s ease;
}

#recipeCardContainer{
  display: flex;
  justify-content: center;
}


/* #explore{
   display: flex;
  justify-content: center;
  padding: 1rem;
} */



</style>
