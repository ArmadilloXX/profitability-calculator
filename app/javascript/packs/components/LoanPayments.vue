<template>
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
    <app-payments-table :loan-id='loanId' v-cloak></app-payments-table>
  </div>
</template>

<script>
  import PaymentsTable from './LoanPaymentsTable.vue'
  import PaymentForm from './PaymentForm.vue'
  
  export default {
    props: ['loan-id'],
    data() {
      return {
        newPaymentFormOpened: false
      }
    },
    components: {
      appPaymentsTable: PaymentsTable,
      appPaymentForm: PaymentForm
    },
    methods: {
      showNewPaymentForm() {
        this.newPaymentFormOpened = true;
      },
      showErrors(event) {
        console.log(event);
      },
      handleSuccess(event) {
        console.log(event)
      }
    }
  }
</script>
