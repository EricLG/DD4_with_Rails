class DmTools::EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]
  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.all.paginate(:page => params[:page], :per_page => 20).order(level: :asc, source_id: :asc, experience: :asc)
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
  end

  # GET /encounters/new
  def new
    @encounter = Encounter.new
    @budget_encounter = 500
    @encounters_exemple = Encounter.select(:description).where(level: 1)
    @search = MonsterSearch.new(params[:monster_search])
    @monsters = @search.build_search.order(level: :asc, name: :asc)
    @categories = Monster.pluck(:category).join(', ').split(', ').uniq.sort
    @keywords = Monster.pluck(:keywords).join(', ').split(', ').uniq.sort
  end

  # GET /encounters/1/edit
  def edit
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(encounter_params)

    respond_to do |format|
      if @encounter.save
        format.html { redirect_to dm_tools_encounter_path(@encounter), notice: 'Encounter was successfully created.' }
        format.json { render :show, status: :created, location: @encounter }
      else
        format.html { render :new }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encounters/1
  # PATCH/PUT /encounters/1.json
  def update
    respond_to do |format|
      if @encounter.update(encounter_params)
        format.html { redirect_to dm_tools_encounter_path(@encounter), notice: 'Encounter was successfully updated.' }
        format.json { render :show, status: :ok, location: @encounter }
      else
        format.html { render :edit }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @encounter.destroy
    respond_to do |format|
      format.html { redirect_to dm_tools_encounter_path, notice: 'Encounter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calcul_budget
    party_size  = params[:party_size].to_i
    party_level = params[:party_level].to_i
    @budget_encounter = Monster.level_to_xp(party_level) * party_size
    respond_to do |format|
      format.json { render json: {budget: @budget_encounter}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounter_params
      params.require(:encounter).permit(:level, :description)
    end
end
