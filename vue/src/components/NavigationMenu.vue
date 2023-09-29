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
  height: 3.5rem;
  margin: .1rem;

}
.navigationmenu {
  width: 100%;
  left: 0px;
  top: 0px;
  cursor: pointer;
  position: Fixed;
  z-index: 99;
  border-bottom: 2px solid rgba(56, 68, 58, 0.39);
}

.menu{
  position: relative;
  left: -50px;
}

.headerbar {
  top: 0px;
  padding: 1.3rem;
  background: #d0d3d0;
  /* background-image: url("https://img.freepik.com/free-photo/spring-floral-border-background-green-with-leaf-watercolor-illustration_53876-126807.jpg?w=1060&t=st=1695934598~exp=1695935198~hmac=2af1dcbab7220b3737772d365afc7af0c3c54a5950c0fc42c9b587f252ed49ab"); */

  background-image: url("https://img.freepik.com/free-photo/grainy-ground-view-shot-bokeh-style_53876-104709.jpg?w=1060&t=st=1695935109~exp=1695935709~hmac=2a9ad39d790f8f22e59dde61f2706a4f020c4ff9ace2307d693a7cb6703bb88d");
  background-size: cover;
  background-repeat: no-repeat;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #333;
  font-family: "Montserrat";
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
  -webkit-text-stroke:1.5px rgba(255, 255, 255, 0.432);
}
.logo a:hover {
  letter-spacing: 3px;
  color: #fbfbfb;
  -webkit-text-stroke: 1.2px #c5b39e77;
}
</style>