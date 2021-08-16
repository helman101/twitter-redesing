class OpinionsController < ApplicationController
  def index
    @user = current_user
    @opinions = @user.friends_and_own_opinions
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)

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

  private 
  
  def opinion_params
    params.require(:opinion).permit(:content)  
  end

end
