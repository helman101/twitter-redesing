class FollowingsController < ApplicationController
  def create
    @following = current_user.followed.create(params[:followed_id])

    if @following.save
      redirect_to request.referrer, notice: 'Now following'
    else
      redirect_to request.referrer, notice: 'You already follow this user'
    end
  end

  def destroy
    @following = Following.find(params[:following_id])

    @following.destroy

    redirect_to request.referrer, notice: 'Not followed anymore'
  end
end
