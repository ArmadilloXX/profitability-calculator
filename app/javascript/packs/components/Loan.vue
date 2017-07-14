<i18n>
  en:
    title: 'Loan Details'
    payments_header: 'Payments'
    add_new_payment: 'Add new payment'
    borrower: 'Borrower'
    loan_plan: 'Loan Plan'
    amount: 'Amount'
    exp_sum: 'Expected Sum'
    rec_sum: 'Received Sum'
    prof_rate: 'Profitability Rate'
  ru:
    title: 'Займ'
    payments_header: 'Платежи'
    add_new_payment: 'Добавить новый платеж'
    borrower: 'Заемщик'
    loan_plan: 'План займа(условия)'
    amount: 'Выданная сумма'
    exp_sum: 'Ожидаемая сумма'
    rec_sum: 'Полученная сумма'
    prof_rate: 'Доходность'
</i18n>
<template>
  <main>
    <section class="hero is-small is-primary">
      <div class="hero-body">
        <div class="container has-text-centered">
          <h1 class="title is-1">
            {{ $t('title') }} #{{ loanId }}
          </h1>
          <br>
          <div class="columns">
            <div class="column is-6 has-text-centered">
              <h2 class="title is-4">
                {{ loan.borrower_name}}
              </h2>
              <h2 class="subtitle is-6">
                {{ $t('borrower') }}
              </h2>
            </div>
            <div class="column is-6 has-text-centered">
              <h2 class="title is-4">
                {{ loan.loan_plan_name }}
              </h2>
              <h2 class="subtitle is-6">
                {{ $t('loan_plan') }}
              </h2>
            </div>
          </div>
          <br>
          <div class="box">
            <div class="columns">
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.amount.toLocaleString(locale) }}
                </h2>
                <h2 class="subtitle is-6">
                  {{ $t('amount') }}
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.expected_sum.toLocaleString(locale) }}
                </h2>
                <h2 class="subtitle is-6">
                  {{ $t('exp_sum') }}
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  {{ loan.received_sum.toLocaleString(locale) }}
                </h2>
                <h2 class="subtitle is-6">
                  {{ $t('rec_sum') }}
                </h2>
              </div>
              <div class="column is-3 has-text-centered">
                <h2 class="title is-3">
                  <strong>
                    {{ currentProfitability }}
                  </strong>
                </h2>
                <h2 class="subtitle is-6 ">
                  {{ $t('prof_rate') }}
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
                <h2 class="title is-3">
                  {{ $t('payments_header') }}
                </h2>
              </div>
              <div class="level-right">
                <button class="button is-success is-large" @click='showNewPaymentForm'>
                  {{ $t('add_new_payment') }}
                </button>
              </div>
            </div>
          </div>
          <b-modal v-cloak :active.sync='newPaymentFormOpened' :width='450'>
            <div class="card">
              <div class="card-content">
                <app-payment-form :locale='locale' :loan='loan'>
                </app-payment-form>
              </div>
            </div>
          </b-modal>
        </div>
      </div>
    </section>
      <app-loan-payments-table :loan-id='loanId' :locale='locale' v-cloak></app-loan-payments-table>
    </div>
  </main>
</template>

<script>
  import PaymentForm from './PaymentForm.vue'
  import LoanPaymentsTable from './LoanPaymentsTable.vue'
  export default {
    props: [ 'locale' ],
    data() {
      return {
        loanId: this.$route.params.id,
        loan: {},
        newPaymentFormOpened: false
      }
    },
    beforeMount() {
      this.getLoanDetails();
      this.$i18n.locale = this.locale;
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
      }
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
