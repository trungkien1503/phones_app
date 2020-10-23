FactoryBot.define do
  factory :manufacturer do
    name { %w[Apple Samsung Nokia Xiaomi VSmart].sample }
  end
end
