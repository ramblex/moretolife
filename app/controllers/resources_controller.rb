class ResourcesController < ApplicationController
  before_filter :authorise, :except => [:index, :show]

  def index
    # Show list of uploaded resources
    @resources = Resource.all(:order => "position")

    respond_to do |format|
      format.html
      format.xml { render :xml => @resources }
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @resources = Resource.without_current(@resource)
  end

  def new
    @resource = Resource.new
    12.times { @resource.resource_files.build }
    3.times { @resource.event_links.build }
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

  def sort
    params[:resources].each_with_index do |id, index|
      Resource.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
