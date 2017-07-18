<i18n>
  en:
    add_new_loan: 'Add new loan'
    loan_placeholder: 'Enter loan amount'
    borrower_placeholder: 'Select borrower'
    plan_placeholder: 'Select loan plan'
    save_label: 'Save loan'
  ru:
    add_new_loan: 'Добавить новый займ'
    loan_placeholder: 'Введите выданную сумму'
    borrower_placeholder: 'Выберите заемщика'
    plan_placeholder: 'Выберите условия займа'
    save_label: 'Сохранить займ'
</i18n>
<template>
  <div class="new-loan-form">
    <h2 class="title is-3 has-text-centered">
      {{ $t('add_new_loan') }}
    </h2>
    <br>
    <b-field>
      <div v-if='errors' class="form-errors">
        <ul>
          <li v-for='error in errors'>
            {{ error }}
          </li>
        </ul>
      </div>
    </b-field>
    <form action="/loans" accept-charset='UTF-8' method='post'>
      <b-field>
        <b-input
            type="number"
            size='is-large'
            step="0.01"
            icon="rub"
            name="loan[amount]"
            v-model="loan.amount"
            :placeholder="$t('loan_placeholder')"
            required>
        </b-input>
      </b-field>
      <b-field>
        <b-select
            :placeholder="$t('borrower_placeholder')"
            icon="handshake-o"
            name="loan[borrower_id]"
            v-model="loan.borrower_id"
            icon-pack="fa"
            expanded
            required>
            <option disabled value="">
            {{ $t('borrower_placeholder') }}
            </option>
            <option v-for='borrower in borrowers' :value="borrower.id">
              {{ borrower.name }}
            </option>
        </b-select>
      </b-field>
      <b-field>
        <b-select
            :placeholder="$t('plan_placeholder')"
            icon="calculator"
            name="loan[loan_plan_id]"
            v-model="loan.loan_plan_id"
            icon-pack="fa"
            expanded
            required>
            <option disabled value="">
              {{ $t('plan_placeholder') }}
            </option>
            <option v-for='loanPlan in loanPlans' :value="loanPlan.id">
              {{ loanPlan.name }}
            </option>
        </b-select>
      </b-field>
      <br>
      <br>
      <b-field class="has-text-centered">
        <input type="submit"
              name='commit'
              :value="$t('save_label')"
              class='button is-large is-primary'
              @click.prevent='createNewLoan'>
      </b-field>
    </form>
  </div>
</template>

<script>
  export default {
    props: [ 'locale' ],
    data() {
      return {
        errors: undefined,
        loan: {},
        borrowers: [],
        loanPlans: [],
      }
    },
    beforeMount() {
      this.getBorrowers();
      this.getLoanPlans();
      this.$i18n.locale = this.locale;
    },
    watch: {
      locale (val) {
        this.$i18n.locale = val
      }
    },
    methods: {
      getBorrowers() {
        this.$http.get('/api/v1/borrowers').then(
          response => {
            this.borrowers = response.body;
          },
          response => {
          });
      },
      getLoanPlans() {
        this.$http.get('/api/v1/loan_plans').then(
          response => {
            this.loanPlans = response.body;
          },
          response => {
          });
      },
      createNewLoan() {
        this.$http.post(
          '/api/v1/loans', {
            loan: this.loan,
        }).then(
          response => {
            this.$emit('loanCreated');
          },
          response => {
            this.errors = response.body.message.split(': ')[1].split(', ');
          });
      },
    }
  }
</script>
