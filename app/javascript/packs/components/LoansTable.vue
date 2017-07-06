<template>
  <div class="container">
    <b-table
      :data="tableData"
      :bordered="isBordered"
      :striped="isStriped"
      :narrowed="isNarrowed"
      :checkable="isCheckable"
      :loading="isLoading"
      :mobile-cards="hasMobileCards"
      :paginated="isPaginated"
      :per-page="perPage"
      :pagination-simple="isPaginationSimple"
      default-sort="id"
      :selected.sync="selected"
      :checked-rows.sync="checkedRows">

      <template scope="props">
          <b-table-column field="id" label="ID" width="40" sortable numeric>
              {{ props.row.id }}
          </b-table-column>

          <b-table-column field="loan_plan" label="Loan Plan" sortable>
              {{ props.row.loan_plan}}
          </b-table-column>

          <b-table-column field="borrower" label="Borrower" sortable>
              {{ props.row.borrower }}
          </b-table-column>

          <b-table-column field="amount" label="Amount" sortable numeric>
              {{ props.row.amount}}
          </b-table-column>

          <b-table-column label="Details">
            <a class="button is-small is-primary" :href="linkToLoanDetails(props.row.id)">Loan details</a>
          </b-table-column>
      </template>
    </b-table> 
  </div>
</template>

<script>
  export default {
    data() {
        return {
            tableData: [
              { id: 1, amount: 1000000.0, borrower: 'Test Borrower 1', loan_plan: 'Basic 6/30%/50%' },
              { id: 2, amount: 900000.0, borrower: 'Test Borrower 2', loan_plan: 'Basic 6/30%/50%' },
              { id: 3, amount: 800000.0, borrower: 'Test Borrower 3', loan_plan: 'Basic 6/30%/50%' }
            ],
            checkedRows: [],
            selected: {},
            isBordered: false,
            isStriped: true,
            isNarrowed: false,
            isCheckable: false,
            isLoading: false,
            hasMobileCards: true,
            isPaginated: false,
            isPaginationSimple: false,
            perPage: 10
        }
    },
    methods: {
      linkToLoanDetails(id) {
        return `/loans/${id}`;
      },
        clearSelected() {
            this.selected = {}
        },
        clearCheckedRows() {
            this.checkedRows = []
        }
    },
}
</script>


