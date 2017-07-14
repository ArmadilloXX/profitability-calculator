<i18n>
  en:
    exp_prof_rate: 'Expected profitability rate'
    real_prof_rate: 'Real profitability rate'
    loans_header: 'Loans'
    add_new_loan: 'Add new loan'
    table:
      borrower: 'Borrower'
      loan_plan: 'Loan Plan'
      amount: 'Amount'
      exp_sum: 'Expected Sum'
      rec_sum: 'Received Sum'
      prof_rate: 'Profitability Rate'
      details: 'Details'
  ru:
    exp_prof_rate: 'Ожидаемая доходность'
    real_prof_rate: 'Текущая доходность'
    loans_header: 'Займы'
    add_new_loan: 'Добавить новый займ'
    table:
      borrower: 'Заемщик'
      loan_plan: 'План займа(условия)'
      amount: 'Выданная сумма'
      exp_sum: 'Ожидаемая сумма'
      rec_sum: 'Полученная сумма'
      prof_rate: 'Доходность'
      details: 'Подробности'
</i18n>
<template>
  <main>
    <section class="hero is-small is-primary">
      <div class="hero-body">
        <div class="container has-text-centered">
          <div class="columns">
            <div class="column is-6 has-text-centered">
              <h2 class="title is-1">
                {{ expectedProfitabilityRate }}
              </h2>
              <h2 class="subtitle is-5">
                {{ $t('exp_prof_rate') }}
              </h2>
            </div>
            <div class="column is-6 has-text-centered">
              <h2 class="title is-1">{{ realProfitabilityRate }}</h2>
              <h2 class="subtitle is-5">
                {{ $t('real_prof_rate') }}
              </h2>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="container" v-cloak>
        <div class="columns">
          <div class="column is-12">
            <div class="level">
              <div class="level-left">
                <h2 class="title is-3">
                {{ $t('loans_header') }}
                </h2>
              </div>
              <div class="level-right">
                <button class="button is-success is-large" @click='showNewLoanForm'>
                  {{ $t('add_new_loan') }}
                </button>
              </div>
            </div>
          </div>
          <b-modal v-cloak :active.sync='newLoanFormOpened' :width='450'>
            <div class="card">
              <div class="card-content">
                <app-loan-form :locale='locale'>
                </app-loan-form>
              </div>
            </div>
          </b-modal>
        </div>
        <app-loans-table v-cloak :locale='locale' :loans-data='loansData'></app-loans-table>
      </div>
    </section>
  </main>
</template>

<script>
  import LoansTable from './LoansTable.vue'
  import LoanForm from './LoanForm.vue'
  
  export default {
    props: [ 'locale' ],
    data() {
      return {
        newLoanFormOpened: false,
        loansData: []
      }
    },
    beforeMount() {
      this.getLoansList();
      this.$i18n.locale = this.locale;
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
      }
    },
    components: {
      appLoansTable: LoansTable,
      appLoanForm: LoanForm
    },
    computed: {
      totalLendedSum() {
        return this.loansData.reduce((sum, loan) => {
          return loan.amount + sum;
        }, 0);
      },
      totalExpectedSum() {
        return this.loansData.reduce((sum, loan) => {
          return loan.expected_sum + sum;
        }, 0);
      },
      totalReceivedInterestsSum() {
        return this.loansData.reduce((sum, loan) => {
          return loan.received_interests_sum + sum;
        }, 0);
      },
      realProfitabilityRate() {
        return parseFloat((this.totalReceivedInterestsSum / this.totalLendedSum /
          6 * 12 *100) || 0).toFixed(2)  + '%';
      },
      expectedProfitabilityRate() {
        return parseFloat(((this.totalExpectedSum - this.totalLendedSum) /
          this.totalLendedSum /
          6 * 12 *100) || 0).toFixed(2)  + '%';
      }
    },
    methods: {
      getLoansList() {
        this.$http.get('/api/v1/loans').then(response => {
          this.loansData = response.body;
        }, response => {
          console.log(response);
        });
      },
      showNewLoanForm() {
        this.newLoanFormOpened = true;
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
