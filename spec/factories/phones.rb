FactoryBot.define do
  factory :phone do
    body_color { %w[pink yellow white black].sample }
    data_memory { [64, 128, 256].sample }
    model { nil }
    price { 1000 }
  end
end
