class HomeController < ApplicationController
  def index
    unless signed_in?
      render :action => "about"
    else
      @events = Event.to_user(current_user)
      @score = @events.length * 10
    end
  end
end
