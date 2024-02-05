class AttendeeEventsController < ApplicationController

  before_action :get_events, only: [:create, :new]

    def index
      @attendee_events = AttendeeEvent.all 
    end
    
    def show
      @attendee_event = AttendeeEvent.find(params[:id])
    end

    def new
      @attendee_event = AttendeeEvent.new
    end

    def create
      @attendee_event = AttendeeEvent.new(event_attendee_id: params[:attendee_event][:attendee_id], attended_event_id: params[:attendee_event][:attended_event_id])

      respond_to do |format|
        if @attendee_event.save
          format.html { redirect_to attendee_events_path(@attendee_event), notice: "Event attendee was successfully created." }
          format.json { render :show, status: :created, location: @attendee_event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render :new, status: :unprocessable_entity, json: @attendee_event.errors }
        end
      end
    end

    private

    def get_events
      @events = Event.all
    end

    def attendee_events_params
      @params = params.require(:attendee_event).permit(:attendee_id, :attended_event_id)
    end

end