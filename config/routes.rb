Rails.application.routes.draw do
  
  root 'organizations#index'
  
  # Routes for the next_step VIEW:
  # READ
  # get "/next_step", :controller => "application", :action => "next_step"

  # Routes for the Review_task resource:
  # CREATE
  get "/review_tasks/new", :controller => "review_tasks", :action => "new"
  post "/create_review_task", :controller => "review_tasks", :action => "create"

  # READ
  get "/review_tasks", :controller => "review_tasks", :action => "index"
  get "/review_tasks/:id", :controller => "review_tasks", :action => "show"

  # UPDATE
  get "/review_tasks/:id/edit", :controller => "review_tasks", :action => "edit"
  post "/update_review_task/:id", :controller => "review_tasks", :action => "update"

  # DELETE
  get "/delete_review_task/:id", :controller => "review_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Meet_task resource:
  # CREATE
  get "/meet_tasks/new", :controller => "meet_tasks", :action => "new"
  post "/create_meet_task", :controller => "meet_tasks", :action => "create"

  # READ
  get "/meet_tasks", :controller => "meet_tasks", :action => "index"
  get "/meet_tasks/:id", :controller => "meet_tasks", :action => "show"

  # UPDATE
  get "/meet_tasks/:id/edit", :controller => "meet_tasks", :action => "edit"
  post "/update_meet_task/:id", :controller => "meet_tasks", :action => "update"

  # DELETE
  get "/delete_meet_task/:id", :controller => "meet_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Prep_task resource:
  # CREATE
  get "/prep_tasks/new", :controller => "prep_tasks", :action => "new"
  post "/create_prep_task", :controller => "prep_tasks", :action => "create"

  # READ
  get "/prep_tasks", :controller => "prep_tasks", :action => "index"
  get "/prep_tasks/:id", :controller => "prep_tasks", :action => "show"

  # UPDATE
  get "/prep_tasks/:id/edit", :controller => "prep_tasks", :action => "edit"
  post "/update_prep_task/:id", :controller => "prep_tasks", :action => "update"

  # DELETE
  get "/delete_prep_task/:id", :controller => "prep_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Schedule_task resource:
  # CREATE
  get "/schedule_tasks/new", :controller => "schedule_tasks", :action => "new"
  post "/create_schedule_task", :controller => "schedule_tasks", :action => "create"

  # READ
  get "/schedule_tasks", :controller => "schedule_tasks", :action => "index"
  get "/schedule_tasks/:id", :controller => "schedule_tasks", :action => "show"

  # UPDATE
  get "/schedule_tasks/:id/edit", :controller => "schedule_tasks", :action => "edit"
  post "/update_schedule_task/:id", :controller => "schedule_tasks", :action => "update"

  # DELETE
  get "/delete_schedule_task/:id", :controller => "schedule_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Contact_task resource:
  # CREATE
  get "/contact_tasks/new", :controller => "contact_tasks", :action => "new"
  post "/create_contact_task", :controller => "contact_tasks", :action => "create"

  # READ
  get "/contact_tasks", :controller => "contact_tasks", :action => "index"
  get "/contact_tasks/:id", :controller => "contact_tasks", :action => "show"

  # UPDATE
  get "/contact_tasks/:id/edit", :controller => "contact_tasks", :action => "edit"
  post "/update_contact_task/:id", :controller => "contact_tasks", :action => "update"

  # DELETE
  get "/delete_contact_task/:id", :controller => "contact_tasks", :action => "destroy"
  #------------------------------

  # Routes for the Target_person resource:
  # CREATE
  get "/target_people/new", :controller => "target_people", :action => "new"
  post "/create_target_person", :controller => "target_people", :action => "create"

  # READ
  get "/target_people", :controller => "target_people", :action => "index"
  get "/target_people/:id", :controller => "target_people", :action => "show"
  get "/next_step", :controller => "target_people", :action => "next_step"


  # UPDATE
  get "/target_people/:id/edit", :controller => "target_people", :action => "edit"
  post "/update_target_person/:id", :controller => "target_people", :action => "update"

  # DELETE
  get "/delete_target_person/:id", :controller => "target_people", :action => "destroy"
  #------------------------------

  # Routes for the Person resource:
  # CREATE
  get "/people/new", :controller => "people", :action => "new"
  post "/create_person", :controller => "people", :action => "create"

  # READ
  get "/people", :controller => "people", :action => "index"
  get "/people/:id", :controller => "people", :action => "show"

  # UPDATE
  get "/people/:id/edit", :controller => "people", :action => "edit"
  post "/update_person/:id", :controller => "people", :action => "update"

  # DELETE
  get "/delete_person/:id", :controller => "people", :action => "destroy"
  #------------------------------

  # Routes for the Belief resource:
  # CREATE
  get "/beliefs/new", :controller => "beliefs", :action => "new"
  post "/create_belief", :controller => "beliefs", :action => "create"

  # READ
  get "/beliefs", :controller => "beliefs", :action => "index"
  get "/beliefs/:id", :controller => "beliefs", :action => "show"

  # UPDATE
  get "/beliefs/:id/edit", :controller => "beliefs", :action => "edit"
  post "/update_belief/:id", :controller => "beliefs", :action => "update"

  # DELETE
  get "/delete_belief/:id", :controller => "beliefs", :action => "destroy"
  #------------------------------

  # Routes for the Organization resource:
  # CREATE
  get "/organizations/new", :controller => "organizations", :action => "new"
  post "/create_organization", :controller => "organizations", :action => "create"

  # READ
  get "/organizations", :controller => "organizations", :action => "index"
  get "/organizations/:id", :controller => "organizations", :action => "show"

  # UPDATE
  get "/organizations/:id/edit", :controller => "organizations", :action => "edit"
  post "/update_organization/:id", :controller => "organizations", :action => "update"

  # DELETE
  get "/delete_organization/:id", :controller => "organizations", :action => "destroy"
  #------------------------------

  # Routes for the Target_organization resource:
  # CREATE
  get "/target_organizations/new", :controller => "target_organizations", :action => "new"
  post "/create_target_organization", :controller => "target_organizations", :action => "create"

  # READ
  get "/target_organizations", :controller => "target_organizations", :action => "index"
  get "/target_organizations/:id", :controller => "target_organizations", :action => "show"

  # UPDATE
  get "/target_organizations/:id/edit", :controller => "target_organizations", :action => "edit"
  post "/update_target_organization/:id", :controller => "target_organizations", :action => "update"

  # DELETE
  get "/delete_target_organization/:id", :controller => "target_organizations", :action => "destroy"
  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
