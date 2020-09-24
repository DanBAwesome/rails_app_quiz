class Job < ApplicationRecord
    validates :employer_name, :employer_description, :job_title, :job_description, :years_of_experience, :industry, :presence => true
end
