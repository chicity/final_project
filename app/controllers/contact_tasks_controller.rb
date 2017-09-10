class ContactTasksController < ApplicationController
  
  def index
    @contact_tasks = ContactTask.all

    render("contact_tasks/index.html.erb")
  end

  def show
    @contact_task = ContactTask.find(params[:id])

    render("contact_tasks/show.html.erb")
  end

  def new
    @contact_task = ContactTask.new

    render("contact_tasks/new.html.erb")
  end

  def create
    @contact_task = ContactTask.new

    @contact_task.belief_id = params[:belief_id]
    @contact_task.user_id = params[:user_id]
    @contact_task.target_people_id = params[:target_people_id]
    @contact_task.scheduled_datetime = params[:scheduled_datetime]
    @contact_task.completion_datetime = params[:completion_datetime]
    @contact_task.body = params[:body]
    @contact_task.complete = params[:complete]

    save_status = @contact_task.save

    if save_status == true
      redirect_to("/contact_tasks/#{@contact_task.id}", :notice => "Contact task created successfully.")
    else
      render("contact_tasks/new.html.erb")
    end
  end

  def edit
    @contact_task = ContactTask.find(params[:id])

    render("contact_tasks/edit.html.erb")
  end

  def update
    @contact_task = ContactTask.find(params[:id])

    @contact_task.belief_id = params[:belief_id]
    @contact_task.user_id = params[:user_id]
    @contact_task.target_people_id = params[:target_people_id]
    @contact_task.scheduled_datetime = params[:scheduled_datetime]
    @contact_task.completion_datetime = params[:completion_datetime]
    @contact_task.body = params[:body]
    @contact_task.complete = params[:complete]

    save_status = @contact_task.save

    if save_status == true
      redirect_to("/contact_tasks/#{@contact_task.id}", :notice => "Contact task updated successfully.")
    else
      render("contact_tasks/edit.html.erb")
    end
  end

  def destroy
    @contact_task = ContactTask.find(params[:id])

    @contact_task.destroy

    if URI(request.referer).path == "/contact_tasks/#{@contact_task.id}"
      redirect_to("/", :notice => "Contact task deleted.")
    else
      redirect_to(:back, :notice => "Contact task deleted.")
    end
  end
end
