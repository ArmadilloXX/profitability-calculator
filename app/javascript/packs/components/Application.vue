<template>
  <div id="application">
    <app-header></app-header>
    <router-view></router-view>
  </div>
</template>

<script>
  import Header from './Header.vue';
  import Home from './Home.vue';
  import Loans from './Loans.vue';

  export default {
    data() {
      return {}
    },
    components: {
      appHeader: Header,
      appHome: Home,
      appLoans: Loans,
    }
  }
</script>
