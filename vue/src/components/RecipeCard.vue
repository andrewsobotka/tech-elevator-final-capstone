<template>
  <div class="body">
    <div class="name-img-container">
      <img :src="recipe.imgUrl" class="image-fit" />
      <div class="title-servings-combo">
        <h3>
          <router-link
            v-bind:to="{ name: 'recipe', params: { id: recipe.recipeId } }"
            >{{ recipe.recipeName }}</router-link
          >
        </h3>
        <h3 v-on:click.prevent="pleaseLogin"><router-link v-bind:to="{name:'recipe', params:{id:recipe.recipeId}}">{{recipe.recipeName }}</router-link></h3>
        <div class="borderbox"></div>
    
          <div class="description">
            <p>{{ recipe.description }}</p>
         </div>
          <div class="servings">
            Serving Size: {{ recipe.servingSize }} | Total Time:
            {{ recipe.servingSize }}
 
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "recipeCard",
  props: {recipe:Object}, 
  methods:{
    pleaseLogin(){
      if(this.$store.state.token ===''){
        this.$router.push("/login");
      }
      
    }
  }

};
</script>

<style scoped>
.image-fit {
   border: 3px solid rgba(158, 125, 125, 0.747);
  height: 30rem;
  width: 20rem;
  object-fit: cover;
  border-radius: 15px;
  margin: 1rem 2rem;
}

.name-img-container {
  position: relative;
}

.title-servings-combo {
  position: absolute;
  top: 67%;
  left: 35px;
  border-radius:0px 0px 3px 3px;
  width: 20rem;
  height: 8rem;
  object-fit: contain;
  background: #fff0e4e0;
  overflow: hidden;
}
.title-servings-combo a {
  color: #333;
}
.borderbox {
  top: 30px;
  border-bottom: 7px solid #55695659;
  margin: 3px 0px;
}

h3 {
  position: absolute;
  top: -15%;
  left: 3%;
  font-size: 1.5rem;
}

.description {
  position: absolute;
  padding: 2%;
   margin-top: 0px;
   top: 20%;
  object-fit: contain;
  
}

.servings {
  color: rgba(100, 66, 15, 0.664);
  font-weight: bold;
  position: absolute;
  right: 3%;
  top: 80%;
  
}
</style>