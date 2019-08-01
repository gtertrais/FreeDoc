require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableSpecialtyDoctor.destroy_all
City.destroy_all

#create specialties
specialty1 = Specialty.create(name: "generaliste")
specialty2 = Specialty.create(name: "urologue")
specialty3 = Specialty.create(name: "kinesitherapeute")
specialty4 = Specialty.create(name: "occuliste")
specialty5 = Specialty.create(name: "chirurgien")
specialty6 = Specialty.create(name: "medium")
specialty7 = Specialty.create(name: "astrologue")
specialty8 = Specialty.create(name: "gitan")
specialty9 = Specialty.create(name: "alterophile")
specialty10 = Specialty.create(name: "viking")
puts "10 specialties created"

#create cities
city1 = City.create(name: 'Caen')
city2 = City.create(name: 'Angers')
city3 = City.create(name: 'Paris')
city4 = City.create(name: 'Marseilles')
puts "4 cities created"

#create all the values in the table
100.times do
  doctor = Doctor.create(first_name: "DR.#{Faker::Name.first_name}", last_name: Faker::Name.last_name, zip_code: rand(10000..80000))#create Doctor
  doctor.city = [city1, city2, city3, city4].sample #add city to doctor
  doctor.save
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)#create patient
  patient.city = [city1, city2, city3, city4].sample#add city to patient
  patient.save
  appointment = Appointment.create(doctor: doctor, patient: patient)#create appointment
  appointment.city = [city1, city2, city3, city4].sample#add city to appointment
  appointment.save
  #add 2 specialty per doctor
  join_table_specialty_doctor =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty1, specialty2, specialty3, specialty4, specialty5].sample)
  join_table_specialty_doctor2 =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialty6, specialty7, specialty8, specialty9, specialty10].sample)
end

puts "All values has been created (100 doctors, 100 patients, 100 appointments)!"

