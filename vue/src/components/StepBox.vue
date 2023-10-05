<template>
<div id = "outerContainer">
<div id="container">
  <div id="login" class="login-body">
      <div id = "hideButton">
      <button v-on:click="$emit('hideStep')"><i class="fa-solid fa-x"></i></button>
      </div>
      <!-- <button v-on:click="$store.state.stepByStep=false">X</button> -->
      <h2 id="title" >Step {{stepNumber}} </h2><br/>
      <p>{{$store.state.recipe.steps[ `${stepNumber-1}`].instruction}}</p>
      <div id = "buttonContainer">
      <button v-if="stepNumber != 1" v-on:click="subtractOne"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button>
      <div id=#whiteBox v-if="stepNumber == 1"></div>
      <button class="steps-btn" v-on:click="addOne" v-if="stepNumber != $store.state.recipe.steps.length">Next <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
      </div>
  </div>
</div>
</div>
</template>

<script>
import APIService from "../services/APIService.js";
export default {
  name: "Steps",
  components: {},
  data() {
    return {
        stepNumber:1,
        recipe:Object,
    };
  },
  methods: {
    nextStep(){
        return "/recipes/" + this.$route.params.id+ "/steps/" + (Number(this.$route.params.rank) +1);
    },
    addOne(){
        this.stepNumber = this.stepNumber+1;
    },
    subtractOne(){
      this.stepNumber = this.stepNumber -1;
    }
    
    
    
  },
  computed:{
      

      
      
  },
    created() {
        APIService.getRecipe(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_RECIPE", response.data);
    });
  },

  
};
</script>

<style scoped>

#outerContainer{
  display: flex;
  justify-content: center;
  align-content: space-around;

}


.login-body {
  position: fixed;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin-top: 10rem;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 50%
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



#buttonContainer{
  display: flex;
  justify-content: space-between;
  align-content: right ;
}

#whiteBox{
  color: #fff;
}

p{
  font-size: 1.7rem;
}


.popup{
  position:fixed;
  top:0;
  left:0;
  right:0;
  bottom:0;
  z-index: 99;
  background-color: rgba(0,0,0,0.2);

  display: flex;
  align-items:center;
  justify-content: center;

  
}
.popup-inner{
    background: #fff;
    padding:32px;
  }

  #hideButton{
    display: flex;
    justify-content: left;
  }

  #hideButton
  button{
    background:rgb(200, 40, 0);
    display: flex;
    justify-content: center;
    text-align: center;
    width: .5rem;
  }

  #outerContainer{
    /* background:rgba(153, 153, 153, 0.246); */
    backdrop-filter: blur(7px);
  }
</style>