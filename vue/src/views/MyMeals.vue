<template>
  <div>
    <h3  id="meals-title">My Meals</h3>
    <div>
      
      <div class="borderbox"></div>
      <p>Search by Tag:
        <tagSelectBox/> </p>
    </div>
  </div>
</template>

<script>
import tagSelectBox from '../components/tagSelectBox.vue';

export default {
  components: {
    tagSelectBox
  }
};
</script>

<style>


h3{
text-align: center;
font-size: 2.5rem
;
}

.borderbox{
  width: 50%;
  position: relative;
 left: 25%;
}


</style>