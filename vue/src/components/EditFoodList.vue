<template>
  <div class="body">
    <div id="grocery">
      <div id="list-title">
        <h2>My Grocery List</h2>
      </div>
      <br />
      <div id="list-container">
          <form>
        <ul>
          <li
            v-for="(item, index) in $store.state.groceryList"
            v-bind:key="index"
          >
            <input
              id="check"
              type="checkbox"
              v-bind:key="index"
              v-bind:value="index"
              v-model="indexOfGroceryList"
            />
            <input
              id="textbox"
              type="text"
              v-model="$store.state.groceryList[index]"
            />

            <div id="line"><br /></div>
          </li>
        </ul>
        </form>
      </div>
    </div>
    <br />
    <div id="button-container-2">
      <div id="button-container">
        <button class="delete-btn" v-on:click="deleteItems">
          Delete Items
        </button>
        <button class="add-btn" v-on:click="$store.state.groceryList.push('')">
          Add Item
        </button>
      </div>
    </div>

    <div id="save">
      <router-link v-bind:to="{ name: 'grocery-list' }"
        ><button>Save Grocery List</button></router-link
      >
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      indexOfGroceryList: [],
    };
  },
  methods: {
    deleteItems() {
      let newArray = [];
      for (let i = 0; i < this.$store.state.groceryList.length; i++) {
        if (!this.indexOfGroceryList.includes(i)) {
          newArray.push(this.$store.state.groceryList[i]);
        }
      }
      this.$store.state.groceryList = newArray;

      this.indexOfGroceryList = [];
    },
  },
  computed: {},
};
</script>

<style>
.body {
  background: white;
}

#grocery {
  display: block;
  align-items: center;
  margin-left: 0px;
  background: #fff;
}

h2 {
  text-align: left;
  margin-left: 0px;
  padding: 0px;
  background: #fff;
  width: 35rem;
  margin-bottom: 0px;
  padding-bottom: 0px;
}

li {
  list-style: none;
  font-size: 1rem;
  background: #fff;
  margin-right: 20%;
}

ul {
  width: 35rem;
  background: #fff;
}

#check {
  margin-right: 3%;
}

div #line {
  width: 100%;
  border-top: #333, 1px;
  height: 1px;
  background: black;
  margin-top: 2%;
  margin-bottom: 2%;
}

#button-container {
  display: flex;
  justify-content: center;
  align-content: center;
  margin-top: 0px;
  width: 35rem;
  align-content: top;
}

#button-container-2 {
  display: flex;
  justify-content: center;
}

#list-title {
  display: flex;
  justify-content: center;
  margin: 0px;
}

#list-container {
  display: flex;
  justify-content: center;
}
.add-btn{
  margin-top:0px;
}

.delete-btn {
  margin-top: 0px;
  background: rgb(206, 74, 74);
  color: #fff;
  font-size: 0.8rem;
  transition: ease 0.5s;
}

#save {
  display: flex;
  justify-content: center;
}

#textbox {
  width: 25rem;
}
</style>