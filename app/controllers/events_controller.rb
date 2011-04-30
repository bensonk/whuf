class EventsController < ApplicationController
  before_filter :must_be_user

  def new
    @event = Event.new
  end

  def create
    recipient = User.find_by_twitter_name params[:event][:to_user_id]
    e = Event.new :from_user => current_user, :to_user => recipient
    e.save
    redirect_to root_url
  end
end
