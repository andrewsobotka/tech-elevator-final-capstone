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
            <div id="rowContainer">
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
                v-model="$store.state.groceryList[index].item"
              />
              <p>for</p>
              <input
                id="textbox"
                type="text"
                v-model="$store.state.groceryList[index].recipeName"
              />
              </div>
              <br />
              <div>
              <div
                id="line"
                v-if="index != 
                $store.state.groceryList.length - 1"
              >
              </div>
                <br />
              </div>
            </li>
          </ul>
        </form>
      </div>
  
    <br />
    
      <div id="button-container">
        <button class="add-btn" v-on:click="$store.state.groceryList.push('')">
          Add Item
        </button>
         <button class="select-all-btn" @click="toggleSelectAll">{{ isAllSelected() ? 'Unselect' : 'Select All' }}</button>

          <button class="delete-btn" v-on:click="deleteItems">
          Delete Items
        </button>
      </div>  
    </div>
 
    <br />
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
      isSelected:[],   originalGroceryList: [],
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
   toggleSelectAll() {
      if (this.isAllSelected()) {
        this.indexOfGroceryList = [];
      } else {
        this.indexOfGroceryList = [...Array(this.$store.state.groceryList.length).keys()];
      }
    },
    isAllSelected() {
      return this.indexOfGroceryList.length === this.$store.state.groceryList.length;
    },
    refreshPage() {
   
      this.$router.push({ name: this.$route.name, params: this.$route.params });
    },
  },
    cancelEdit() {
      this.isSelected = [...this.originalSelection];
    },
  
  computed: {},
};
</script>

<style scoped>
.body {
  background: white;
}

#grocery {
  display: block;
  align-items: center;
  margin: auto;
  background: #fff;
  display:flex;
  flex-direction: column;
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
  display: flex;

}

ul {
  width: 40rem;
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

#button-container-2 {
  display: flex;
  justify-content: center;
  position: relative;
  left: 18rem;
  margin-top: 0px;
  margin-bottom: 30px;
  width: 35rem;
}

button {
  margin: 0px 10px;
}

#button-container :nth-child(1){
background: rgb(151, 199, 112);
}

#button-container :nth-child(2){
background: rgb(241, 193, 89);
}

#list-title {
  display: flex;
  justify-content: center;
  margin: 0px;
}

#list-container {
  display: flex;
  justify-content: center;
  position: relative;
  left: 30px;
}

.delete-btn {
  margin-top: 0px;
  background: rgb(206, 74, 74);
  color: #fff;
  font-size: 1rem;
  transition: ease 0.5s;
}

.delete-btn:hover {
  background: rgb(122, 20, 20);
}

.delete-btn a {
  color: #fff;
}
.delete-btn{
  background: rgb(121, 15, 15);
}

#save {
  display: flex;
  justify-content: center;
}

#textbox {
  width: 8rem;
}
p{
  width:1rem;
  font-family: "Montserrat";
}

#rowContainer{
  display: flex;
}

#line{
  color: black;
}


</style>