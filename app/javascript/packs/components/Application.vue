<template>
  <main>
    <app-header></app-header>
    <router-view></router-view>
  </main>
</template>

<script>
  import Header from './Header.vue';
  import Home from './Home.vue';
  import Loans from './Loans.vue';
  import Loan from './Loan.vue';

  export default {
    data() {
      return {}
    },
    components: {
      appHeader: Header,
      appHome: Home,
      appLoans: Loans,
      appLoan: Loan,
    }
  }
</script>
