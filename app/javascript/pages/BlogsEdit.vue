<template>
  <div class="container">
    <h4>ブログの登録</h4>
    <form class="col">
      <div class="row">
        <div class="input-field">
          <input type="text" class="validate" placeholder="Title" v-model="blog.title" required="required">
        </div>
      </div>
      <div class="row">
        <div class="input-field">
          <input type="text" class="validate blog-content-input" placeholder="Content" v-model="blog.body" required="required">
        </div>
      </div>
      <div class="btn" v-on:click="updateBlog(blog.id)">
        ブログの内容を変更する
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: "BlogsEdit",
  data: function() {
    return {
      id: this.$route.params.id,
      blog: {
        id: '',
        title: '',
        body: '',
      },
    }
  },
  mounted: function() {
    this.setBlogEdit(this.id);
  },
  methods: {
    setBlogEdit(id) {
      axios.get(`/api/blogs/${id}`).then((res) => {
        this.blog.id = res.data.blog.id;
        this.blog.title = res.data.blog.title;
        this.blog.body = res.data.blog.body;
      });
    },
    updateBlog(id) {
      axios.put(`/api/blogs/${id}`, { blog: this.blog }).then((res) => {
        this.$router.push({ path: '/blogs' });
      }, (error) => {
        console.log(error);
      });
    },
  }
}
</script>

<style scoped>

</style>