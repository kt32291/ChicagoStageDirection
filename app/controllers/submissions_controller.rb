class SubmissionsController < ApplicationController

before_action :confirm_actor, only: [:new, :create]
before_action :set_audition, only: [:new, :create, :index]

  def index
    if session[:associate_id]
      associate = Associate.find_by(id: session[:associate_id])
      @audition = Audition.find_by(id: params[:audition_id])
      if associate.company_id == @audition.company.id
        submissions = Submission.where(audition_id: @audition.id)
        @actors = Actor.where(id: submissions.pluck(:actor_id))
        @men = @actors.where(gender: "Male")
        @women = @actors.where(gender: "Female")
      else
        redirect_to root_url, notice: "You aren't a member of that company"
      end
    else
      redirect_to root_url, notice: "You must be logged in as a casting associate to view submissions"
    end
  end

  def show
    @submission = Submission.find_by(id: params[:id])
  end

  def new
    @audition = Audition.find_by(id: params[:audition_id])
  end

  def create
    @submission = Submission.new
    @submission.actor_id = params[:actor_id]
    @submission.audition_id = params[:audition_id]
    if @submission.save
      redirect_to auditions_url, notice: "Thanks for submitting for #{@audition.name}."
    else
      redirect_to auditions_url, notice: "You have already submitted for this production."
    end
  end

    def confirm_actor
      unless session[:actor_id]
          redirect_to root_url, notice: "You must be logged in as an actor to submit."
      end
    end

    def set_audition
       @audition = Audition.find_by(id: params[:audition_id])
    end


end
