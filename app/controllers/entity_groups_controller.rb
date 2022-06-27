class EntityGroupsController < ApplicationController
  before_action :set_entity_group, only: %i[show edit update destroy]

  # GET /entity_groups or /entity_groups.json
  def index
    @entity_groups = EntityGroup.all
  end

  # GET /entity_groups/1 or /entity_groups/1.json
  def show; end

  # GET /entity_groups/new
  def new
    @entity_group = EntityGroup.new
  end

  # GET /entity_groups/1/edit
  def edit; end

  # POST /entity_groups or /entity_groups.json
  def create
    @entity_group = EntityGroup.new(entity_group_params)

    respond_to do |format|
      if @entity_group.save
        format.html { redirect_to entity_group_url(@entity_group), notice: 'Entity group was successfully created.' }
        format.json { render :show, status: :created, location: @entity_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entity_groups/1 or /entity_groups/1.json
  def update
    respond_to do |format|
      if @entity_group.update(entity_group_params)
        format.html { redirect_to entity_group_url(@entity_group), notice: 'Entity group was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_groups/1 or /entity_groups/1.json
  def destroy
    @entity_group.destroy

    respond_to do |format|
      format.html { redirect_to entity_groups_url, notice: 'Entity group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity_group
    @entity_group = EntityGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_group_params
    params.fetch(:entity_group, {})
  end
end
