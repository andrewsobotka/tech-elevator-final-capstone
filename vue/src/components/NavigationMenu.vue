<template>
  <div>
    <nav>
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name:'recipes'}">My Recipes</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name:''}">Grocery List</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name:''}">Search</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{name:''}">Settings</router-link>
    </nav>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>