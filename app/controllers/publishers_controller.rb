# -*- coding: utf-8 -*-
require 'digest/md5'

class PublishersController < ApplicationController
  load_and_authorize_resource

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new params[:publisher]

    if @publisher.save_with_captcha
      self.current_user = @publisher
      redirect_to publisher_path(@publisher)
    else
      render "new"
    end
  end

  def update
    if publisher.update_attributes(params[:publisher])
      redirect_to publisher_path(@publisher)
    else
      render "edit"
    end
  end

  private

  def publisher
    @publisher ||= Publisher.find(params[:id])
  end
end
