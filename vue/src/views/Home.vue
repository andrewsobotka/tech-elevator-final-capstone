<template>
  <div class="home title-servings-combo">
    <div id="top">
      <h2 id="welcome" >Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h2>
      </div>
      <div >
        <div class="buttons"> 
      <button id="login"  v-if="$store.state.token == ''"><router-link  v-bind:to="{name:'login'}" >Login</router-link></button>
    
      <button id="explore-button" ><router-link  v-bind:to="{name:'recipes'}" >Explore Recipes</router-link></button>
  </div>
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
import APIService from '../services/APIService.js';
import RecipeCard from '../components/RecipeCard.vue';
export default {
  components: { RecipeCard },
  name: "home",
  method:{
    loginPage(){
      this.$router.push("login");
    }
  },
  created(){
    APIService.getRecipes().then(response => {
      this.$store.commit('SET_RECIPES', response.data)
    })
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


#welcome{
  text-align: center;
  font-size: 5rem;
  background: rgb(161, 136, 96);
  color: #fff;
  opacity: 30%;
  padding: 4%;
  border: none;
} 

button{
  width:25%;
  height: 10%;;
  font-family: "Montserrat";
  font-size: 1.2rem;
  border: 1px solid rgba(51, 51, 51, 0.527);
  border-radius: 20px;
  background-color: #81cf81;
  width: 15rem;
  margin: .5rem 0rem;
  padding: .6rem;
}

button a{
  color: rgba(255, 255, 255, 0.952);
}
button:nth-child(odd){
  color:  #90af90;
  background: rgba(70, 139, 45, 0.849);
  
}
button:hover{
 background: rgba(231, 217, 92, 0.466);
 transition: .3s ease;
}

#recipeCardContainer{
  display: flex;
  justify-content: center;
}





</style>
