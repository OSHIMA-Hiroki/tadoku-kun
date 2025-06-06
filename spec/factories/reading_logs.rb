FactoryBot.define do
  factory :reading_log do
    user { nil }
    book { nil }
    read_at { "2025-06-06 18:20:03" }
    notes { "MyText" }
  end
end
