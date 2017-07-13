<template>
  <div class="new-payment-form">
    <h2 class="title is-3 has-text-centered">Add new payment</h2>
    <br>
    <b-field>
      <div v-if='errors' class="form-errors">
        <ul>
          <li v-for='error in errors'>
            {{ error }}
          </li>
        </ul>
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
            <option disabled value="">Select payment period</option>
            <option v-for='period in upcomingPeriods' :value="period">
                Month {{ period }}
            </option>
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
    props: [ 'loan' ],
    data() {
      return {
        errors: undefined,
        payment: {
          overdue: false
        },
      }
    },
    computed: {
      upcomingPeriods() {
        return this.loan.upcoming_payment_periods;
      }
    },
    methods: {
      createNewPayment() {
        this.$http.post(
          `/api/v1/loans/${this.loan.id}/payments`,
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
            this.errors = response.body.message.split(': ')[1].split(', ');
          });
      }
    }
  }
</script>
