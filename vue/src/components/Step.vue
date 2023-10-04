<template>
<div id="container">
  <div id="login" class="login-body">
      <h2 id="title" >Step {{stepNumber}} </h2><br/>
      <p>{{$store.state.recipe.steps[ `${stepNumber-1}`].instruction}}</p>
  
      <button class="steps-btn" v-on:click="$router.push(nextStep)">Next</button>
    <p>{{Number(this.$route.params.rank+1)}}</p>
  </div>
</div>
</template>

<script>

export default {
  name: "Steps",
  components: {},
  data() {
    return {
        recipe:Object
    };
  },
  methods: {
    nextStep(){
        return "/recipe/" + this.$route.params.id+ "/steps/" + Number(this.$route.params.rank +1);
    }
    
    
  },
  computed:{
      stepNumber(){
          return this.$route.params.rank;
      }
      
  },
  
};
</script>

<style scoped>



.login-body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: auto;
  margin-top: 3rem;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 50%
}

.loginDiv a {
  color: #333;
}


#sign-up a {
  color: #333;
  font-family: "Montserrat";
}

#sign-up{
  font-family: "Montserrat";
}

#sign-up a:hover {
  color: green;
  font-family: "Montserrat";
}

#alert{
  color:red;
  font-family: "Montserrat";
  display: flex;
  justify-content: center;
  padding-bottom: .5rem;
}

h2{
  text-decoration:none;
  border-bottom: none;
  background: transparent;
}

#title{
  text-align: center;
  width:100%;
}

</style>