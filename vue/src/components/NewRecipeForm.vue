<template>
  <div class="container">
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Add New Recipe</h3>
      </div>
      <div class="field">
        <label for="recipeName">Title: </label>
        <input
          type="text"
          name="recipeName"
          v-model="newRecipe.recipeName"
          placeholder="ie: Apple Crumble"
        />
      </div>
      <br />
      <div class="field">
        <label for="servingSize">Serving Size:</label>
        <input type="text" name="servingSize" v-model="newRecipe.servingSize" 
        placeholder="ie: 6" />
      </div>
      <br />
      <div class="field">
        <label for="description">Description: </label><br />
        <textarea name="description" v-model="newRecipe.recipeDescription" />
      </div>


      
      <div class="ingredientList">
        <label for="ingredient">Ingredients:</label>
        <button class="ingredients-btn"><a v-on:click="newRecipe.ingredients.push('')">Add Ingredient</a>
        </button>
        
        <br />
        

        <li
          v-for="(ingredient, index) in newRecipe.ingredients"
          v-bind:key="index" class="ingredientList"  >
        

             <input
            type="checkbox"
            id="step"
            v-bind:key="index"
            v-bind:value="index"
            v-model="indexOfIngredients"
          />
          <input
            type="text"
            name="Ingredient" id="ingredient-input"
            v-model="newRecipe.ingredients[index]"
            @keyup.enter="newRecipe.ingredients.push('')"
          />
     
          <br /><br />
        </li>
       <button class="delete-btn"> <a v-on:click="deleteIngredients" >Delete Ingredients</a>
      </button>
      </div>
      <div class="field">
        <ol>
          <label for="steps">Steps:</label
          ><br />
          <a v-on:click="newRecipe.steps.push('')">Add Step</a
          ><br />
          <li v-for="(step, index) in newRecipe.steps" v-bind:key="index">
            <input
              type="text"
              name="steps"
              v-model="newRecipe.steps[index]"
              @keyup.enter="newRecipe.steps.push('')"
            />
            <input
              type="checkbox"
              id="step-checkbox"
              v-bind:key="index"
              v-bind:value="index"
              v-model="indexOfSteps"
            />
            <br /><br />
          </li>
        <button class="delete-btn"> <a v-on:click="deleteSteps">Delete Steps</a
          ></button> 

        </ol>
      </div>
      <label for="tags">Tags:</label>
      <div class="field" v-for="(tag, index) in $store.state.listOfTags" v-bind:key="index">
        <input
          type="checkbox"
          id="tag"
          v-bind:value="tag"
          v-bind:name="tag"
          v-model="newRecipe.tags"
        />
        <label for="vegan">{{ tag }}</label>
      </div>
      <button type="submit" value="Submit New Recipe" class="btn save">
        Submit New Recipe
      </button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentValue: 0,
      indexOfSteps: [],
      indexOfIngredients: [],
      newRecipe: {
        quantity: [],
        ingredients: [""],
        steps: [""],
        tags: [],
      },
    };
  },
  methods: {
    createNewRecipe() {},
    deleteIngredients() {

      let newArray = [];
      for (let i = 0; i < this.newRecipe.ingredients.length; i++) {
        if (!this.indexOfIngredients.includes(i)) {
          newArray.push(this.newRecipe.ingredients[i]);
        }
      }
      this.newRecipe.ingredients = newArray;

      this.indexOfIngredients = [];
    },
    deleteSteps() {
      let newArray = [];
      for (let i = 0; i < this.newRecipe.steps.length; i++) {
        if (!this.indexOfSteps.includes(i)) {
          newArray.push(this.newRecipe.steps[i]);
        }
      }
      this.newRecipe.steps = newArray;

      this.indexOfSteps = [];
    },
  },
  computed: {},
};
</script>

<style>
.container{
  
}
div a {
  color: #333;
}

textarea {
  position: relative;
  width: 20rem;
  height: 10rem;
  background-color: #d9e9fa;
  border:none;
font-family: 'Montserrat', sans-serif;
  color: rgba(14, 0, 0, 0.623);
  margin-bottom: 30px;

}

input::placeholder {
font-family: 'Montserrat', sans-serif; 
 padding: 6px;
  color: rgba(119, 119, 119, 0.623);
}


input{
  width: 95%;
  margin: 0px 0px 0px 1rem;
 
}

input[name="recipeName"]{

  margin-top: .7rem;

}

.ingredientList li{
  list-style-type: none;
}


.ingredients-check-group{
  display: flex;
}


input[name="servingSize"]{
  width: 6rem;
}

.field ul li{
  list-style-type: none;
}
label {
  margin-bottom: 5px;
}

.ingredients-btn{
  margin-left: 20%; 
}

.delete-btn, .delete-btn a{
  background: rgb(206, 74, 74);
  color: #fff;
  text-align: center;
  position: relative;
}

</style>
