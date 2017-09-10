class MeetTasksController < ApplicationController
  
  def index
    @meet_tasks = MeetTask.all

    render("meet_tasks/index.html.erb")
  end

  def show
    @meet_task = MeetTask.find(params[:id])

    render("meet_tasks/show.html.erb")
  end

  def new
    @meet_task = MeetTask.new

    render("meet_tasks/new.html.erb")
  end

  def create
    @meet_task = MeetTask.new

    @meet_task.belief_id = params[:belief_id]
    @meet_task.user_id = params[:user_id]
    @meet_task.target_people_id = params[:target_people_id]
    @meet_task.scheduled_datetime = params[:scheduled_datetime]
    @meet_task.completion_datetime = params[:completion_datetime]
    @meet_task.body = params[:body]
    @meet_task.complete = params[:complete]

    save_status = @meet_task.save

    if save_status == true
      redirect_to("/meet_tasks/#{@meet_task.id}", :notice => "Meet task created successfully.")
    else
      render("meet_tasks/new.html.erb")
    end
  end

  def edit
    @meet_task = MeetTask.find(params[:id])

    render("meet_tasks/edit.html.erb")
  end

  def update
    @meet_task = MeetTask.find(params[:id])

    @meet_task.belief_id = params[:belief_id]
    @meet_task.user_id = params[:user_id]
    @meet_task.target_people_id = params[:target_people_id]
    @meet_task.scheduled_datetime = params[:scheduled_datetime]
    @meet_task.completion_datetime = params[:completion_datetime]
    @meet_task.body = params[:body]
    @meet_task.complete = params[:complete]

    save_status = @meet_task.save

    if save_status == true
      redirect_to("/meet_tasks/#{@meet_task.id}", :notice => "Meet task updated successfully.")
    else
      render("meet_tasks/edit.html.erb")
    end
  end

  def destroy
    @meet_task = MeetTask.find(params[:id])

    @meet_task.destroy

    if URI(request.referer).path == "/meet_tasks/#{@meet_task.id}"
      redirect_to("/", :notice => "Meet task deleted.")
    else
      redirect_to(:back, :notice => "Meet task deleted.")
    end
  end
end
