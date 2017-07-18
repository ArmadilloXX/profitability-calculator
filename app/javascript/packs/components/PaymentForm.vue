<i18n>
  en:
    add_new_payment: 'Add new payment'
    amount_placeholder: 'Enter payment amount'
    period_placeholder: 'Select payment period'
    overdue_label: 'Overdue?'
    save_label: 'Save payment'
    period_label: 'Month'
  ru:
    add_new_payment: 'Добавить новый платеж'
    amount_placeholder: 'Введите сумму платежа'
    period_placeholder: 'Выберите период платежа'
    overdue_label: 'Платеж просрочен?'
    save_label: 'Сохранить платеж'
    period_label: 'Месяц'
</i18n>
<template>
  <div class="new-payment-form">
    <h2 class="title is-3 has-text-centered">
      {{ $t('add_new_payment') }}
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
    <form accept-charset='utf-8'>
      <b-field>
        <b-input
            type="number"
            size='is-large'
            step="0.01"
            icon="rub"
            name="payment[amount]"
            v-model="payment.amount"
            :placeholder="$t('amount_placeholder')"
            required>
        </b-input>
      </b-field>
      <b-field>
        <b-select
            :placeholder="$t('period_placeholder')"
            icon="calendar-o"
            name="payment[payment_period]"
            v-model="payment.payment_period"
            icon-pack="fa"
            expanded
            required>
            <option disabled value="">
              {{ $t('period_placeholder') }}
            </option>
            <option v-for='period in upcomingPeriods' :value="period">
              {{ $t('period_label') }} {{ period }}
            </option>
        </b-select>
      </b-field>
      <br>
      <b-field>
        <div class="block has-text-centered">
          <b-switch
            v-model="payment.overdue"
            size='is-large'>
            <span>
              {{ $t('overdue_label') }}
            </span>
          </b-switch>
        </div>
      </b-field>
      <br>
      <br>
      <b-field class="has-text-centered">
        <input type="submit"
              name='commit'
              :value="$t('save_label')"
              class='button is-large is-primary'
              @click.prevent='createNewPayment'>
      </b-field>

    </form>
  </div>
</template>

<script>
  export default {
    props: [ 'loan', 'locale' ],
    data() {
      return {
        errors: undefined,
        payment: {
          overdue: false
        },
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
    computed: {
      upcomingPeriods() {
        return this.loan.upcoming_payment_periods;
      }
    },
    methods: {
      createNewPayment() {
        this.$http.post(
          `/api/v1/loans/${this.loan.id}/payments`,
            {
              payment: this.payment
            },
            {
              emulateJSON: true,
              responseType: 'json'
            }
          ).then(
          response =>{
            this.$emit('paymentCreated');
          },
          response =>{
            this.errors = response.body.message.split(': ')[1].split(', ');
          });
      }
    }
  }
</script>
