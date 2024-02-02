class AttendeeEventsController < ApplicationController

    def index
      @attendee_events = AttendeeEvent.all 
    end
    
    def show
    end

    def new
      @attendee_event = AttendeeEvent.new
    end

    def create
      @attendee_event = AttendeeEvent.new(attendee_events_params)

      respond_to do |format|
        if @attendee_event.save
          format.html { redirect_to event_url(@event), notice: "Event attendee was successfully created." }
          format.json { render :show, status: :created, location: @attendee_event }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render :new, status: :unprocessable_entity, json: @attendee_event.errors }
        end
      end
    end

    private

    def attendee_events_params
      params.require(:attendee_event).permit(:attendee_event, :attendee_event)
    end

end