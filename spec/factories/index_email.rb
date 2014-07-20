FactoryGirl.define do
  sequence(:id) { |n| n }

  factory :email_index, class: Hash do
    id

    initialize_with { attributes.stringify_keys }
  end
end
