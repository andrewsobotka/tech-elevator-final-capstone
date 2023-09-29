<template>
  <div>
    <div class="navigationmenu">
      <div class="headerbar">
        <div class="logo">
          <router-link v-bind:to="{ name: 'home' }"> Sage</router-link> a
          mealplan friend
        </div>

        <div class="navbar">
          <router-link v-bind:to="{ name: 'home' }">Home </router-link>
          <router-link v-bind:to="{ name: 'recipes' }">
            Explore Recipes
          </router-link>
          <router-link
            v-bind:to="{ name: 'my-recipes' }"
            v-if="$store.state.token != ''"
            >My Recipes</router-link
          >
          <router-link
            v-bind:to="{ name: 'grocery-list' }"
            v-if="$store.state.token != ''"
            >Grocery List</router-link>

          <router-link
            v-bind:to="{ name: 'my-meals' }"
            v-if="$store.state.token != ''"
            >My Meals</router-link>
          
          <NavDropDown/>


          <!-- <router-link
            v-bind:to="{ name: 'settings' }"
            v-if="$store.state.token != ''"
            >My Account</router-link
          > -->
          <!-- <a ref="#">Setting</a> | -->

          <router-link
            v-bind:to="{ name: 'logout' }"
            v-if="$store.state.token != ''"
            class="logout"
            >Logout</router-link
          >
        </div>
      </div>
    </div>
    <!-- <nav>
      <li><router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'recipes'}" ">My Recipes</router-link></li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'settings'}" v-if="$store.state.token != ''">Settings</router-link></li> 
      <li v-if="$store.state.token != ''">&nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link></li>
    </nav> -->
  </div>
</template>

<script>
import NavDropDown from './NavDropDown.vue';

export default {
  components: {NavDropDown},
};
</script>

<style>
.navigationmenu {
  width: 100%;
  left: 0px;
  top: 0px;
  cursor: pointer;
  border-bottom: 2px solid rgb(39, 109, 54);
}

.headerbar {
  overflow-x: hidden;
  top: 0px;
    padding: 1.3rem;

background: #e0fcdf;  
background-image: url('https://img.freepik.com/free-photo/spring-floral-border-background-green-with-leaf-watercolor-illustration_53876-126807.jpg?w=1060&t=st=1695934598~exp=1695935198~hmac=2af1dcbab7220b3737772d365afc7af0c3c54a5950c0fc42c9b587f252ed49ab');
  /* background-image: url("https://bonnieplants.com/cdn/shop/articles/BONNIE_sage_iStock-664890210-1800px_f839c896-3f8b-4470-8ab8-7ebe7dd93bb2.jpg?v=1642541975"); */
 
 /* background-image: url('https://img.freepik.com/free-photo/blurred-plants_23-2148013432.jpg?w=1060&t=st=1695934812~exp=1695935412~hmac=9a38faa6dc5dd961de3eb896f72d81821c117da1402598836ed4bb24037eb0f2'); */
 
 background-image: url('https://img.freepik.com/free-photo/grainy-ground-view-shot-bokeh-style_53876-104709.jpg?w=1060&t=st=1695935109~exp=1695935709~hmac=2a9ad39d790f8f22e59dde61f2706a4f020c4ff9ace2307d693a7cb6703bb88d');
 background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  justify-content: space-between;
  color: #fff;
  font-family: "Montserrat";
  z-index: 3;
}

a {
  color: #fff;
  text-decoration: none;
}

.headerbar a {
  margin: 0.4rem;
  color: #fff;
}

.navbar {
  justify-content: flex-end;
  position: relative;
  font-family: "Lexend", sans-serif;
  font-size: 1rem;
  transition: ease 3s;
}
.navbar a:hover {
  color: #bad89c;
  transition: ease 0.7s;
  border-bottom: 3px solid #bad89c;
  transform: scale(0.1);
}

.logout {
  color: rgb(80, 104, 25);
  text-decoration: none;
  font-size: 1rem;
}

.logo a {
  text-decoration: none;
  font-family: "Caprasimo", cursive;
  font-size: 3rem;

  color: blanchedalmond;
  transition: all 0.5s ease;
  -webkit-text-stroke: 1.2px rgba(33, 63, 41, 0.836);
}
.logo a:hover {
  letter-spacing: 3px;
  color: #fbfbfb;
    -webkit-text-stroke: 1.2px #c5b39e77;

}
</style>