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
        <div id="username">
          <p><u>You are currently logged in as:</u></p>
          <h4>{{ $store.state.user.username }}</h4>
        </div>
      </div>
      <div class="settings2change">
        <h2>settings</h2>
        <input type="checkbox" class="checkbox" /> Make my account private
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.account-container {
  margin: auto;
  display: flex;
  border-radius: 10px;
  border: 2px solid #333;
  margin: auto;
  background-color: #fff;
  font-size: 1rem;
  font-family: "montserrat";
  height: 40vh;
  max-width: 950px;
}

.user-identification {
  display: flex;
  flex-direction: column;
  padding: 3px;
  background-color: rgb(151, 199, 156);
  color: rgb(15, 13, 13);
  border-right: 2px solid #333;
  width: 30%;
 
}

p {
  font-size: 1rem;

}
.image {
  margin-right: 0px;
  margin-bottom: 10px;
}

.image img {
  position: relative;
  border-radius: 100px;
  left: 1rem;
  top: 1rem;
  border-radius: 1px solid #333;
  margin: auto;
  height: 100px;
  width: 100px;
  object-fit: cover;
}

<<<<<<< HEAD
#username {
  text-align: left;
  position: relative;
  left: 10%;
}
=======

>>>>>>> cab31b7fa17169ec6d3c40a82b21d25c0cf9b664

.settings2change {
  width: 100%;
  margin-top: 1%;
  margin-left: 1%;
  max-width: 690px;
}
h2 {
  font-size: 1.3rem;
  font-weight: 300;
  color: rgb(109, 108, 108);
}

h3 {
  text-align: center;
  text-decoration: none;
}
h4 {
  font-size: 1.4rem;
  font-family: "Averia Serif Libre", cursive;
  margin-top: 0px;
}
.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
  margin-bottom: 30px;
}
</style>