<i18n>
  en:
    table:
      borrower: 'Borrower'
      loan_plan: 'Loan Plan'
      amount: 'Amount'
      exp_sum: 'Expected Sum'
      rec_sum: 'Received Sum'
      prof_rate: 'Profitability Rate'
      details: 'Details'
  ru:
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
  <div class="container">
    <b-table
      :data="loansData"
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

          <b-table-column field="borrower" :label="$t('table.borrower')" sortable>
              {{ props.row.borrower }}
          </b-table-column>
          
          <b-table-column field="loan_plan" :label="$t('table.loan_plan')" sortable numeric>
              {{ props.row.loan_plan_id }}
          </b-table-column>

          <b-table-column field="amount" :label="$t('table.amount')" sortable numeric>
              {{ parseFloat(props.row.amount).toLocaleString(locale) }}
          </b-table-column>

          <b-table-column field="expected_sum" :label="$t('table.exp_sum')" sortable numeric>
              {{ parseFloat(props.row.expected_sum).toLocaleString(locale) }}
          </b-table-column>
          
          <b-table-column field="received_sum" :label="$t('table.rec_sum')" sortable numeric>
              {{ parseFloat(props.row.received_sum).toLocaleString(locale) }}
          </b-table-column>

          <b-table-column field="profitability_rate" :label="$t('table.prof_rate')" sortable numeric>
            {{ (props.row.current_profitability_rate *100).toFixed(2) + '%' }}
          </b-table-column>

          <b-table-column label=''>
            <router-link class='button is-small is-primary'
                         :to='linkToLoanDetails(props.row.id)'>
              {{ $t('table.details') }}
            </router-link>
          </b-table-column>
      </template>
    </b-table> 
  </div>
</template>

<script>
  export default {
    props: ['loansData', 'locale'],
    data() {
        return {
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
    beforeMount() {
      this.$i18n.locale = this.locale;
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
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


