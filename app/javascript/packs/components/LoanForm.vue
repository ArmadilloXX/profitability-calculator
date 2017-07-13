<template>
  <div class="new-loan-form">
    <h2 class="title is-3 has-text-centered">Add new loan</h2>
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
    <form action="/loans" accept-charset='UTF-8' method='post'>
      <b-field>
        <b-input
            type="number"
            size='is-large'
            step="0.01"
            icon="rub"
            name="loan[amount]"
            v-model="loan.amount"
            placeholder="Enter new loan amount"
            required>
        </b-input>
      </b-field>
      <b-field>
        <b-select 
            placeholder="Select borrower"
            icon="handshake-o"
            name="loan[borrower_id]"
            v-model="loan.borrower_id"
            icon-pack="fa"
            expanded
            required>
            <option disabled value="">Select borrower</option>
            <option v-for='borrower in borrowers' :value="borrower.id">
              {{ borrower.name }}
            </option>
        </b-select>
      </b-field>
      <b-field>
        <b-select
            placeholder="Select loan plan"
            icon="calculator"
            name="loan[loan_plan_id]"
            v-model="loan.loan_plan_id"
            icon-pack="fa"
            expanded
            required>
            <option disabled value="">Select loan plan</option>
            <option v-for='loanPlan in loanPlans' :value="loanPlan.id">
              {{ loanPlan.name }}
            </option>
        </b-select>
      </b-field>
      <br>
      <br>
      <b-field class="has-text-centered">
        <input type="submit"
              name='commit'
              value='Save loan'
              class='button is-large is-primary'
              @click.prevent='createNewLoan'>
      </b-field>
    </form>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        errors: undefined,
        loan: {},
        borrowers: [],
        loanPlans: [],
      }
    },
    beforeMount() {
      this.getBorrowers();
      this.getLoanPlans();
    },
    methods: {
      getBorrowers() {
        this.$http.get('/api/v1/borrowers').then(
          response => {
            this.borrowers = response.body; 
            console.log(response.body)
          },
          response => {
            console.log(response.body)
          });
      },
      getLoanPlans() {
        this.$http.get('/api/v1/loan_plans').then(
          response => {
            this.loanPlans = response.body; 
            console.log(response.body)
          },
          response => {
            console.log(response.body)
          });
      },
      createNewLoan() {
        this.$http.post(
          '/api/v1/loans', {
            loan: this.loan,
        }).then(
          response => {
            Turbolinks.visit();
          },
          response => {
            this.errors = response.body.message.split(': ')[1].split(', ');
          });
      },
    }
  }
</script>
