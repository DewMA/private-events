class AttendeesController < ApplicationController

    def show
        @event = Event.find(params[:id])
    end

    def destroy
        event = Event.find(params[:event_id])
        attendee = event.attendee.find_by(params[:id])
        attendee.destroy
        redirect_to events_path
    end

end
