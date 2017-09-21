class TargetOrganizationsController < ApplicationController
  def index
    @target_organizations = TargetOrganization.all

    render("target_organizations/index.html.erb")
  end

  def show
    @target_organization = TargetOrganization.find(params[:id])

    render("target_organizations/show.html.erb")
  end

  def new
    @target_organization = TargetOrganization.new

    render("target_organizations/new.html.erb")
  end

  def create
    @target_organization = TargetOrganization.new

    @target_organization.user_id = params[:user_id]
    @target_organization.org_name = params[:org_name]
    @target_organization.org_url = params[:org_url]
    @target_organization.position = params[:position]
    # @target_organization.priority_order = params[:priority_order]

    save_status = @target_organization.save

    if save_status == true
      redirect_to("/target_organizations/#{@target_organization.id}", :notice => "Target organization created successfully.")
    else
      render("target_organizations/new.html.erb")
    end
  end

  def edit
    @target_organization = TargetOrganization.find(params[:id])


    @target_organization.user_id = params[:user_id]
    @target_organization.org_id = params[:org_id]
    
    render("target_organizations/edit.html.erb")
  end

  def update
    @target_organization = TargetOrganization.find(params[:id])

    @target_organization.user_id = params[:user_id]
    @target_organization.org_id = params[:org_id]
    @target_organization.priority_order = params[:priority_order]

    save_status = @target_organization.save

    if save_status == true
      redirect_to("/target_organizations/#{@target_organization.id}", :notice => "Target organization updated successfully.")
    else
      render("target_organizations/edit.html.erb")
    end
  end

  def destroy
    @target_organization = TargetOrganization.find(params[:id])

    @target_organization.destroy

    if URI(request.referer).path == "/target_organizations/#{@target_organization.id}"
      redirect_to("/", :notice => "Target organization deleted.")
    else
      redirect_to(:back, :notice => "Target organization deleted.")
    end
  end
end
