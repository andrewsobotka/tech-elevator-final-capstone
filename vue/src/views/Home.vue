<template>
  <div class="home">
    <h1>Welcome, {{$store.state.user.username}}!</h1>
    <p>If you are seeing this, you are authenticated.</p>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>
