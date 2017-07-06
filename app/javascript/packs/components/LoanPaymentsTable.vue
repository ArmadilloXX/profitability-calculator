<template>
  <div class="container">
    <b-table
      :data="paymentsData"
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

          <b-table-column field="period" label="Period" sortable>
          </b-table-column>

          <b-table-column field="amount" label="Amount" sortable numeric>
              {{ props.row.amount}}
          </b-table-column>

          <b-table-column label="Details">
            <a class="button is-small is-primary" :href="linkToPaymentDetails(props.row.id)">Payment details</a>
          </b-table-column>
      </template>
    </b-table> 
  </div>
</template>

<script>
  export default {
    props: [ 'loanId' ],
    data() {
        return {
            paymentsData: [
              { id: 1, amount: 191666.67 },
              { id: 2, amount: 191666.67 },
              { id: 3, amount: 191666.67 },
              { id: 4, amount: 191666.67 },
              { id: 5, amount: 191666.67 },
              { id: 5, amount: 191666.67 },
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
      linkToPaymentDetails(id) {
        return `/loans/${this.loanId}/payments/${id}`;
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
