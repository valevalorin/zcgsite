class HomeController < ApplicationController
  def index

    #Get latest stories, display them in the newblocks
  	@articles = Article.last(8)
    @articles.reverse!

    @events = Array.new
    curr_date = Date.today
    date_buffer = Date.new(curr_date.year, curr_date.month, curr_date.day)
    day = EventDay.where(date: date_buffer)

    (0...6).each do
      unless day
        buffer = Event.find_by(day_id: day.id)

        buffer.each do |event|
          @events.push event
        end
      end

      date_buffer = date_buffer+1
      day = EventDay.where(date:date_buffer);
    end
  end
end
