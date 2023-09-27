<template>
  <div>
    <footer>
      <div class="footerlinks-container">
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
div {
  position: relative;
;
  margin-top: 30px;
  font-family: "Montserrat";
  background-color: transparent;
  text-align: center;
  align-content: flex-end;
}

.footerlinks-container {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  margin-bottom: 1rem;
}

footer a {
  color: rgb(36, 134, 41);
  font-size: 1.3rem;
font-family: 'Averia Serif Libre', cursive;

  margin: 3px;
}
</style>