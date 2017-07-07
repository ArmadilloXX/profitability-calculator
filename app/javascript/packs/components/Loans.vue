<template>
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
    <app-loans-table v-cloak></app-loans-table>
  </div>
</template>

<script>
  import LoansTable from './LoansTable.vue'
  import LoanForm from './LoanForm.vue'
  
  export default {
    data() {
      return {
        newLoanFormOpened: false
      }
    },
    components: {
      appLoansTable: LoansTable,
      appLoanForm: LoanForm
    },
    methods: {
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
