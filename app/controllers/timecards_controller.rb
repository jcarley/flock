class TimecardsController < ApplicationController

  before_filter :authenticate_user!

  # GET /timecards
  # GET /timecards.xml
  def index
    @timecards = current_user.timecards.paginate(:page => params[:page], :per_page => 15)
  end

  # GET /timecards/1
  # GET /timecards/1.xml
  def show
    @timecard = Timecard.find(params[:id])
  end

  # GET /timecards/new
  # GET /timecards/new.xml
  def new
    @timecard = Timecard.new
  end

  # GET /timecards/1/edit
  def edit
    @timecard = Timecard.find(params[:id])
  end

  # POST /timecards
  # POST /timecards.xml
  def create
    @timecard = current_user.timecards.build(params[:timecard])

    if @timecard.save
      redirect_to timecards_path, :notice => 'Timecard was successfully created.' 
    else
      render :action => "new"
    end

  end

  # PUT /timecards/1
  # PUT /timecards/1.xml
  def update
    @timecard = Timecard.find(params[:id])

    if @timecard.update_attributes(params[:timecard])
      redirect_to timecards_path, :notice => 'Timecard was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /timecards/1
  # DELETE /timecards/1.xml
  def destroy
    @timecard = Timecard.find(params[:id])
    @timecard.destroy

    redirect_to(timecards_url)
  end

end
