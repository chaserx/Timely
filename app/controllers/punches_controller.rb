class PunchesController < ApplicationController
  require 'chronic'
  
  # GET /punches
  # GET /punches.xml
  def index
    @punches = Punch.all

    respond_to do |format|
      format.html # index.html.erb
      format.mobile
      format.xml  { render :xml => @punches }
    end
  end

  # GET /punches/1
  # GET /punches/1.xml
  def show
    @punch = Punch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.mobile
      format.xml  { render :xml => @punch }
    end
  end

  # GET /punches/new
  # GET /punches/new.xml
  def new
    @punch = Punch.new
    @punch.timeIn = Time.zone.now() #.strftime("%R")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @punch }
    end
  end

  # GET /punches/1/edit
  def edit
    @punch = Punch.find(params[:id])
    respond_to do |format|
      format.html
      format.mobile
    end
  end

  # POST /punches
  # POST /punches.xml
  def create
    @punch = Punch.new(params[:punch])
    #@punch.timeIn = Chronic.parse(params[:punch])
    respond_to do |format|
      if @punch.save
        format.html
        format.mobile
        format.js
        format.xml  { render :xml => @punch, :status => :created, :location => @punch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @punch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /punches/1
  # PUT /punches/1.xml
  def update
    @punch = Punch.find(params[:id])

    respond_to do |format|
      if @punch.update_attributes(params[:punch])
        format.html { redirect_to(@punch, :notice => 'Punch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @punch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /punches/1
  # DELETE /punches/1.xml
  def destroy
    @punch = Punch.find(params[:id])
    @punch.destroy

    respond_to do |format|
      format.html { redirect_to(punches_url) }
      format.xml  { head :ok }
    end
  end

end
