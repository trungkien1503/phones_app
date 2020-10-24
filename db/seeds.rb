manufacturers = %w[Apple Samsung Nokia Vin]
manufacturers.each do |manu|
  Manufacturer.find_or_create_by(name: manu)
end

manufacturer = Manufacturer.find_by(name: 'Apple')
models = [
  {
    name: 'iPhone X',
    manufacturer: manufacturer,
    os_version: 'iOS 9',
    year_of_manufacture: 2018,
  },
  {
    name: 'iPhone 11',
    manufacturer: manufacturer,
    os_version: 'iOS 12',
    year_of_manufacture: 2019,
  },
  {
    name: 'iPhone 12',
    manufacturer: manufacturer,
    os_version: 'iOS 12',
    year_of_manufacture: 2020,
  },
]
models.each do |model|
  Model.create(model)
end

10.times do
  Phone.create(
    body_color: %w[pink yellow white black].sample,
    data_memory: [64, 128, 256].sample,
    model: Model.take,
    price: [699, 799, 899, 999].sample,
  )
end
