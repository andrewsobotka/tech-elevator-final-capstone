<template>
  <div>
    <label for="tags">Tags:</label>
    <div class="tagsList">
      <div
        class="field"
        v-for="tag in $store.state.tags"
        v-bind:key="tag.tagId"
      >

        <input
          type="checkbox"
          class="tag"
          v-bind:value="tag.tag"
          v-bind:name="tag.tag"
        />
        <label v-bind:for="tag.tag">{{ tag.tag }}</label>
      </div>
      <div>
          <form v-on:submit.prevent="addNewTag">
        <label for="add">Add Tag</label>

      <input type=text name="add"
          v-model="newTag.tag"
          placeholder="ie: vegan"/>
        <button type="submit"  class="submit-btn">Add Tag</button>
          </form>
      </div>
    </div>
  </div>
</template>

<script>
import APIService from "../services/APIService";
export default {
  data() {
    return {
    //   editTags: [{ tag: "", tagId: 0 }],
      newTag:{ tag: "", tagId: 0 }
    };
  },
  created() {
    APIService.getTags().then((response) => {
      this.$store.commit("SET_TAGS", response.data);
    });
  },
  method:{
    addNewTag(){
        APIService.addTag(this.newTag).then((response) =>{
          if (response.status === 201){
            this.$router.push('/tags')
          }
        }
      ).catch(
        (error) => {
          if(error.response) {
              window.alert('Bad Request');
          } else if(error.request) {
              window.alert('Could not reach service');
          }
        }
      );
    },
  }
};
</script>

<style>
</style>