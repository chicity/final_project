class BeliefsController < ApplicationController
  def index
    @beliefs = Belief.all

    render("beliefs/index.html.erb")
  end

  def show
    @belief = Belief.find(params[:id])

    render("beliefs/show.html.erb")
  end

  def new
    @belief = Belief.new

    render("beliefs/new.html.erb")
  end

  def create
    @belief = Belief.new

    @belief.user_id = params[:user_id]
    @belief.org_id = params[:org_id]
    @belief.body = params[:body]
    @belief.priority_order = params[:priority_order]
    @belief.confirmed_status = params[:confirmed_status]

    save_status = @belief.save

    if save_status == true
      redirect_to("/beliefs/#{@belief.id}", :notice => "Belief created successfully.")
    else
      render("beliefs/new.html.erb")
    end
  end

  def edit
    @belief = Belief.find(params[:id])

    render("beliefs/edit.html.erb")
  end

  def update
    @belief = Belief.find(params[:id])

    @belief.user_id = params[:user_id]
    @belief.org_id = params[:org_id]
    @belief.body = params[:body]
    @belief.priority_order = params[:priority_order]
    @belief.confirmed_status = params[:confirmed_status]

    save_status = @belief.save

    if save_status == true
      redirect_to("/beliefs/#{@belief.id}", :notice => "Belief updated successfully.")
    else
      render("beliefs/edit.html.erb")
    end
  end

  def destroy
    @belief = Belief.find(params[:id])

    @belief.destroy

    if URI(request.referer).path == "/beliefs/#{@belief.id}"
      redirect_to("/", :notice => "Belief deleted.")
    else
      redirect_to(:back, :notice => "Belief deleted.")
    end
  end
end
