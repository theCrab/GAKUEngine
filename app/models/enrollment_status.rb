class EnrollmentStatus < ActiveRecord::Base
	belongs_to :enrollment_status_type
	belongs_to :student

	audited :associated_with => :student
	
	attr_accessible :enrollment_status_type_id, :student_id
end