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
           <router-link v-bind:to="{ name: 'recipes' }"> Explore Recipes </router-link>
          <a ref="#">My Recipes</a>
          <!-- <a ref="#">Grocery List</a> -->
          <a ref="#">My Account</a>
          <!-- <a ref="#">Setting</a> | -->

          <router-link
            v-bind:to="{ name: 'logout' }"
            v-if="$store.state.token != ''"
            class="logout"
            >Logout</router-link
          >
        </div>
        
      </div>

      <RecipeList/>
    </div>
  </div>
</template>

<script>
import RecipeList from '../views/RecipeList.vue';

export default {
components:{
  RecipeList
}
};
</script>

<style>
.navigationmenu {
  width: 100%;
  left: 0px;
  top: 0px;
  cursor: pointer;
}

.headerbar {
  overflow-x: hidden;
  top: 0px;
  padding: 1.3rem;
  background: rgb(100, 151, 111);
  /* background-image: url(''); */
  background-image: url("https://bonnieplants.com/cdn/shop/articles/BONNIE_sage_iStock-664890210-1800px_f839c896-3f8b-4470-8ab8-7ebe7dd93bb2.jpg?v=1642541975");
  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  justify-content: space-between;
  color: #fff;
  font-family: "Montserrat";
}


a {
  color: #fff;
  text-decoration: none;
}

.headerbar a {
  margin: 0.4rem;
}

.navbar {
  justify-content: flex-end;
  position: relative;
  margin-top: 2rem;
  font-family: "Lexend", sans-serif;
  font-size: 1rem;
}
.navbar a:hover {
  color: rgb(186, 216, 156);
  transition: ease 0.7s;
}

.logout {
  color: rgb(207, 229, 155);
  text-decoration: none;

  /* background: #9bad8f;
  border: 1px solid #233b13;
  padding: 6px 6px;
  border-radius: 20px; */
  font-size: 1rem;
}

.logo a {
  text-decoration: none;
  font-family: "Caprasimo", cursive;
  font-size: 3rem;
  margin-top: -1rem;
  color: blanchedalmond;
  transition: all 0.5s ease;
    -webkit-text-stroke: 1.2px rgba(33, 63, 41, 0.836);

}
.logo a:hover {
  letter-spacing: 3px;
  color: #054713;
}
</style>