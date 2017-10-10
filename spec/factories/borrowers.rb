FactoryGirl.define do
  factory :borrower do
    sequence(:name) { |n| "Test Borrower #{n}" }
  end
end
