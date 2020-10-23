FactoryBot.define do
  factory :model do
    name { Faker::Name.unique.name }
    manufacturer { nil }
    os_version { 'iOS 12' }
    year_of_manufacture { (1990..2020).to_a.sample }
  end
end
