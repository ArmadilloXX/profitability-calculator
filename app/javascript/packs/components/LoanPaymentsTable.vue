<template>
  <div class="container">
    <b-table
      ref="table"
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
      default-sort="['payment_period', 'asc']"
      :selected.sync="selected"
      :checked-rows.sync="checkedRows">

      <template scope="props">
        <b-table-column field="id" label="ID" width="40" sortable numeric>
            {{ props.row.id }}
        </b-table-column>

        <b-table-column field="payment_period" label="Period" sortable>
          {{ 'Month ' + props.row.payment_period }}
        </b-table-column>

        <b-table-column field="overdue" label="Overdued?" sortable numeric>
          <span class="tag"
                :class="{ 'is-success': !props.row.overdue,
                          'is-danger': props.row.overdue }">
            {{ props.row.overdue ? 'Overdued' : 'Normal'}}
          </span>
        </b-table-column>

        <b-table-column field="amount" label="Amount" sortable numeric>
            {{ props.row.amount}}
        </b-table-column>
      </template>
    </b-table> 
  </div>
</template>

<script>
  export default {
    props: [ 'loanId' ],
    beforeMount() {
      this.getPaymentsList();
    },
    data() {
        return {
            paymentsData: [],
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
      getPaymentsList() {
        this.$http.get(`/api/v1/loans/${this.loanId}/payments`).then(response => {
          let sorted = response.body.sort((el) => { return el.payment_period });
          this.paymentsData = sorted;
        }, response => {
          console.log(response);
        });
      },
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
