class TargetPeopleController < ApplicationController
  def index
    @target_people = TargetPerson.all

    render("target_people/index.html.erb")
  end

  def show
    @target_person = TargetPerson.find(params[:id])

    @belief = @target_person.belief_id

    render("target_people/show.html.erb")
  end

  def new
    @target_person = TargetPerson.new

    render("target_people/new.html.erb")
  end

  def create
    @target_person = TargetPerson.new

    # @target_person.person_id = params[:person_id]
    @target_person.first_name = params[:first_name]
    @target_person.last_name = params[:last_name]
    @target_person.linkedin_url = params[:linkedin_url]
    @target_person.email = params[:email]
    @target_person.org_name = params[:org_name]
    @target_person.user_id = params[:user_id]
    @target_person.belief_id = params[:belief_id]
    @target_person.priority_order = params[:priority_order]
    @target_person.rationale = params[:rationale]

    save_status = @target_person.save

    if save_status == true
      redirect_to("/target_people/#{@target_person.id}", :notice => "New Target person created successfully.")
    else
      render("target_people/new.html.erb")
    end
  end

  def edit
    @target_person = TargetPerson.find(params[:id])
    
    # attempted below to render belief.body on Tar_people EDIT = fail due to fixnum error on 2 (it was taking belief.id as number with no method)
    # @b = @target_person.belief_id
    # @b
    
    # attempted below to create instance variable to render targ_org name on Tar_people EDIT = fail
    # @belief = Belief.find_by({ :id => @target_person.belief_id })
    # @target_organization = @belief.target_organization_id

    
    render("target_people/edit.html.erb")
  end

  def update
    @target_person = TargetPerson.find(params[:id])

    @target_person.first_name = params[:first_name]
    @target_person.last_name = params[:last_name]
    @target_person.linkedin_url = params[:linkedin_url]
    @target_person.email = params[:email]
    @target_person.org_name = params[:org_name]
    @target_person.user_id = params[:user_id]
    @target_person.belief_id = params[:belief_id]
    @target_person.priority_order = params[:priority_order]
    @target_person.rationale = params[:rationale]

    save_status = @target_person.save

    if save_status == true
      redirect_to("/target_people/#{@target_person.id}", :notice => "Target person updated successfully.")
    else
      render("target_people/edit.html.erb")
    end
  end

  def destroy
    @target_person = TargetPerson.find(params[:id])

    @target_person.destroy

    if URI(request.referer).path == "/target_people/#{@target_person.id}"
      redirect_to("/", :notice => "Target person deleted.")
    else
      redirect_to(:back, :notice => "Target person deleted.")
    end
  end
  
  # below is attempt at defining all variables needed to render the next_step page
  def next_step
    
    
    
    @next_step = "(Email) (Tom Hardy) to confirm the importance of (stats analysis in R)."
    @contact_info = "You can reach him at (thehardiest@gmail.com)"
  
    render("/next_step.html.erb")
  end # end of next_step
  
end #Class end
