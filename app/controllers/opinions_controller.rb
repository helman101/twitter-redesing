class OpinionsController < ApplicationController
  def create
    @opinion = current_user.opinions.new(params[:content])

    if @opinion.save
      redirect_to request.referrer, notice: 'You post an opinion'
    else
      redirect_to request.referrer, alert: 'You cannot post this opinion'
    end
  end

  def update
    @opinion = current_user.opinions.find(params[:id])

    if @opinion.update(params[:content])
      redirect_to request.referrer, notice: 'Updated succesfully'
    else
      redirect_to request.referrer, alert: 'Cannot update opinion'
    end
  end

  def destroy
    @opinion = current_user.opinions.find(params[:id])

    redirect_to request.referrer, notice: 'Opinion delete successfully'
  end
end
