class SessionsController < ApplicationController

  def new
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def create
    actor = Actor.find_by(email: params[:email])
    associate = Associate.find_by(email: params[:email])
    if actor.present?
      if actor.authenticate(params[:password])
          session[:actor_id] = actor.id
          redirect_to root_url
        else
          flash.now[:notice] = "Email or password not valid."
          render 'new'
        end
      elsif associate.present?
        if associate.authenticate(params[:password])
          session[:associate_id] = associate.id
          redirect_to associate_url(associate)
        else
          flash.now[:notice] = "Email or password not valid."
          render 'new'
        end
    else
      flash.now[:notice] = "Email or password not valid."
      render 'new'
    end
  end

end
