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
      <div class="btn" v-on:click="createBlog">
        投稿
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data: function () {
    return {
      blog: {
        title: '',
        body: '',
      }
    }
  },
  methods: {
    createBlog: function () {
      if (!this.blog.title) return;
      axios.post('/api/blogs', { blog: this.blog }).then(() => {
        this.$router.push({path: '/blogs'});
      }), (error) => {
        console.log(error);
      };
    }
  }
}
</script>
