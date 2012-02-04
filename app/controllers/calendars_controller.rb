require 'cgi'
require 'json'

class CalendarsController < ApplicationController
  skip_before_filter :authorize
  # GET /calendars
  # GET /calendars.json
  def index
    @events = Event.order(:time).order(:date)
  
    fetch_calendar 'tgbgmclhk5gegn8t95fvqov0s8@group.calendar.google.com'
  end
  
  def fetch_calendar(calendar_id)
    url = "https://www.google.com/calendar/feeds/#{CGI.escape(calendar_id)}/public/full?" +
        "alt=jsonc&max-results=1024"
    agent = Mechanize.new
    agent.user_agent_alias = 'Linux Firefox'
    response = JSON.parse agent.get_file(url)
    response['data']['items']
    
    # ...
  end
end
