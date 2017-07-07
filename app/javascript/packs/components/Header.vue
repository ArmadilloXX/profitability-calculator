<template>
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
