/* eslint no-console:0 */

import Vue from 'vue/dist/vue';
import VueResource from 'vue-resource'
import Buefy from 'buefy';
import 'buefy/lib/buefy.css';
import TurbolinksAdapter from 'vue-turbolinks';
import Header from './components/Header.vue';
import LoansTable from './components/LoansTable.vue';
import LoanPaymentsTable from './components/LoanPaymentsTable.vue';

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
    appLoansTable: LoansTable,
    appLoanPaymentsTable: LoanPaymentsTable
  }
});

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementsByTagName('application')[0];
  if (element !== null) {
    var app = new Vue({
      mixins: [TurbolinksAdapter],
      el: element
    });
  }
});
