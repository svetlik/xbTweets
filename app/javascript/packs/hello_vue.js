import Vue from 'vue'
import App from '../components/app.vue'
import VueMq from 'vue-mq'

Vue.use(VueMq, {
  breakpoints: {
    mobile: 300,
    tablet: 600,
    laptop: 900,
    desktop: Infinity,
  }
})

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const element = document.getElementById("hello-vue")
  const props = JSON.parse(element.getAttribute('data'))
  const app = new Vue({
    el,
    render: h => h(App, { props })
  }).$mount('#hello-vue');

  console.log(app)
})
