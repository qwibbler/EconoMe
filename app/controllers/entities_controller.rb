class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :redirect

  # GET /entities or /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @entity = Entity.new
    @entity.entity_groups.build
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = Entity.new(entity_params)

    @startcount = 1
    p @startcount
    @entity.entity_groups.each do |m|
      m.group_id = entity_params[:entity_groups_attributes]['0'][:group_id][@startcount]
      @startcount += 1
      p @startcount
    end

    respond_to do |format|
      if @entity.save
        entity_params[:entity_groups_attributes]["0"][:group_id].drop(@startcount).each do |m|
          @entity.entity_groups.build(group_id: entity_params[:entity_groups_attributes]["0"][:group_id][@startcount]).save
          @startcount += 1
          p @startcount
        end

        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def redirect
    redirect_to root_path unless current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, entity_groups_attributes: [group_id: []]).merge(user: current_user)
  end
end
