/* eslint no-console:0 */

import Vue from 'vue/dist/vue';
import VueResource from 'vue-resource';
import Buefy from 'buefy';
import 'buefy/lib/buefy.css';
import css from './stylesheets/application.sass';
import TurbolinksAdapter from 'vue-turbolinks';
import Header from './components/Header.vue';
import Loans from './components/Loans.vue';
import LoanPayments from './components/LoanPayments.vue';

Vue.use(VueResource);

let token = document.querySelector('meta[name="csrf-token"]');
if (token !== null) {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content;
}

Vue.use(Buefy, {
  defaultIconPack: 'fa'
});

Vue.component('application', {
  components: {
    appHeader: Header,
    appLoans: Loans,
    appLoanPayments: LoanPayments
  }
});

document.addEventListener('turbolinks:load', () => {
  let element = document.getElementsByTagName('application')[0];
  if (element !== null) {
    let app = new Vue({
      mixins: [TurbolinksAdapter],
      el: element
    });
  }
});
