class InvitesController < ApplicationController

    def index
        @user = User.find(params[:id])
    end

    def new
        @event = Event.find(params[:event_id])
        @invite = Invite.new
        @users = User.all
    end

    def create
        @event = Event.find(params[:event_id])
        @invite = Invite.new
        @users = User.all

        invite = Invite.new
        invite.user_id = params[:id]
        invite.event_id = params[:event_id]
        invite.save
        render :new
    end

    def accept
        invitation = Invite.find_by(event_id: params[:event_id], user_id: params[:id])
        invitation.destroy
        attendee = Attendee.new(event_id: params[:event_id], user_id: current_user.id)
        attendee.save
        redirect_to events_path
    end

    def destroy
        @event = Event.find(params[:event_id])
        @invite = Invite.new
        @users = User.all
        invite = Invite.find_by(event_id: params[:event_id], user_id: params[:id])
        invite.destroy
        render :new
    end

end
