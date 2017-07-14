<template>
  <div id="application" >
    <app-header :locale='locale' @localeChanged='changeLocale'></app-header>
    <router-view :locale='locale'></router-view>
  </div>
</template>

<script>
  import Header from './Header.vue';
  import Home from './Home.vue';
  import Loans from './Loans.vue';

  export default {
    data() {
      return {
        locale: 'en'
      }
    },
    methods: {
      changeLocale(locale) {
        this.locale = locale;
      }
    },
    components: {
      appHeader: Header,
      appHome: Home,
      appLoans: Loans,
    }
  }
</script>
