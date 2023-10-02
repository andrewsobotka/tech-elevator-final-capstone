<template>
  <div class="container">
    <form id="addNewRecipe" v-on:submit.prevent="createNewRecipe">
      <div>
        <h3>Add New Recipe</h3>
        {{newRecipe.keywords}}
      </div>
      <div class="field">
        <label for="recipeName">Title: </label>
        <input
          type="text"
          name="recipeName"
          v-model="newRecipe.recipeName"
          placeholder="ie: Apple Crumble"
          v-on:change="keywords"
        />
      </div>
      <br />
      <div class="field">
        <label for="servingSize">  Serving Size:</label>
        <input
          type="text"
          name="servingSize"
          v-model="newRecipe.servingSize"
          placeholder="ie: 6"
        />
      </div>
      <br />
      <div class="field">
        <label for="description">Description: </label>
        <textarea name="description" v-model="newRecipe.description" />
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

      <div class="ingredientList">
        <label for="ingredient">Ingredients:</label>
        <button class="ingredients-btn">
          <a v-on:click="newRecipe.ingredients.push('')">Add Ingredient</a>
        </button>
        <br />

        <ul>
          <li
            v-for="(ingredient, index) in newRecipe.ingredients"
            v-bind:key="index"
            class="ingredientList"
          >
            <div class="ingredients-check-group">
              

              <input
                type="text"
                name="Ingredient"
                class="ingredients-input"
                placeholder="ie. Apples"
                v-model="newRecipe.ingredients[index]"
                @keyup.enter="newRecipe.ingredients.push('')"
              />

              <input
                type="checkbox"
                id="step"
                class="ingredient-checkbox"
                v-bind:key="index"
                v-bind:value="index"
                v-model="indexOfIngredients"
              />
            </div>
          </li>
        </ul>     </div>


        <div class="deleteDiv">
          <button class="delete-btn">
            <a v-on:click="deleteIngredients">Delete Selected Ingredients</a>
          </button>
   
      </div>

      <div class="stepsList">
          <ol>
          <label for="ingredient" class="stepsLabel">Steps:</label>
          <button class="ingredients-btn addSteps-btn">
            <a v-on:click="newRecipe.steps.push('')">Add Step</a>
          </button>
          <br />
          <br />

          <li v-for="(step, index) in newRecipe.steps" v-bind:key="index">
            <div class="ingredients-check-group">

              <input
                type="text"
                class="steps-input"
                placeholder="ie: Gather Ingredients..."
                v-model="newRecipe.steps[index]"
                @keyup.enter="newRecipe.steps.push('')"
              />
              <input
                type="checkbox"
                id="step"
                v-bind:key="index"
                v-bind:value="index"
                v-model="indexOfSteps"
              />
            </div>
          </li>    </ol>  </div>


          <div class="deleteDiv">
            <button class="delete-btn">
              <a v-on:click="deleteSteps">Delete Selected Steps</a>
            </button>
        
    
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
import APIService from '../services/APIService';
export default {
  data() {
    return {
      currentValue: 0,
      indexOfSteps: [],
      indexOfIngredients: [],
      wordArray:[],
      newRecipe: {
        // ingredients: [""],
        // steps: [""],
        // tags: [],
      },
    };
  },
  methods: {
    createNewRecipe() {
      APIService.addRecipe(this.newRecipe)
        .then(response => {
          this.$store.commit('ADD_RECIPES', response.data)
          this.$router.push(`/recipes/${response.data}`);
          })
        .catch(
        (error) => {
          if(error.response) {
              window.alert('Bad Request');
          } else if(error.request) {
              window.alert('Could not reach service');
          }
        }
      );
    },
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
    keywords(){
      let keywordArray = this.newRecipe.recipeName.split(" ");

      keywordArray.foreach((word)=>{
        this.newRecipe.keywords= this.newRecipe.keywords + word + ", ";
      })
      return this.newRecipe.keywords;
    }
    
  },
  computed: {
    
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
