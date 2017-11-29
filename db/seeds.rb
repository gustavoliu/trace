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
csv.first(1).each do |row|
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
csv_patient = File.read('SEED.csv')
csv = CSV.parse(csv_patient, {col_sep: ';'})
csv.each do |row|
  r = Patient.new
  r.full_name = row[0]
  r.birthday = row[1].presence || rand(365 * 20..365 * 70).days.ago
  r.sus_number = row[2]
  r.prontuario_number = row[3]
  r.gender = row[4]
  r.save!

  rand(0..2).times do
    PatientProblem.create!(patient: r, disease: diagnoses.sample)
  end
end

user = User.create!(email: "admin@admin.com", password: "123456")
patients = Patient.all

puts "Importando consultas..."
100.times do
  consult = Consult.create!(
    patient: patients.sample,
    consult_date: rand(1..120).days.ago,
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
