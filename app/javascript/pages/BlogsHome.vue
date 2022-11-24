<template>
  <div class="row #e3f2fd blue lighten-5 blogs-home">
    <div class="col-6 m6" v-for="blog in blogs">
      <div class="blog-article">
        <h3 class="blog-title">{{ blog.title }}</h3>
        <div class="blog-content">{{ blog.body }}</div>
        <router-link :to="{ path: `/blogs/edit/${blog.id}` }" class="btn">本の編集</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "BlogsHome",
  data: function() {
    return {
      blogs: [],
    }
  },
  mounted: function() {
    this.fetchBlogs();
  },
  methods: {
    fetchBlogs() {
      axios.get('/api/blogs').then((res) => {
        for(var i = 0; i < res.data.blogs.length; i++) {
          this.blogs.push(res.data.blogs[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
  }
}

</script>

<style scoped>

</style>