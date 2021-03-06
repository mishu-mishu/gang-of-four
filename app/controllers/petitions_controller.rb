class PetitionsController < ApplicationController
  before_action :set_petition, only: [:show, :edit, :update, :destroy, :sign]

  # GET /petitions
  # GET /petitions.json
  def index
      if params[:tag] 
        @petitions = Petition.tagged_with(params[:tag])
      else 
        @petitions = Petition.all
      end  
  end

  # GET /petitions/1
  # GET /petitions/1.json
  def show
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
  end

  # GET /petitions/1/sign
  def sign
    @sign = SignPetition.new
  end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(petition_params)

    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Your petition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @petition }
      else
        format.html { render action: 'new' }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/1
  # PATCH/PUT /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: 'Petition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_params
      params.require(:petition).permit(:user_id, :titlu, :continut, :tag_list)
      # params.require(:petition).permit(:user_id, :titlu, :continut)
    end

    def tagged
      if params[:tag] 
        @petitions = Petition.tagged_with(params[:tag])
      else 
        @petitions = Petition.all
      end  
    end

end
