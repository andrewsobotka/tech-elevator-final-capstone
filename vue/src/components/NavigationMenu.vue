<template>
  <div>
    <nav>
      <li><router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'recipes'}"  v-if="$store.state.token != ''">My Recipes</router-link></li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'grocery-list'}" v-if="$store.state.token != ''">Grocery List</router-link></li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'search'}">Search</router-link></li>
      <li v-if="$store.state.token != ''"> &nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{name:'settings'}" v-if="$store.state.token != ''">Settings</router-link></li> 
      <li v-if="$store.state.token != ''">&nbsp;|&nbsp;</li>
      <li><router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link></li>
    </nav>
  </div>
</template>

<script>
export default {

}
</script>

<style>
  nav{
    display: flex;
    list-style: none;
  }
</style>