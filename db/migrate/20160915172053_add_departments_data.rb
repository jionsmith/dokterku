class AddDepartmentsData < ActiveRecord::Migration
  Department.create(:name => 'Ophthalmology')
  Department.create(:name => 'Dermatology')
  Department.create(:name => 'Pediatrics')
  Department.create(:name => 'Brain')
  Department.create(:name => 'Cardiology')
  Department.create(:name => 'Neurology')
  Department.create(:name => 'Oncology')
  Department.create(:name => 'Gynaecology')
  Department.create(:name => 'Urology')
  Department.create(:name => 'Surgery')
  Department.create(:name => 'Radiology')
  Department.create(:name => 'Rheumatology')
  Department.create(:name => 'Plastic surgery')
  Department.create(:name => 'Otolaryngology')
  Department.create(:name => 'Surgery')
  Department.create(:name => 'Neurosurgery')
  Department.create(:name => 'Laboratories')
  Department.create(:name => 'Hepatology')
  Department.create(:name => 'Anesthesiology')

end
