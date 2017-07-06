/* eslint no-console:0 */

import Vue from 'vue/dist/vue'
import Buefy from 'buefy'
import 'buefy/lib/buefy.css'
import TurbolinksAdapter from 'vue-turbolinks'
import Header from './components/Header.vue'

Vue.component('application', {
  components: {
    appHeader: Header
  }
});

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementsByTagName('application')[0];
  if (element != null) {
    var app = new Vue({
      mixins: [TurbolinksAdapter],
      el: element
    });
  }
});
