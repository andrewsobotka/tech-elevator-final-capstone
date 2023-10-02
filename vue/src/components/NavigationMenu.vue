<template>
  <div>
    <div class="navigationmenu">
      <div class="headerbar">
        <div class="logo">         

          <div class="logo-img">
            <img src="https://i.imgur.com/q1E063E.png" alt="">
             </div>
          <router-link v-bind:to="{ name: 'home' }">
            Sage
            </router-link>
        </div>

        <div class="navbar">
        

          <NavDropDown class="menu"/>


          <!-- <router-link
            v-bind:to="{ name: 'logout' }"
            v-if="$store.state.token != ''"
            class="logout"
            >Logout</router-link
          > -->
        </div>
      </div>
    </div>


  </div>
</template>

<script>
import NavDropDown from "./NavDropDown.vue";

export default {
  components: {
     NavDropDown
      },
};
</script>

<style scoped>
*{
  
}
.logo-img img{
  width: 4rem;
  height: 4rem;
  /* margin: .1rem; */

}
.navigationmenu {
  width: 100%;
  left: 0px;
  top: 0px;
  cursor: pointer;
  position: Fixed;
  z-index: 99;
  /* border-bottom: 2px solid rgba(56, 68, 58, 0.39); */
}

.menu{
  position: relative;
  left: -50px;
}

.headerbar {
  top: 0px;
  padding: .5rem;
  background: #f5ebcd80;

  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #333;
  font-family: "Montserrat";
  border-top: 10px #0b3b0b solid;
  z-index: 3;
}

a {
  /* color: #fff; */
  text-decoration: none;
}

.headerbar a {
  margin: 0.4rem;
    font-family: 'Montserrat';
font-size: 1rem;
font-weight: 200;
  color: #fff;
}

.navbar {
  justify-content: flex-end;
  position: relative;
  font-size: 1rem;
  transition: ease 3s;
}
.navbar a:hover {
  color: #bad89c;
  transition: ease 0.7s;
  /* border-bottom: 3px solid #bad89c; */
  transform: scale(0.1);
}

.logout {
  color: rgb(80, 104, 25);
  text-decoration: none;
  font-size: 1rem;
}

.logo{
  display: flex;
  align-items: center;
  justify-content: center;
}
.logo a {
  text-decoration: none;
font-family: 'Young Serif', serif;
  font-size: 3rem;
  letter-spacing: 1px;
  color: rgb(15, 92, 21);
  transition: all 0.5s ease;
  /* -webkit-text-stroke:1.5px rgba(255, 255, 255, 0.432); */
}
.logo a:hover {
  letter-spacing: 3px;
  color: #fbfbfb;
  -webkit-text-stroke: 1.2px #c5b39e77;
}
</style>