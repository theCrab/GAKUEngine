require 'spec_helper'

describe Gaku::School do
	context "validations" do
		it_behaves_like 'avatarable'
		it { should have_many :levels }
		it { should have_many :campuses }
		it { should have_many :simple_grades }
		it { should have_many :programs }


		it { should have_one(:master_campus) }

		it { should validate_presence_of :name }

		it { should allow_mass_assignment_of :name }
		it { should allow_mass_assignment_of :is_primary }
		it { should allow_mass_assignment_of :slogan }
		it { should allow_mass_assignment_of :description }
		it { should allow_mass_assignment_of :founded }
		it { should allow_mass_assignment_of :principal }
		it { should allow_mass_assignment_of :vice_principal }
		it { should allow_mass_assignment_of :grades }

	end
end
