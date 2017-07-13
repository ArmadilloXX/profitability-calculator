FactoryGirl.define do
  factory :loan do
    amount 1_000_000.00
    association :borrower, factory: :borrower
    association :loan_plan, factory: :loan_plan
  end
end
