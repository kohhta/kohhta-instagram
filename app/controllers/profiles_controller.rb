class ProfilesController < ApplicationController
  before_action :authenticate_user!
  # ログインしてないとできない

  def show
    
  end

  def edit
  end
  
end