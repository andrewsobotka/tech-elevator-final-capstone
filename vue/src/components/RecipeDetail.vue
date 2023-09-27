<template>
  <div class="container">
    <h3>
      {{ recipe.recipeName }}
    </h3>
    <div class="borderbox"></div>

    <div class="desc-serve">
      <section class="description">
        <p>
          {{ recipe.recipeDescription }}
        </p>
      </section>

      <section class="servings">
        Serving Size: {{ recipe.servingSize }} | Created By:
        {{ recipe.creatorUsername }}
      </section>
    </div>

    <div class="ingredients-img-container">
      <div class="ingredients">
        <!-- where ID = XYZ v-for Data.Ingredients -->
        <h4>Ingredients</h4>
        <ul>
          <li
            v-for="(ingredient, index) in recipe.ingredients"
            v-bind:key="index"
            class="ingredient"
          >
            {{ ingredient }}
          </li>
        </ul>
      </div>
      <img :src="recipe.image" class="detail-img" />
    </div>

    <div class="instructions">
      <button class="steps-btn">
        Click Here to Follow the Instructions Step by Step
      </button>
      <h2>Instructions:</h2>

      <ol>
        <li
          class="steps"
          v-for="(step, index) in recipe.steps"
          v-bind:key="index"
        >
          {{ step }}
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  name: "recipeDetail",
  props: {
    recipe: Object,
  },
};
</script>
<style>
.container {
  overflow: auto;
  display: flex;
  flex-direction: column;
  background: rgba(255, 255, 255, 0.808);
  border-radius: 10px;
  border: 1px #333 solid;
  padding: 0rem 2.5rem;
  /* width: 30%;
  height: 70vh; */
  margin: 1rem 2rem;
  overflow-y: auto;
  padding-bottom: 3rem;
}

.instructions li {
  font-size: 1.2rem;
}
h2 {
  font-size: 1.4rem;
  border-bottom: 3px solid #444;
}
.borderbox {
  border-bottom: 10px solid #55695659;
  padding-top: 0rem;

  margin: -30px 0px 0px 0px;
  position: relative;
  width: auto;
}
h3,
h2 {
  font-family: "Averia Serif Libre", cursive;
  text-transform: capitalize;
  letter-spacing: 1px;
  padding-bottom: 0.1rem;
  font-size: 2rem;
}
.servings {
  position: relative;
  text-align: right;
  font-family: "Montserrat";
  color: #555;
  font-size: 0.8em;
  margin-top: 1%;
text-align: right;
}

.description {
  padding: 0rem 0.5rem;
  margin-top: -10px;
  font-family: "DM Sans", sans-serif;
  font-weight: 300;
  font-size: 18px;
  flex-grow: 3;
}
p {
}

.ingredients {
  font-size: 1rem;
  position: relative;
  font-family: "Montserrat", sans-serif;
  max-width: 80%;
  flex-grow: 200;
}
.ingredients-img-container {
  position: relative;
  display: flex;
  padding-bottom: 1.5rem;
}

.desc-serve {
  display: flex;
}
.detail-img {
  position: relative;
  width: 50vw;
  max-height: 60vh;
  object-fit: cover;
  margin-left: 3rem;
}

.steps-btn {
  font-family: "Montserrat", sans-serif;
  background: rgb(57, 82, 76);
  color: #fff;
  border-radius: 30px;
  border: 1px solid #333;
  max-width: 40rem;
  max-height: 3rem;
  font-size: 1rem;
  padding: 1.4%;
  float: right;
  margin: 0rem 0rem;
  position: relative;
  bottom: 0px;
  cursor: pointer;
  transition: ease-in 0.4s;
}

.steps-btn:hover {
  background: #883410;
  /* background-image: url('https://t4.ftcdn.net/jpg/02/87/02/71/240_F_287027124_R2xwyI2l2ncGKFqy6JF3Izaue1xEWfMn.jpg'); */
  transition: ease-out 0.3s;
}

.instructions {
  font-size: 0.9rem;
  padding-right: 1.3rem;
  line-height: 2rem;
  font-family: "Lexend", sans-serif;
}

.instructions ol li:nth-child(odd) {
  color: rgb(170, 84, 84);
}
::-webkit-scrollbar {
  width: 10px;
  scroll-padding-right: 3rem;
}

/* Track */
::-webkit-scrollbar-track {
  background: rgb(224, 222, 207);
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #304b39e7;
  border-radius: 5px;
  scroll-padding-right: auto;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgb(111, 187, 130);
}

@media only screen and (max-width: 780px) {
  .borderbox {
    position: relative;
    margin-top: 0%;
  }

  .detail-img {
    width: auto;
    height: 30vh;
    position: relative;
    margin-left: 0px;
  }
  .ingredients-img-container {
    display: flex;
    flex-direction: column-reverse;
  }

  .steps-btn {
    padding: 3%;
    font-size: 13px;
    align-content: start;
    margin-bottom: 3rem;
  }


  h3,
  h2 {
    font-size: 2rem;
    margin-bottom: 0.2rem;
  }
  .servings {
    margin: 3px 0px;
  }
}
</style>