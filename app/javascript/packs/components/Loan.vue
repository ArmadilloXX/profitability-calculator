<template>
  <main>
    <section class="hero is-small is-primary">
      <div class="hero-body">
        <div class="container has-text-centered">
          <h1 class="title is-1">
            Loan Details #{{ loanId }}
          </h1>
          <br>
          <div class="columns">
            <div class="column is-6 has-text-centered">
              <h2 class="title is-4">
                {{ loan.borrower_id }}
              </h2>
              <h2 class="subtitle is-6">
                Borrower
              </h2>
            </div>
            <div class="column is-6 has-text-centered">
              <h2 class="title is-4">
                {{ loan.loan_plan_id }}
              </h2>
              <h2 class="subtitle is-6">
                Loan Plan
              </h2>
            </div>
          </div>
          <br>
          <div class="box">
            <div class="columns">
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.amount.toFixed(2) }}
                </h2>
                <h2 class="subtitle is-6">
                  Amount
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.expected_sum.toFixed(2) }}
                </h2>
                <h2 class="subtitle is-6">
                  Expected Sum
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.received_sum }}
                </h2>
                <h2 class="subtitle is-6">
                  Received Sum
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  <strong>
                    {{ currentProfitability }}
                  </strong>
                </h2>
                <h2 class="subtitle is-6 ">
                  Current Profitability
                </h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class='section'>
      <div class="container" v-cloak>
        <div class="columns">
          <div class="column is-12">
            <div class="level">
              <div class="level-left">
                <h2 class="title is-3">Payments</h2>
              </div>
              <div class="level-right">
                <button class="button is-success is-large" @click='showNewPaymentForm'>Add new payment</button>
              </div>
            </div>
          </div>
          <b-modal v-cloak :active.sync='newPaymentFormOpened' :width='450'>
            <div class="card">
              <div class="card-content">
                <app-payment-form :loan='loan'>
                </app-payment-form>
              </div>
            </div>
          </b-modal>
        </div>
      </div>
    </section>
      <app-loan-payments-table :loan-id='loanId' v-cloak></app-loan-payments-table>
    </div>
  </main>
</template>

<script>
  import PaymentForm from './PaymentForm.vue'
  import LoanPaymentsTable from './LoanPaymentsTable.vue'
  export default {
    data() {
      return {
        loanId: this.$route.params.id,
        loan: {},
        newPaymentFormOpened: false
      }
    },
    beforeMount() {
      this.getLoanDetails();
    },
    computed: {
      currentProfitability() {
        return `${(this.loan.current_profitability_rate * 100).toFixed(2)}%`
      }
    },
    components: {
      appLoanPaymentsTable: LoanPaymentsTable,
      appPaymentForm: PaymentForm
    },
    methods: {
      getLoanDetails() {
        this.$http.get(`/api/v1/loans/${this.loanId}`).then(
          response => {
            this.loan = response.body;
            console.log(response.body);
          },
          response => {
            console.log(response.body);
          }
        );
      },
      showNewPaymentForm() {
        this.newPaymentFormOpened = true;
      },
    }
  }
</script>

<style>
.box {
  background-color: hsl(271, 100%, 31%) !important;
}
</style>
