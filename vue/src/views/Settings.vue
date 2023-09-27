<template>
  <div class="settings">
    <div id="account">
      <h2>My Account</h2>
    </div>
    <div id="account-container">
      <div id = "username">
        <h4>{{$store.state.user.username}}</h4>
      </div>
    </div>

    </div>
</template>

<script>
export default {

}
</script>

<style>
#setting{
  display: flex;
  justify-content: center;
}

#account{
  text-align: center;
}

#account-container{
  display: flex;
  border-radius: 30px;
  border: 2px solid #333;
  margin: 1rem;
  justify-content: center ;
  background-color: #fff;
  font-size: 40px;
  font-family: "montserrat";
  text-align: center;
}



</style>