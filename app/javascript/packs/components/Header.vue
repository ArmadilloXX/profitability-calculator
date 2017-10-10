<i18n>
  en:
    title: 'Profitability Calculator'
    dashboard_link: 'Calculator'
  ru:
    title: 'Калькулятор доходности'
    dashboard_link: 'Калькулятор'
</i18n>
<template>
  <header>
    <nav class="nav sticky has-shadow">
      <div class="container is-fluid">
        <div class="nav-left">
          <router-link class='nav-item' to='/'>
            <h1 class="title is-3">
              {{ $t('title') }}
            </h1>
          </router-link>
        </div>
        <div class="nav-center">
          <router-link class="nav-item is-hidden-mobile"
                          to='/dashboard'
                          active-class='is-active'>
            {{ $t('dashboard_link') }}
          </router-link>
        </div>
        <span class="nav-toggle" @click='toggleNavigation'>
          <span></span>
          <span></span>
          <span></span>
        </span>
        <div class="nav-right nav-menu" :class="{ 'is-active': showMenu }">
          <router-link class="nav-item is-hidden-tablet"
                          to='/dashboard'
                          active-class='is-active'>
            {{ $t('dashboard_link') }}
          </router-link>
          <div class="nav-item" @click.prevent='localeWasSelected'>
            <a href="">
              <span class="locale tag" data-locale='ru'>
                RU
              </span>
            </a>
          </div>
          <div class="nav-item" @click.prevent='localeWasSelected'>
            <a href="">
              <span class="locale tag" data-locale='en'>
                EN
              </span>
            </a>
          </div>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
  export default {
    props: [ 'locale' ],
    data () {
      return {
        showMenu: false,
      }
    },
    beforeMount() {
      this.$i18n.locale = this.locale;
    },
    mounted() {
      this.highlightSelectedLocale(this.locale);
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
        this.highlightSelectedLocale(this.locale);
      }
    },
    methods: {
      toggleNavigation() {
        this.showMenu = !this.showMenu;
      },
      highlightSelectedLocale(locale) {
        let tags = document.querySelectorAll('span.locale');
        tags.forEach((tag) => {
          if (tag.dataset.locale == locale) {
            tag.className = 'locale tag is-medium is-primary';
          } else {
            tag.className = 'locale tag is-white'
          }
        });
      },
      localeWasSelected(e) {
        let locale = e.target.dataset.locale;
        this.$emit('localeChanged', locale);
      }
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
