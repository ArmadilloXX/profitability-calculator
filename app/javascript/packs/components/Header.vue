<template>
  <header>
    <nav class="nav sticky has-shadow">
      <div class="container is-fluid">
        <div class="nav-left">
          <router-link class='nav-item' to='/'>
            <h1 class="title is-3">PROFITABILITY CALCULATOR</h1>
          </router-link>
        </div>
        <div class="nav-center">
          <router-link class="nav-item is-hidden-mobile"
                          to='dashboard'
                          active-class='is-active'>
            My Dashboard
          </router-link>
        </div>
        <span class="nav-toggle" @click='toggleNavigation'>
          <span></span>
          <span></span>
          <span></span>
        </span>
        <div class="nav-right nav-menu" :class="{ 'is-active': showMenu }">
          <router-link class="nav-item is-hidden-tablet"
                          to='dashboard'
                          active-class='is-active'>
            My Dashboard
          </router-link>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
  export default {
    data () {
      return {
        showMenu: false,
      }
    },
    methods: {
      toggleNavigation() {
        this.showMenu = !this.showMenu;
      },
    }
  }
</script>

<style>
  body {
    margin-top: 52px !important;
  }
  nav.sticky {
    width: 100%;
    position: fixed;
    top: 0px;
  }
</style>
