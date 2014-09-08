class CardsController < ApplicationController
	def new

	end

	def create
		@card = Card.new(card_params)
		puts card_params
		if @card.save
		  redirect_to @card
		else
		  render 'new'
		end
	end

	def show
		@card = Card.find(params[:id])
	end

	def destroy
		Card.find(params[:id]).destroy
	end

	private
	  def card_params
	    params.require(:card).permit(:title, :image, :link)
	  end
end
