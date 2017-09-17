class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! #requires a sign in before any action can be taken

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :avatar, :first_name, :last_name, :advisor_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:avatar, :advisor_id])
  end
  
  # below is attempt at defining all variables needed to render the next_step page
  def next_step
    
    
    
    @next_step = "Email Tom Hardy about importance of stats analysis in R"
  
    render("https://ide.c9.io/chicity/workdeq/next_step.html.erb")
  end # end of next_step

end
