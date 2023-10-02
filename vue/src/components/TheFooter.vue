<template>
  <div>
    <div class="blank"></div>
    <footer>
      <div class="footerlinks-container">
        <div class="logo">
          <!-- <img src="https://i.imgur.com/q1E063E.png" alt=""> -->
          <h3>Sage</h3>
        </div>
        <div class="links">
          <a href="/settings" class="footerlink"> Settings </a>
          <a href="#form" class="footerlink"> Contact Us </a>
          <a href="" class="footerlink"> Hire Us </a>
        </div>

        <div class="links">
      2023 ® Sage, Inc.

        </div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.blank {
  padding-top: 15rem;
}

footer {
  background: rgba(119, 113, 77, 0.452);
  padding-bottom: 0rem;
}

footer a {
  color: rgb(55, 75, 23);
  font-size: 1.3rem;
  font-family: "Averia Serif Libre", cursive;
  margin: 15px;
  text-align: left;
  text-decoration: none;
}

footer a:hover {
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

  justify-content: space-around;
  margin-bottom: 1rem;
  margin: auto;
  position: relative;
  padding-right: 2rem;
}

.logo{
  justify-content: start;
}
.links {
    justify-content: space-between;
}

.links img {
  width: 10rem;
  height: 10rem;
}
</style>