<template>
  <div class="home title-servings-combo">
    <h3 >Welcome, {{$store.state.user.username}}!</h3>
    <p>If you are seeing this, you are authenticated.</p>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style scoped>
.title-servings-combo a {
  color:#333;
}

p{
  font-family: "Montserrat";
}

</style>
