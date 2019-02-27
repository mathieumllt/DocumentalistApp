class StudentWorksession < ApplicationRecord
  belongs_to :student
  belongs_to :worksession 
end
