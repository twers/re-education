require 'digest/md5'

class PublishersController < ApplicationController

	before_filter :find_publisher, :only => [:show, :update]

	load_and_authorize_resource

	def find_publisher
		@publisher = Publisher.find(params[:id])
	end

	def new
	end

	def create
		matched_publishers = Publisher.where(params[:publisher].except(:password))

		if matched_publishers.empty? then
			@publisher = Publisher.new params[:publisher]

			if params[:password_copy].present? and !(params[:password_copy].eql? @publisher.password) then				
				@publisher.errors.add(:password, "两次密码输入不一致") 
			end
			
			@publisher.password = Digest::MD5.hexdigest @publisher.password
			unless @publisher.errors.present? then
				@publisher.save
				session[:user_id] = @publisher.id
				redirect_to publisher_path(@publisher)
				return
			end
		end
		render "new", :layout => true
	end

	def edit
	end

	def show
	end

	def update
		@publisher.alternative_name = params[:publisher][:alternative_name]

		if @publisher.valid? and @publisher.update_attributes(params[:publisher]) then
			redirect_to publisher_path(@publisher)
		else
			render "edit", :layout => true
		end
	end
end
