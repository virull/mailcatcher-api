FactoryGirl.define do
  factory :email_index, class: Hash do
    id
    initialize_with { attributes.stringify_keys }
  end
end
