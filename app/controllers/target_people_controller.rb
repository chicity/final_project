class TargetPeopleController < ApplicationController
  def index
    @target_people = TargetPerson.all

    render("target_people/index.html.erb")
  end

  def show
    @target_person = TargetPerson.find(params[:id])

    render("target_people/show.html.erb")
  end

  def new
    @target_person = TargetPerson.new

    render("target_people/new.html.erb")
  end

  def create
    @target_person = TargetPerson.new

    @target_person.person_id = params[:person_id]
    @target_person.user_id = params[:user_id]
    @target_person.belief_id = params[:belief_id]
    @target_person.priority_order = params[:priority_order]
    @target_person.rationale = params[:rationale]

    save_status = @target_person.save

    if save_status == true
      redirect_to("/target_people/#{@target_person.id}", :notice => "Target person created successfully.")
    else
      render("target_people/new.html.erb")
    end
  end

  def edit
    @target_person = TargetPerson.find(params[:id])

    render("target_people/edit.html.erb")
  end

  def update
    @target_person = TargetPerson.find(params[:id])

    @target_person.person_id = params[:person_id]
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
    
    
    
    @next_step = "Email Tom Hardy about importance of stats analysis in R."
    @contact_info = "You can reach him at thehardiest@gmail.com"
  
    render("/next_step.html.erb")
  end # end of next_step
  
end #Class end
