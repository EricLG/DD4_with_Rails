class DmTools::EncountersController < ApplicationController
  before_action :set_encounter, only: %i[show edit update destroy]

  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.all.paginate(page: params[:page], per_page: 20).order(level: :asc, source_id: :asc, experience: :asc)
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show; end

  # GET /encounters/new
  def new
    @encounter = Encounter.new
    @search = MonsterSearch.new(params[:monster_search])
    @monsters = @search.build_search.order(level: :asc, name: :asc)
    @categories = Monster.categories
    @keywords = Monster.keywords
  end

  # GET /encounters/1/edit
  def edit; end

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

  # Ajax request : calcul new budget and update encounters example list
  def calcul_budget
    party_size  = params[:party_size].to_i
    party_level = params[:party_level].to_i
    budget_encounter = Monster.level_to_xp(party_level) * party_size
    encounters_exemple = Encounter.select(:description).where(experience: budget_encounter)
    respond_to do |format|
      format.json { render json: { budget: budget_encounter, encounters: encounters_exemple } }
    end
  end

  # Ajax request : update difficulty encounter from budget and party
  def update_difficulty_encounter
    party_size  = params[:party_size].to_i
    party_level = params[:party_level].to_i
    total_monster_xp = params[:totalMonsterXp].to_i

    very_easy_encounter = Monster.level_to_xp(party_level) * (party_size - 3)
    easy_encounter = Monster.level_to_xp(party_level) * (party_size - 1)
    normal_encounter = Monster.level_to_xp(party_level) * party_size
    hard_encounter = Monster.level_to_xp(party_level) * (party_size + 2)
    very_hard_encounter = Monster.level_to_xp(party_level) * (party_size + 5)

    diff = case total_monster_xp
           when 0..very_easy_encounter
             "trivial (niveau < #{party_level - 3})"
           when very_easy_encounter..easy_encounter
             "très facile (niveau #{party_level - 3} à #{party_level - 2})"
           when easy_encounter..normal_encounter
             "facile (niveau #{party_level - 2} à #{party_level - 1})"
           when normal_encounter..hard_encounter
             "normale (niveau #{party_level} à #{party_level + 1})"
           when hard_encounter..very_hard_encounter
             "difficile (niveau #{party_level + 1} à #{party_level + 5})"
           else
             "très difficile (niveau > #{party_level + 5})"
           end

    respond_to do |format|
      format.json { render json: { difficulty: diff } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_encounter
    @encounter = Encounter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def encounter_params
    params.require(:encounter).permit(
      :level,
      :experience,
      :description,
      chosen_monsters_attributes: [
        :id,
        :monster_id,
        :quantity
      ]
    )
  end
end
