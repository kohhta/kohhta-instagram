class FollowsController < ApplicationController
  before_action :authenticate_user!

  def show
    user = User.find(params[:account_id])
    follow_status = current_user.has_followed?(user)
    render json: { hasFollow: follow_status }
  end

  def create
    current_user.follow!(params[:account_id])
    # follows_count = User.find(params[:account_id]).follower_relationships.count

    render json: { status: 'ok' }
  end
  
end