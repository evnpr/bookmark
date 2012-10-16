class SitesController < ApplicationController
  layout "site"

  # GET /sites
  # GET /sites.json
  def index
    p = Profile.where(:username=>session[:username]).first
    if(!p.nil?)
        @sites = Profile.mysite(p.id)
        if(p.id==1)
            @sites = Site.find(:all, :order => "created_at DESC")
        end
    else
        redirect_to '/' and return
    end
    @site = Site.new
    @profile_id = Profile.where(:username=>session[:username]).first.id
    @categories = p.categories.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new
    @profile_id = Profile.where(:username=>session[:username]).first.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @profile_id = Profile.where(:username=>session[:username]).first.id
    @site = Site.find(params[:id])
    @desc = Site.find(params[:id]).desc
    p = Profile.where(:username=>session[:username]).first
    @categories = p.categories.all
    render :layout => 'category'
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        if Category.exists?(:title => params[:category_id])
            c = Category.where(:title => params[:category_id]).first    
        else
            c = Category.new(:title => params[:category_id]) 
        end
        p = Profile.where(:username => session[:username]).first
        c.profile_id = p.id
        c.save
        @site.category_id = c.id
        @site.save
        redirect_to "/sites" and return
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        redirect_to "/sites" and return
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end


  def cat
    p = Profile.where(:username=>session[:username]).first
    if(!p.nil?)
        @sites = p.sites.where(:category_id => params[:id])
    else
        redirect_to '/' and return
    end
    @site = Site.new
    @profile_id = Profile.where(:username=>session[:username]).first.id
    @categories = p.categories.all

    render "index"

  end

  def clear
    c = Category.where(:title => '')
    c.delete
    c.save
  end

end

