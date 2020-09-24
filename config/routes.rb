Rails.application.routes.draw do
  get '/jobs' => 'jobs#all_jobs'
  get '/jobs/:id' => 'jobs#find_job'

  post '/jobs' => 'jobs#create_job'
end
