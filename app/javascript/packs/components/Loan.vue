<template>
  <section class="hero is-small is-primary">
    <div class="hero-body">
      <div class="container has-text-centered">
        <h1 class="title is-1">
          Loan Details #{{ loanId }}
        </h1>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    data() {
      return {
        loanId: this.$route.params.id
      }
    },
  }
</script>
