class PodcastsController < ApplicationController
	def new
	end

	def index
		@podcasts = Podcast.all
	end

	def create
		@cast = Podcast.new(cast_params)
		@cast.audio = File.join("/audio/", @cast.audio)
		if @cast.save
		  redirect_to @cast
		else
		  render 'new'
		end
	end

	def show
		@cast = Podcast.find(params[:id])
	end

	def destroy
		Podcast.find(params[:id]).destroy
	end

	def edit
		@podcast = Podcast.find(params[:id]);
	end

	def update
		@cast = Podcast.find(params[:id])
		if @cast
			@cast.update(cast_params)
		end
	end

	private
	  def cast_params
	    params.require(:podcast).permit(:title, :audio, :desc)
	  end
end
