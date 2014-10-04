class CalendarController < ApplicationController

	COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

	def index
		curr_time = Time.now
		@monthString = curr_time.strftime("%B")
		date = Date.new(curr_time.year, curr_time.month, 1)
		starting_day = date.wday
		days = days_in_month(date.month)

		@numerals = []

		@event_days = [] 
		@events = []

		(0..starting_day).each do |num|
			@numerals[num] = ""
		end
		(0...days).each do |num|
			i = num + starting_day
			@numerals[i] = num + 1

			@event_days[i] = EventDay.find_by(date: date)
			if @event_days[i]
				@events[i] = Event.where(day_id: @event_days[i].id).to_a
			end
			date = date + 1
		end

	end

	def days_in_month(month, year = Time.now.year)
	   return 29 if month == 2 && Date.gregorian_leap?(year)
	   COMMON_YEAR_DAYS_IN_MONTH[month]
	end
end
