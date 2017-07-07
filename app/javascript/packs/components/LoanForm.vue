<template>
  <div class="new-loan-form" @ajax:error='showErrors' @ajax:success='handleSuccess'>
    <h2 class="title is-3 has-text-centered">Add new loan</h2>
    <br>
    <b-field>
      <div v-if='errors' class="form-errors">
        {{ errors }}
      </div>
    </b-field>
    <slot></slot>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        errors: undefined
      }
    },
    methods: {
      showErrors(event) {
        this.errors = event.detail[0];
      },
      handleSuccess(event) {
        Turbolinks.visit();
      }
    }
  }
</script>
