class ReviewTasksController < ApplicationController
  def index
    @review_tasks = ReviewTask.all

    render("review_tasks/index.html.erb")
  end

  def show
    @review_task = ReviewTask.find(params[:id])

    render("review_tasks/show.html.erb")
  end

  def new
    @review_task = ReviewTask.new

    render("review_tasks/new.html.erb")
  end

  def create
    @review_task = ReviewTask.new

    @review_task.belief_id = params[:belief_id]
    @review_task.user_id = params[:user_id]
    @review_task.target_people_id = params[:target_people_id]
    @review_task.scheduled_datetime = params[:scheduled_datetime]
    @review_task.completion_datetime = params[:completion_datetime]
    @review_task.body = params[:body]
    @review_task.complete = params[:complete]

    save_status = @review_task.save

    if save_status == true
      redirect_to("/review_tasks/#{@review_task.id}", :notice => "Review task created successfully.")
    else
      render("review_tasks/new.html.erb")
    end
  end

  def edit
    @review_task = ReviewTask.find(params[:id])

    render("review_tasks/edit.html.erb")
  end

  def update
    @review_task = ReviewTask.find(params[:id])

    @review_task.belief_id = params[:belief_id]
    @review_task.user_id = params[:user_id]
    @review_task.target_people_id = params[:target_people_id]
    @review_task.scheduled_datetime = params[:scheduled_datetime]
    @review_task.completion_datetime = params[:completion_datetime]
    @review_task.body = params[:body]
    @review_task.complete = params[:complete]

    save_status = @review_task.save

    if save_status == true
      redirect_to("/review_tasks/#{@review_task.id}", :notice => "Review task updated successfully.")
    else
      render("review_tasks/edit.html.erb")
    end
  end

  def destroy
    @review_task = ReviewTask.find(params[:id])

    @review_task.destroy

    if URI(request.referer).path == "/review_tasks/#{@review_task.id}"
      redirect_to("/", :notice => "Review task deleted.")
    else
      redirect_to(:back, :notice => "Review task deleted.")
    end
  end
end
