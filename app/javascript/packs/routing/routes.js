import Home from '../components/Home.vue';
import Loans from '../components/Loans.vue';
import Loan from '../components/Loan.vue';

export const routes = [
  { path: '/', component: Home },
  { path: '/dashboard', component: Loans },
  { path: '/loans/:id', component: Loan },
];
