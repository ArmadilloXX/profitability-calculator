/* eslint no-console:0 */

import Vue from 'vue';
import router from './routing/router';
import VueResource from 'vue-resource';
import VueI18n from 'vue-i18n';
import Buefy from 'buefy';
import 'buefy/lib/buefy.css';
import css from './stylesheets/application.sass';
import TurbolinksAdapter from 'vue-turbolinks';
import App from './components/Application.vue';

Vue.use(VueResource);
Vue.use(VueI18n);

let token = document.querySelector('meta[name="csrf-token"]');
if (token !== null) {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content;
}

Vue.use(Buefy, {
  defaultIconPack: 'fa'
});

document.addEventListener('turbolinks:load', () => {
  let element = document.getElementById('application');
  if (element !== null) {
    new Vue({
      mixins: [TurbolinksAdapter],
      el: element,
      router,
      render: (h) => h(App)
    });
  }
});
