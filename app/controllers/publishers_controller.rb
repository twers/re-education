require 'digest/md5'

class PublishersController < ApplicationController

	# TODO
	load_and_authorize_resource

	def new
		
	end

	def create
		matched_publishers = Publisher.where(params[:publisher].except(:password))

		if matched_publishers.empty? then
			params[:publisher][:password] = Digest::MD5.hexdigest params[:publisher][:password]
			publisher = Publisher.new params[:publisher]
			publisher.save

			session[:user_id] = publisher.id
			redirect_to publisher_path(publisher)
		end
	end

	def edit
	end

	def show
		@publisher = Publisher.find(params[:id])
	end

	def update
		publisher = Publisher.find(params[:id])
		publisher.update_attributes(params[:publisher])
		redirect_to publisher_path(publisher)
	end
end
