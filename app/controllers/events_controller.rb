class EventsController < ApplicationController
    before_action :authenticate_user!, except: [ :index ]
    before_action :is_authorized?, except: [ :index, :upcoming, :past, :show ]

    def index
        @events = Event.all
    end

    def upcoming
        @events = Event.upcoming
        render :index
    end

    def past
        @events = Event.past
        render :index
    end

    def new
        @events = Event.all
        @event = Event.new
    end

    def create
        @events = Event.all
        @event = Event.new(get_params)
        @event.user_id = current_user.id
        if @event.save
            redirect_to events_path
        else
            render :new
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @events = Event.all
        @event = Event.find(params[:id])
        if @event.update(get_params)
            redirect_to events_path
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
    end

    private

    def get_params
        params.require(:event).permit(:title, :body, :location, :starts_at)
    end

    def is_authorized?
        if current_user.id == Event.find(params[:id]).user.id
            true
        else
            redirect_to events_path
        end
    end

end
