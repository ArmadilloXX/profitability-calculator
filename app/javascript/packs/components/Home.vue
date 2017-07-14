<i18n>
  en:
    header: 'Welcome!'
    description: 'This small tool helps you to calculate real profitability of your loans based on received payments'
  ru:
    header: 'Добро пожаловать!'
    description: 'Это небольшое приложение поможет посчитать рельную доходность выданных займов на основе полученных платежей'
</i18n>
<template>
  <section class="hero is-fullheight is-primary">
    <div class="hero-body">
      <div class="container">
        <div class="columns is-multiline">
          <div class="column is-12">
            <h1 class="title is-1">
             {{ $t('header') }}
            </h1>
            <h5 class="subtitle is-3">
             {{ $t('description') }}
            </h5>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
  export default {
    props: [ 'locale' ],
    data() {
      return {}
    },
    beforeMount() {
      this.$i18n.locale = this.locale;
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
      }
    }
  }
</script>
