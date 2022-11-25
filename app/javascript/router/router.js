import Vue          from 'vue'
import VueRouter    from 'vue-router'
import BlogsHome     from '../pages/BlogsHome.vue'
import BlogsCreate   from "../pages/BlogsCreate";
import BlogsEdit     from "../pages/BlogsEdit";

Vue.use(VueRouter)

const routes = [
    { path: '', redirect: '/blogs'},
    { path: '/blogs',  name: 'BlogsHome', component: BlogsHome },
    { path: '/blogs/create', name: 'BlogsCreate', component: BlogsCreate },
    { path: '/blogs/edit/:id', name: 'BlogsEdit', component: BlogsEdit }
];

export default new VueRouter({  mode: 'history', routes });
