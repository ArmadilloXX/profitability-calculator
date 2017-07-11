<template>
  <main>
    <section class="hero is-small is-primary">
      <div class="hero-body">
        <div class="container has-text-centered">
          <h1 class="title is-1">
            Loan Details #{{ loanId }}
          </h1>
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
                <app-payment-form>
                  <slot></slot>
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
  import LoanPaymentsTable from './LoanPaymentsTable.vue'
  export default {
    props: [ 'loan' ],
    data() {
      return {
        loanId: this.$route.params.id,
        newPaymentFormOpened: false
      }
    },
    components: {
      appLoanPaymentsTable: LoanPaymentsTable
    },
    methods: {
      showNewPaymentForm() {
        this.newPaymentFormOpened = true;
      },
    }
  }
</script>
