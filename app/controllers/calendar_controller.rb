class CalendarController < ApplicationController

	COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

	def index
		#Get month offset and parse it if it exists. If less than zero than set to 0
		@offset = nil
		@prevMonth = nil
		@nextMonth = 1
		if params[:offset]
			@offset = Integer(params[:offset])
			@offset = 0 if @offset < 0
			@prevMonth = @offset - 1 if @offset > 0
			@nextMonth = @offset + 1
		end

		#Calculate current month and start date based on offset
		curr_time = Time.now
		date = Date.new(curr_time.year, curr_time.month, 1)
		date = date + @offset.months if @offset
		@monthString = date.strftime("%B")
		starting_day = date.wday
		days = days_in_month(date.month)

		#Initialize structures to populate view
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
