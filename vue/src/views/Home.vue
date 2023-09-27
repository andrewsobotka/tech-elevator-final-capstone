<template>
  <div class="home title-servings-combo">
    <div id="top">
      <h3 id="welcome" >Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h3>
      </div>
      <div id="middle">
      <button id="login"  v-if="$store.state.token == ''"><router-link  v-bind:to="{name:'login'}" >Login</router-link></button>
      </div>
      <div id="explore">
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


div.home.title-servings-combo{
  background-color:transparent;
  font-family: "Montserrat";
  
}

#top{
  display: flex;
  justify-content: center;
}

#middle{
  display: flex;
  justify-content: center;
}

.title-servings-combo a {
  color:#333;
}

#welcome{
  font-size: 2rem;
  text-align: center;
}

div.cardContainer{
  display: inline-flex;
  justify-content: center;
}

div.body{
  display: flex;
  justify-content: center;  
}

button{
  width:25%;
  height: 10%;;
  border-radius: 20px;
  font-family: "Montserrat";
  font-size: 1.5rem;
  background-color: rgb(144, 175, 144);
  color: #fff;
}

#recipeCardContainer{
  display: flex;
  justify-content: center;
}

#explore{
   display: flex;
  justify-content: center;
  padding: 1rem;
}



</style>
