require 'csv'
Soap.destroy_all
Consult.destroy_all
PatientProblem.destroy_all
Disease.destroy_all
Patient.destroy_all
Professional.destroy_all
User.destroy_all

puts "Importando diseases"
csv_text = File.read('CIAP2.csv')
csv = CSV.parse(csv_text, {col_sep: ';'})
csv.each do |row|
  d = Disease.new
  d.ciap_code = row[0]
  d.formal_name = row[1]
  d.pop_name = row[2]
  d.is_diagnosis = row[3]
  d.save!
end

# 50.times do
#   Patient.create({full_name: Faker::Name.name,
#     sus_number: Faker::Number.number(5)})
# end
diagnoses = Disease.where(is_diagnosis: true)
complaints = Disease.all

puts "Importando pacientes"
csv_patient = CSV.parse(File.read('SEED.csv'), {col_sep: ';'})
csv_address = CSV.parse(File.read('seed_address.csv'))
csv_patient.each do |row|
  patient = Patient.new
  patient.full_name = row[0]
  patient.birthday = row[1].presence || rand(365 * 20..365 * 70).days.ago
  patient.gender = row[5]
  patient.sus_number = Faker::Number.number(5)
  patient.prontuario_number = Faker::Number.number(5)
  patient.address = csv_address.sample(1)[0][0]
  patient.save!


  puts 'Importando Patient Problems'
  rand(0..2).times do
    PatientProblem.create!(patient: patient, disease: diagnoses.sample)
  end
end

puts 'TERMINOU IMPORT DE PACIENTES'

user = User.create!(email: "admin@admin.com", password: "123456")
patients = Patient.all

puts "Importando consultas..."
100.times do
  consult = Consult.create!(
    patient: patients.sample,
    consult_date: rand(1..365).days.ago,
    professional: user.professional,
    )

  rand(1..2).times do
    Soap.create!(
      consult: consult,
      diagnosis: diagnoses.sample,
      complaint: complaints.sample,
      exams: Soap::EXAMS_OPTIONS.sample(rand(0..2)),
      referring: Soap::REFERRING_OPTIONS.sample(rand(0..2)),
      )
  end
end
