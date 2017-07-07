<template>
  <div class="dashboard">
    <section class="hero is-small is-primary">
      <div class="hero-body">
        <div class="container has-text-centered">
          <div class="columns">
            <div class="column is-6 has-text-centered">
              <h2 class="title is-1">30%</h2>
              <h2 class="subtitle is-5">Expected profitability rate</h2>
            </div>
            <div class="column is-6 has-text-centered">
              <h2 class="title is-1">{{ realProfitabilityRate }}</h2>
              <h2 class="subtitle is-5">Real profitability rate</h2>
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
                <h2 class="title is-3">Loans</h2>
              </div>
              <div class="level-right">
                <button class="button is-success is-large" @click='showNewLoanForm'>Add new loan</button>
              </div>
            </div>
          </div>
          <b-modal v-cloak :active.sync='newLoanFormOpened' :width='450'>
            <div class="card">
              <div class="card-content">
                <app-loan-form>
                  <slot></slot>
                </app-loan-form>
              </div>
            </div>
          </b-modal>
        </div>
        <app-loans-table v-cloak :loans-data='loansData'></app-loans-table>
      </div>
    </section>
  </div>
</template>

<script>
  import LoansTable from './LoansTable.vue'
  import LoanForm from './LoanForm.vue'
  
  export default {
    data() {
      return {
        newLoanFormOpened: false,
        loansData: []
      }
    },
    beforeMount() {
      this.getLoansList();
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
      totalReceivedInterestsSum() {
        return this.loansData.reduce((sum, loan) => {
          return loan.received_interests_sum + sum;
        }, 0);
      },
      realProfitabilityRate() {
        return parseFloat(this.totalReceivedInterestsSum / this.totalLendedSum / 6 * 12 *100).toFixed(2) + '%';
      }
    },
    methods: {
      getLoansList() {
        this.$http.get('/loans').then(response => {
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
