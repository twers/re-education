class PublishersController < ApplicationController

	# TODO
	load_and_authorize_resource

	def new
		
	end

	def create
		@publisher = Publisher.new params[:publisher]
		@publisher.user = current_user
		@publisher.save
		redirect_to publisher_path(@publisher)
	end

	def show
		@publisher = Publisher.find(params[:id])
	end
end
