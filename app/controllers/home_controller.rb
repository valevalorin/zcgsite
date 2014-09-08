class HomeController < ApplicationController
  def index

    #Get latest stories, display them in the newblocks
  	stories = [Podcast.last, Comic.last, Article.last]
  	stories = stories.sort_by do |story|
  		story.created_at
  	end 
  	@mainStory = stories[0]
  	@currentCasts = Podcast.last(2)
  	@currentComics = Comic.last(2)
  	if defined? @mainStory.image
  		buffer = Comic.last(3)
  		@currentComics = buffer[1, 2]
  	elsif defined? @mainStory.audio
  		buffer = Podcast.last(3)
  		@currentCasts = buffer[1, 2]
  	end

    #Get latest cards and display on rotator
    @cards = Card.last(8)
  	
  end
end
