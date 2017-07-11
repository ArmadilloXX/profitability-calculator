<template>
  <div class="new-loan-form">
    <h2 class="title is-3 has-text-centered">Add new loan</h2>
    <br>
    <b-field>
      <div v-if='errors' class="form-errors">
        {{ errors }}
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
            <option value="1">Test Borrower 1</option>
            <option value="2">Test Borrower 2</option>
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
            <option value="1">Loan Plan 1</option>
        </b-select>
      </b-field>
      <br>
      <br>
      <input type="submit"
             name='commit'
             value='Add'
             class='button is-large is-primary'
             @click.prevent='createNewLoan'>

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
    methods: {
      createNewLoan() {
        this.$http.post(
          '/loans', {
            loan: this.loan,
            emulateJSON: true,
            responseType: 'json'
        }).then(
          response => {
            Turbolinks.visit();
          },
          response => {
            this.errors = response.body;
            console.log(response.body);
          });
      }
    }
  }
</script>
