<template>
  <div>
    <div class="blank"></div>
    <footer>
      <div class="footerlinks-container">
        <div class="links">

<img src="https://i.imgur.com/q1E063E.png" alt="">
<h3>Sage</h3>
        </div>
        <div class="links">
          <a href="/settings" class="footerlink"> Settings </a>
          <a href="#form" class="footerlink"> Contact Us </a>
          <a href="" class="footerlink"> Hire Us </a>
        </div>

          <div class="links">
          <a href="#settings" class="footerlink"> Settings </a>
          <a href="#form" class="footerlink"> Contact Us </a>
          <a href="" class="footerlink"> Hire Us </a>
        </div>

      <div class="links">
          <a href="#settings" class="footerlink"> Settings </a>
          <a href="#form" class="footerlink"> Contact Us </a>
          <a href="" class="footerlink"> Hire Us </a>
        </div>
      </div>
      2023 ® Sage, Inc.
    </footer>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.blank{
    padding-top: 15rem;
}

footer {
  background: rgba(58, 38, 21, 0.705);
  padding-bottom: 3rem;
  color: rgb(207, 207, 207);
}

footer a {
  color: rgb(207, 207, 207);
  font-size: 1.3rem;
  font-family: "Averia Serif Libre", cursive;
  margin: 3px;
  text-align: left;
}

footer a:hover{
  color: rgb(145, 194, 113);
  transform: scale(1.03);
}

div {
  position: relative;
  margin-top: 30px;
  font-family: "Montserrat";
  background-color: transparent;
  text-align: center;
  align-content: flex-end;
}

.footerlinks-container {
  display: flex;
  align-items: center;

  justify-content:space-evenly;
  margin-bottom: 1rem;
  margin: auto;
  position: relative;

}

.links {

  display: flex;
  flex-direction: column;
  display: flex;
  justify-content: space-evenly;
  margin: 2rem 0rem 1rem 3rem;
}

.links img{
  width: 10rem;
  height: 10rem;
}
</style>