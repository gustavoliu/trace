require 'csv'
puts "Importando diseases"
Disease.destroy_all


csv_text = File.read('CIAP2.csv')
csv = CSV.parse(csv_text, {col_sep: ';'})
csv.each do |row|
  d = Disease.new
  d.ciap_code = row[0]
  d.formal_name = row[1]
  d.pop_name = row[2]
  d.is_diagnosis = row[3]
  d.save
end

50.times do
  Patient.create({full_name: Faker::Name.name,
    sus_number: Faker::Number.number(5)})
end
