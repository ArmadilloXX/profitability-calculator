<template>
  <div class="new-payment-form">
    <h2 class="title is-3 has-text-centered">Add new payment</h2>
    <br>
    <b-field>
      <div v-if='errors' class="form-errors">
        {{ errors }}
      </div>
    </b-field>
    <form accept-charset='utf-8'>
      <b-field>
        <b-input
            type="number"
            size='is-large'
            step="0.01"
            icon="rub"
            name="payment[amount]"
            v-model="payment.amount"
            placeholder="Enter payment amount"
            required>
        </b-input>
      </b-field>
      <b-field>
        <b-select
            placeholder="select payment period"
            icon="calendar-o"
            name="payment[payment_period]"
            v-model="payment.payment_period"
            icon-pack="fa"
            expanded
            required>
            <option value="Month 1">Month 1</option>
            <option value="Month 2">Month 2</option>
        </b-select>
      </b-field>
      <br>
      <b-field>
        <div class="block has-text-centered">
          <b-switch
            v-model="payment.overdue"
            size='is-large'>
            <span>
              Payment overdued?
            </span>
          </b-switch>
        </div>
      </b-field>
      <br>
      <br>
      <b-field class="has-text-centered">
        <input type="submit"
              name='commit'
              value='Save payment'
              class='button is-large is-primary'
              @click.prevent='createNewPayment'>
      </b-field>

    </form>
  </div>
</template>

<script>
  export default {
    props: [ 'loanId' ],
    data() {
      return {
        errors: undefined,
        payment: {},
      }
    },
    methods: {
      createNewPayment() {
        this.$http.post(
          `/loans/${this.loanId}/payments`,
            {
              payment: this.payment
            },
            {
              emulateJSON: true,
              responseType: 'json'
            }
          ).then(
          response =>{
            Turbolinks.visit();
          },
          response =>{
            this.errors = response.body;
            console.log(response.body);
          });
      }
    }
  }
</script>
