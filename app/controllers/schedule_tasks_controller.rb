class ScheduleTasksController < ApplicationController
  def index
    @schedule_tasks = ScheduleTask.all

    render("schedule_tasks/index.html.erb")
  end

  def show
    @schedule_task = ScheduleTask.find(params[:id])

    render("schedule_tasks/show.html.erb")
  end

  def new
    @schedule_task = ScheduleTask.new

    render("schedule_tasks/new.html.erb")
  end

  def create
    @schedule_task = ScheduleTask.new

    @schedule_task.belief_id = params[:belief_id]
    @schedule_task.user_id = params[:user_id]
    @schedule_task.target_people_id = params[:target_people_id]
    @schedule_task.scheduled_datetime = params[:scheduled_datetime]
    @schedule_task.completion_datetime = params[:completion_datetime]
    @schedule_task.body = params[:body]
    @schedule_task.complete = params[:complete]

    save_status = @schedule_task.save

    if save_status == true
      redirect_to("/schedule_tasks/#{@schedule_task.id}", :notice => "Schedule task created successfully.")
    else
      render("schedule_tasks/new.html.erb")
    end
  end

  def edit
    @schedule_task = ScheduleTask.find(params[:id])

    render("schedule_tasks/edit.html.erb")
  end

  def update
    @schedule_task = ScheduleTask.find(params[:id])

    @schedule_task.belief_id = params[:belief_id]
    @schedule_task.user_id = params[:user_id]
    @schedule_task.target_people_id = params[:target_people_id]
    @schedule_task.scheduled_datetime = params[:scheduled_datetime]
    @schedule_task.completion_datetime = params[:completion_datetime]
    @schedule_task.body = params[:body]
    @schedule_task.complete = params[:complete]

    save_status = @schedule_task.save

    if save_status == true
      redirect_to("/schedule_tasks/#{@schedule_task.id}", :notice => "Schedule task updated successfully.")
    else
      render("schedule_tasks/edit.html.erb")
    end
  end

  def destroy
    @schedule_task = ScheduleTask.find(params[:id])

    @schedule_task.destroy

    if URI(request.referer).path == "/schedule_tasks/#{@schedule_task.id}"
      redirect_to("/", :notice => "Schedule task deleted.")
    else
      redirect_to(:back, :notice => "Schedule task deleted.")
    end
  end
end
