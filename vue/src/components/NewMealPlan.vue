<template>
  <div class="container">
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Add A New Meal Plan</h3>

      </div>
      <div class="field">
        <label for="recipeName">Title: </label>
        <input
          type="text"
          name="mealListName"
          v-model="newRecipe.recipeName"
          placeholder="ie: Monday's Plan"
          v-on:change="keywords"
        />
      </div>
      
      <br />
      <div class="field">
        <label for="description">Description: </label>
        <textarea name="description" v-model="newMeal.description" 
        placeholder="In laws are in town. No Gluten!" />
      </div>

      <div id="url-section">
        <label for="image">Add a URL for an Image:</label><br>
        <input
          id="url"
          type="text"
          name="image"
          v-model="newRecipe.imgUrl"
          placeholder="www.image.com"
        />
      </div>

      <label for="tags">Tags:</label>
      <div class="tagsList">
        <div
          class="field"
          v-for="(tag, index) in $store.state.listOfTags"
          v-bind:key="index"
        >
        
          <input
            type="checkbox"
            id="tag"
            v-bind:value="tag.tag"
            v-bind:name="tag.tag"
            v-model="newRecipe.tags"
          />
        <label for="tag">{{ tag.tag }}</label>
        </div>
      </div>

      <div class="submitDiv">
        <button type="submit" value="Submit New Recipe" class="submit-btn">
          Submit New Recipe
        </button>
      </div>
    </form>
  </div>
</template>

<script>
// import APIService from '../services/APIService';
export default {
     name: "MealForm",
  components: { 

   },
  data() {
    return {
    };
  },
  methods: {
    createMealPlan() {
    
  },
  computed: {
    
  },
},
};
</script>

<style scoped>
.container {
  max-width: 21rem;
  display: flex;
  flex-direction: column;
  width: 100%;
  cursor: pointer;
  min-width: 30rem;
  overflow-x: hidden;
}
div a {
  color: #333;
}

textarea {
  position: relative;
  min-width: 28rem;
  height: 10rem;
  background-color: #d9e9fa;
  border: none;
  font-family: "Montserrat", sans-serif;
  font-size: 1rem;
  letter-spacing: 1.5px;
  color: rgba(14, 0, 0, 0.623);
  margin: 10px 0;
}

input::placeholder {
  font-family: "Montserrat", sans-serif;
  padding: 6px;
  color: rgba(119, 119, 119, 0.623);
}

input[name="recipeName"] {
  margin-top: 0.7rem;
  width: 93%;
}

.ingredientList li {
  list-style-type: none;
}

input[name="servingSize"] {
  width: 5rem;
  margin-left: 1rem;
}

.addSteps-btn {
  position: relative;
  left: 15%;
}

.stepsLabel {
  margin-left: 1rem;
  position: relative;
  left: -3.3rem;
}

.field ul li {
  list-style-type: none;
}

.ingredients-btn {
  margin-left: 20%;
  background: rgb(228, 243, 187);
  border-radius: 0;
  position: relative;
}

.steps-btn {
  margin-left: 60px;
  transition: ease 0.5s;
}

.ingredients-check-group {
  display: flex;
  margin-bottom: 1rem;
  position: relative;
  width: 30rem;
  left: -2.5rem;

}

.ingredients-input{
  position: relative;
  width: 30rem;
  max-width: 400%;
  margin-right: 1rem;
}
.steps-input {
 position: relative;
  width: 40rem;
  
  margin-right: 1rem;
}

.delete-btn {
  background: rgb(206, 74, 74);
  color: #fff;

  font-size: 0.8rem;

  transition: ease 0.5s;
}

.deleteDiv{
  position: relative;
   display: flex;
  justify-content: center;
  left: -.5rem;
  margin: 1rem;
 
}



.delete-btn a {
  color: #fff;
}

.delete-btn:hover {
  background: #7a2217;
}
.submitDiv{
  display: flex;
  justify-content: center;
}

.submitDiv button {
  background: rgba(115, 202, 198, 0.623);
  border-radius: 0;
  color: rgb(39, 2, 2);
  font-family: "Montserrat", sans-serif;
  font-weight: bold;

  transition: ease 0.5s;
}
.submit-btn:hover {
  background: rgb(63, 133, 98);
  color: #fff;
}

.tagsList {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  margin: 1rem 0;
}

.tagsList input, .tagsList label{
  margin: .2rem;
  margin-bottom: 1rem;
  text-align: center;
}

li{
    font-family: "Montserrat";
    text-justify: top;
}

#url{
    width: 20rem;
}


</style>
