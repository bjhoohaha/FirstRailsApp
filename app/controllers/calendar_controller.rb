class CalendarController < ApplicationController
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
  # @events_by_date = Event.group_by(&:date)
end
