<template>
  <div class="home">
    <TheHeader/>
    <h1>Home</h1>
    <p>If you are seeing this, you are authenticated.</p>
  </div>
</template>

<script>
import TheHeader from "../components/TheHeader.vue"
export default {
  name: "home",
  components:{TheHeader}
};
</script>
