class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :join, :leave]


  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html #{ redirect_to @event, notice: 'event was successfully created.' }
        format.json #{ render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventes/1
  # DELETE /eventes/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ####### JOINING AND LEAVING A event #########

  def join
    @user = current_user
    @event = Event.find(params[:id])
    @event_id = @event.id
    @user.update_attributes(:event_id => @event_id)
    #redirect_to @event
  end

  def leave
    @event = Event.find(event_params)
    current_user.update_attributes(:event_id, nil)
    #redirect_to @event
  end


private

  def set_event
    @event = Event.find(params[:id])
  end


  def events_params
    params.require(:event).permit(:event_id, :start_time, :finish_time, :bookin_time_start, :bookin_time_cutoff, :title, :user_id, :id,  )
  end

end
