class DmTools::MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  # GET /monsters
  # GET /monsters.json
  def index
    @sources = Source.monsters
    @search = MonsterSearch.new(params[:monster_search])
    @monsters = @search.build_search.paginate(:page => params[:page], :per_page => 20).order(level: :asc, name: :asc)
    @categories = Monster.pluck(:category).join(', ').split(', ').uniq.sort
    @keywords = Monster.pluck(:keywords).join(', ').split(', ').uniq.sort
    respond_to do |format|
        format.html { render :index }
        format.js { render json: {monsters: @monsters}}
    end
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @monster}
    end
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(monster_params)

    respond_to do |format|
      if @monster.save
        format.html { redirect_to dm_tools_monster_path(@monster), notice: 'Monster was successfully created.' }
        #format.json { render :show, status: :created, location: edit_dm_tools_monster_path(@monster) }
      else
        format.html { render :new }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.update(monster_params)
        format.html { redirect_to dm_tools_monster_path(@monster), notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    respond_to do |format|
      format.html { redirect_to dm_tools_monsters_path, notice: 'Monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajax_search
    monsters = Monster.select(:id, :name, :level)
    if (params[:monster_search])
      monsters = monsters.where(main_role: params[:monster_search][:main_role]) unless params[:monster_search][:main_role].empty?
      monsters = monsters.where(second_role: params[:monster_search][:second_role]) unless params[:monster_search][:second_role].empty?
      monsters = monsters.where(race: params[:monster_search][:race]) unless params[:monster_search][:race].empty?
      monsters = monsters.where(leader: params[:monster_search][:leader]) unless params[:monster_search][:leader].empty?
      monsters = monsters.where(origin: params[:monster_search][:origin]) unless params[:monster_search][:origin].empty?
      monsters = monsters.where(category: params[:monster_search][:category]) unless params[:monster_search][:category].empty?
      monsters = monsters.where("monsters.keywords ILIKE ?", "%#{params[:monster_search][:keywords]}%")
      unless params[:monster_search][:level].empty?
        level = params[:monster_search][:level].to_i
        monsters = monsters.where(level: level-5..level+5)
      end
    end
    monsters = monsters.order(level: :asc, name: :asc)

    respond_to do |format|
        format.js { render json: monsters}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      @monster = Monster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      params.require(:monster).permit(:name, :main_role, :second_role, :leader, :level, :category, :px, :race, :origin, :keywords, :source_id)
    end
end
