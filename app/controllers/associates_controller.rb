class AssociatesController < ApplicationController
  before_action :set_associate, only: [:show, :edit, :update, :destroy]
  before_action :confirm_associate, only: [:show, :edit, :update, :destroy]

  # GET /associates
  # GET /associates.json
  def index
    @associates = Associate.all
  end

  # GET /associates/1
  # GET /associates/1.json
  def show
    @company = Company.find_by(id: @associate.company_id)
    @auditions = @company.auditions
  end

  # GET /associates/new
  def new
    @associate = Associate.new
    @companies = Company.all.order(:name)
  end

  # GET /associates/1/edit
  def edit
  end

  # POST /associates
  # POST /associates.json
  def create
    @associate = Associate.new(associate_params)

    respond_to do |format|
      if @associate.save
        session[:associate_id] = @associate.id
        format.html { redirect_to @associate, notice: 'Associate was successfully created.' }
        format.json { render action: 'show', status: :created, location: @associate }
      else
        format.html { render action: 'new' }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associates/1
  # PATCH/PUT /associates/1.json
  def update
    respond_to do |format|
      if @associate.update(associate_params)
        format.html { redirect_to @associate, notice: 'Associate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associates/1
  # DELETE /associates/1.json
  def destroy
    @associate.destroy
    respond_to do |format|
      format.html { redirect_to associates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associate
      @associate = Associate.find(params[:id])
    end

    def confirm_associate
      unless session[:associate_id] && @associate && session[:associate_id] == @associate.id
          flash[:error] = "Please access one of your own pages"
          redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associate_params
      params.require(:associate).permit(:name, :title, :company_id, :email, :password, :password_confirmation)
    end
end
