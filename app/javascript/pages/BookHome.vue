<template>
  <div class="container">
    <h1 class="#f3e5f5 purple lighten-5 center">[Rails+Vue.js]~Bookshelf~</h1>
    <div class="row #e3f2fd blue lighten-5">
      <div class="col s4 m6" v-for="book in books">
        <div class="card btn">
          <span class="card-title" v-on:click="setBookInfo(book.id)">
            {{ book.title }}
          </span>
        </div>
      </div>
    </div>
    <div class="row" v-show="bookInfoBool">
      <div class="col s12 m12">
        <div class="card blue-grey darken-1">
          <div class="card-content white-text">
            <span class="card-title">
              【{{ bookInfo.title }}】
            </span>
            <div class="detail">
              ・著者：{{ bookInfo.author }}
            </div>
            <div class="detail">
              ・出版社：{{ bookInfo.publisher }}
            </div>
            <div class="detail">
              ・ジャンル：{{ bookInfo.genre }}
            </div>
            <router-link :to="{ path: `/edit/${bookInfo.id}` }" class="btn">本の編集</router-link>
            <button class="btn #e53935 red darken-1" v-on:click="deleteBook(bookInfo.id)">削除</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'BookHome',
  data: function() {
    return {
      bookInfo: {},
      bookInfoBool: false,
      books: [],
    }
  },
  mounted: function() {
    this.fetchBooks();
  },
  methods: {
    fetchBooks() {
      axios.get('/api/books').then((res) => {
        for(var i = 0; i < res.data.books.length; i++) {
          this.books.push(res.data.books[i]);
        }
      }, (error) => {
        console.log(error);
      });
    },
    setBookInfo(id){
      axios.get(`/api/books/${id}`).then(res => {
        this.bookInfo = res.data;
        this.bookInfoBool = true;
      });
    },
    deleteBook(id) {
      axios.delete(`/api/books/${id}`).then(res => {
        this.books = [];
        this.bookInfo = '';
        this.bookInfoBool = false;
        this.fetchBooks();
      })
    }
  }
}
</script>

<style scoped></style>
