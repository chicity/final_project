class PrepTasksController < ApplicationController
  def index
    @prep_tasks = PrepTask.all

    render("prep_tasks/index.html.erb")
  end

  def show
    @prep_task = PrepTask.find(params[:id])

    render("prep_tasks/show.html.erb")
  end

  def new
    @prep_task = PrepTask.new

    render("prep_tasks/new.html.erb")
  end

  def create
    @prep_task = PrepTask.new

    @prep_task.belief_id = params[:belief_id]
    @prep_task.user_id = params[:user_id]
    @prep_task.target_people_id = params[:target_people_id]
    @prep_task.scheduled_datetime = params[:scheduled_datetime]
    @prep_task.completion_datetime = params[:completion_datetime]
    @prep_task.body = params[:body]
    @prep_task.complete = params[:complete]

    save_status = @prep_task.save

    if save_status == true
      redirect_to("/prep_tasks/#{@prep_task.id}", :notice => "Prep task created successfully.")
    else
      render("prep_tasks/new.html.erb")
    end
  end

  def edit
    @prep_task = PrepTask.find(params[:id])

    render("prep_tasks/edit.html.erb")
  end

  def update
    @prep_task = PrepTask.find(params[:id])

    @prep_task.belief_id = params[:belief_id]
    @prep_task.user_id = params[:user_id]
    @prep_task.target_people_id = params[:target_people_id]
    @prep_task.scheduled_datetime = params[:scheduled_datetime]
    @prep_task.completion_datetime = params[:completion_datetime]
    @prep_task.body = params[:body]
    @prep_task.complete = params[:complete]

    save_status = @prep_task.save

    if save_status == true
      redirect_to("/prep_tasks/#{@prep_task.id}", :notice => "Prep task updated successfully.")
    else
      render("prep_tasks/edit.html.erb")
    end
  end

  def destroy
    @prep_task = PrepTask.find(params[:id])

    @prep_task.destroy

    if URI(request.referer).path == "/prep_tasks/#{@prep_task.id}"
      redirect_to("/", :notice => "Prep task deleted.")
    else
      redirect_to(:back, :notice => "Prep task deleted.")
    end
  end
end
