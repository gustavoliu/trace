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

# 50.times do
#   Patient.create({full_name: Faker::Name.name,
#     sus_number: Faker::Number.number(5)})
# end

puts "Importando pacientes"
Patient.destroy_all

csv_patient = File.read('SEED.csv')
csv = CSV.parse(csv_patient, {col_sep: ';'})
csv.each do |row|
  r = Patient.new
  r.full_name = row[0]
  r.birthday = row[1]
  r.sus_number = row[2]
  r.prontuario_number = row[3]
  r.gender = row[4]
  r.save
end
