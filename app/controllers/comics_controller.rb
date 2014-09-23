class ComicsController < ApplicationController
	def new

	end

	def index
		@comics = Comic.all
	end

	def create
		@comic = Comic.new(comic_params)
		@comic.image = File.join("/comics/", @comic.image)
		if @comic.save
		  redirect_to @comic
		else
		  render 'new'
		end
	end

	def show
		@comic = Comic.find(params[:id])
	end

	def destroy
		Comic.find(params[:id]).destroy
	end

	def edit
		@comic = Comic.find(params[:id]);
	end

	def update
		@comic = Comic.find(params[:id])
		if @comic
			@comic.update(comic_params)
		end
	end

	private
	  def comic_params
	    params.require(:comic).permit(:title, :image, :desc)
	  end
end
