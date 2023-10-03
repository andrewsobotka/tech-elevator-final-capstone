<template>
  <div class="settings">
    <h3>My Account</h3>
    <div class="borderbox"></div>

    <div class="account-container">
      <!-- user icon and stats -->

      <div class="user-identification">
        <div class="image">
          <img
            src="https://www.denverpost.com/wp-content/uploads/2016/04/20150424__20150425_C2_FE23ahcathatsp4.jpg?w=620"
            alt=""
          />
        </div>

        <div class="textcontainer">
          <div id="username">
            <h3>
              <p>Hello {{ $store.state.user.username }}!</p>
            </h3>
            <p>you have x saved recipes</p>
          </div>
        </div>
      </div>

      <div class="settings2change">
        <h2>settings</h2>
        <input type="checkbox" class="checkbox" /> Make my account private

        <br />
        <div class="settingsLinks">
          <router-link v-bind:to="{ name: 'tags' }"
              v-if="$store.state.user.authorities[0].name == 'ROLE_ADMIN'" class="settings-link">Update Tags</router-link>
          <a href="" class="settings-link">Edit Saved Recipes</a>
          <a href="" class="settings-link">Delete Recipes</a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.settings{
  overflow: hidden;
}
.account-container {
  display: flex;
  border-radius: 1px;
  border: 2px solid rgba(51, 51, 51, 0.897);
  background-color: #fff;
  font-size: 1rem;
  font-family: "montserrat";
  height: 40vh;
  max-width: 950px;
  position: relative;
  left: 21%;

}

.user-identification {
  display: flex;
  flex-direction: column;
  background-color: rgb(151, 199, 156);
  color: rgb(15, 13, 13);
  border-right: 2px solid #333;
  width: 20%;
  justify-content: center;
  align-items: center;
  overflow: auto;
  
}

p {
  font-size: 1rem;
  text-align: center;
}
.image {
  margin-right: 0px;
  margin-bottom: 10px;
}

.image img {
  position: relative;
  border-radius: 100px;
  border: solid #fff 12px;
  height: 100px;
  width: 100px;
  object-fit: cover;
}

.username {
  position: relative;
}

.textcontainer {
  background: rgba(238, 255, 217, 0.863);
  padding-bottom: 10px;
  margin: 8px;
}

.settings2change {
  width: 100%;
  margin-top: 1%;
  margin-left: 1%;
  max-width: 690px;
}
h2 {
  font-size: 1.5rem;
  font-weight: 300;
  color: rgb(109, 108, 108);
  padding: 0.5rem;
  margin-bottom: 1rem;
  width: 105%;
}

h3 {
  text-align: center;
  text-decoration: none;
}
h4 {
  font-size:3rem;
  font-family: "Averia Serif Libre", cursive;
  margin-top: 0px;
}
.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
  margin-bottom: 30px;
}

.settings-link {
  background: rgb(208, 247, 157);
  position: relative;
  width: 50%;
  margin: 0.3rem;
  padding: 0.5rem 0.5rem;
  transition: ease-in 0.3s;
}
.settings-link:hover {
  background: rgba(122, 165, 122, 0.76);
  font-weight: bold;
}

.settings-link :nth-child(even) {
}

.settingsLinks {
  display: flex;
  flex-direction: flex;
  margin: 30px;

  justify-content: center;
  text-align: center;
}

@media only screen and (max-width: 900px) {
  .settings{
    display:flex;
    flex-direction: column;
  }
 

  .account-container {
 left: 0px;
    justify-content: center;
  }
}
</style>