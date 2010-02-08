class ResourcesController < ApplicationController
  before_filter :authorise, :except => [:index]

  def index
    # Show list of uploaded resources
    @resources = Resource.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @resources }
    end
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(params[:resource])
    respond_to do |format|
      if @resource.save
        flash[:notice] = 'Resource successfully added.'
        format.html { redirect_to(resources_url) }
        format.xml { render :xml => @resource, :status => :created, :location => resources_url}
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    flash[:notice] = 'Resource was deleted.'
    respond_to do |format|
      format.html { redirect_to(resources_url) }
      format.xml { head :ok }
    end
  end
end
