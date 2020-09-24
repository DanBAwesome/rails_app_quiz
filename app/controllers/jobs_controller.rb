class JobsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def all_jobs
        @jobs = Job.all

        render 'jobs/jobs.html.erb'
    end

    def find_job
        @job = Job.find_by(id: params[:id])

        render 'jobs/job.html.erb'
    end

    def create_job
        begin
            @job = Job.create!(job_params)

            if @job.save
                render plain: "Job Successfully created"
            else
                render json: "An Exception Has Occurred"
            end
        rescue ActiveRecord::RecordInvalid => err
            render plain: err
        end   
    end

    private

    def job_params
        params.permit(:url, :employer_name,:employer_description, :job_title, 
                      :job_description, :years_of_experience, :education_requirement, 
                      :industry, :base_salary)
    end
end
