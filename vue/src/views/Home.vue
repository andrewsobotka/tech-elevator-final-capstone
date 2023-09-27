<template>
  <div class="home title-servings-combo">
    <div id="top">
      <h3 id="welcome" >Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h3>
      </div>
      <div id="middle">
      <button id="login"  v-if="$store.state.token == ''"><router-link  v-bind:to="{name:'login'}" >Login</router-link></button>
      </div>
    
  </div>
</template>

<script>
export default {
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



</style>
