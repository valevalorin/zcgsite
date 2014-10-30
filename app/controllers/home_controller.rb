class HomeController < ApplicationController
  def index

    #Get latest stories, display them in the newblocks
  	@articles = Article.last(8)
    @articles.reverse!

    @authors = []
    @articles.each do |article|
      @authors.push Author.find_by(id: article.author_id)
    end

    @events = []
    curr_date = Date.today
    date_buffer = Date.new(curr_date.year, curr_date.month, curr_date.day)
    day = EventDay.find_by(date: date_buffer)

    (0...6).each do
      if !day.nil?
        day_buffer = Event.where(day_id: day.id)

        day_buffer.each do |event|
          buffer = {}
          buffer[:title] = event.title
          buffer[:time] = event.time
          buffer[:icon] = event.icon
          buffer[:day] = day.date
          @events.push buffer
        end
      end

      date_buffer = date_buffer+1
      day = EventDay.find_by(date: date_buffer);
    end
  end
end
