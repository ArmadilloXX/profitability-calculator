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
