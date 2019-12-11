import Vue from 'vue'
import App from '../app.vue'
import moment from 'moment'

window.addEventListener('load', function () {
  new Vue({
    render: h => h(App),
  }).$mount('#app')
})

Vue.filter('formatDate', function(value) {
  if (value) {
    return moment(String(value)).format('MM/DD/YYYY HH:mm')
  }
});
