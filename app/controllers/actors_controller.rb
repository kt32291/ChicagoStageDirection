class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]
  before_action :confirm_actor, only: [:edit, :update, :destroy]
  before_action :verify_show, only: [:show]

  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
  end

  # GET /actors/new
  def new
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors
  # POST /actors.json
  def create
    @actor = Actor.new(actor_params)
    @actor.headshot = params[:actor][:file]
    @actor.resume = params[:actor][:resume_file]

    respond_to do |format|
      if @actor.save
        session[:actor_id] = @actor.id
        format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @actor }
      else
        format.html { render action: 'new' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
    reset_session
    respond_to do |format|
      format.html { redirect_to auditions_url, notice: 'Your account was deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def confirm_actor
      unless session[:actor_id] && @actor && session[:actor_id] == @actor.id
          redirect_to root_url, notice: 'Please access one of your own pages'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actor_params
      params.require(:actor).permit(:first_name, :last_name, :gender, :equity, :height, :eyes, :hair, :weight, :email, :password, :password_confirmation)
    end

    def verify_show
      if session[:associate_id]
        associate_id = session[:associate_id]
        associate = Associate.find_by(id: associate_id)
        company = Company.find_by(id: associate.company_id)
        auditions = company.auditions
        submissions = Submission.where(audition_id: auditions.pluck(:id))
        actor_ids = submissions.pluck(:actor_id)
          unless actor_ids.include? @actor.id
              redirect_to root_url, notice: 'Please access one of your own pages'
          end
      elsif session[:actor_id]
        unless session[:actor_id] && @actor && session[:actor_id] == @actor.id
          redirect_to root_url, notice: 'You do not have permission to view that page'
        end
      else
        redirect_to root_url, notice: 'You do not have permission to view that page'
      end
    end
end





