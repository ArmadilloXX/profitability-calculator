FactoryGirl.define do
  factory :payment do
    amount 191_666.67
    sequence(:payment_period) { |n| "Month #{n}" }
    overdue false
    association :loan, factory: :loan
  end
end
