class ArticlesController < ApplicationController
	before_action :authorize, except: [:index, :show]

	def new
		@authors = []
		buffer = Author.all
		buffer.each do |author|
			@authors.push([author.name, "#{author.id}"])
		end
	end

	def create
		@article = Article.new(article_params)
		if @article.save
		  redirect_to @article
		else
		  render 'new'
		end
	end

	def index
	  #Process offset, determine range of articles to pull
	  @offset = nil
	  @prev = nil
	  @next = nil
	  stop = Article.last.id
	  if params[:offset]
	  	#Nav
	  	@offset = Integer(params[:offset])
	  	@offset = 0 if @offset < 0
	  	@prev = @offset - 1 if @offset > 0
	  	@next = @offset + 1

	  	#Pull range
	  	stop = stop - (@offset * 15)
	  end	  
	  start = stop - 15
	  @next = nil if start < 1

	  #Pull articles and associate with authors
	  @authors = []
	  @articles = Article.where(id: start..stop)
	  @articles.each do |article|
	  	@authors.push Author.find_by(id: article.author_id)
	  end
	end

	def show
  		@article = Article.find(params[:id])
  		@author = Author.find_by(id: @article.author_id)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article
			@article.update(article_params)
		end
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :html, :title_image, :author_id)
	  end
	  def authorize
		  unless session[:logged_in]
			redirect_to root_path
		  end
	  end
end
