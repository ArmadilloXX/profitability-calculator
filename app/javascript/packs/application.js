/* eslint no-console:0 */

import Vue from 'vue/dist/vue'
import Buefy from 'buefy'
import 'buefy/lib/buefy.css'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.component('application', {});

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementsByTagName('application')[0];
  if (element != null) {
    var app = new Vue({
      mixins: [TurbolinksAdapter],
      el: element
    });
  }
});
