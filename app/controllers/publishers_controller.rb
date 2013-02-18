class PublishersController < ApplicationController
  load_and_authorize_resource

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publiser_params

    if @publisher.save_with_captcha
      self.current_user = @publisher
      redirect_to publisher_path(@publisher)
    else
      render "new"
    end
  end

  def update
    if publisher.update_attributes(publiser_params)
      redirect_to publisher_path(@publisher)
    else
      render "edit"
    end
  end

  private

  def publisher
    @publisher ||= Publisher.find(params[:id])
  end

  def publiser_params
    params[:publisher].slice(:avatar, :email, :alternative_name,
                             :short_description, :password, :password_confirmation,
                             :captcha, :captcha_key)
  end
end
