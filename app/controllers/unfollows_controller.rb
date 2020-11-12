class  UnfollowsController< ApplicationController
  before_action :authenticate_user!

  def create
    current_user.unfollow!(params[:account_id])
    follows_count = User.find(params[:account_id]).follower_relationships.count

    redirect_to account_path(params[:account_id])

  end
end

