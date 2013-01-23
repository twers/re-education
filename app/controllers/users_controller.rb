class UsersController < ApplicationController
  def create
    matched_users = User.where(:unique_id => params[:user][:unique_id])

    unless matched_users.empty? then
      user = matched_users.first
      user.access_token = params[:user][:access_token]
      user.avatar_url = params[:user][:avatar_url]
      user.nick_name = params[:user][:nick_name]
    else
      user = User.new params[:user]
    end

    user.save
    session[:user_id] = user.id
    render :json => { :user => user, :registered => user.publisher.present? }
  end
end
