class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :redirect

  ICONS = [
    ['Entertainment', '/assets/001-theater.png'],
    ['Pets', '/assets/002-pet-house.png'],
    ['Health', '/assets/003-heartbeat.png'],
    ['Bills', '/assets/004-receipt.png'],
    ['Games', '/assets/005-controller.png'],
    ['Clothes', '/assets/006-hanger.png'],
    ['Toiletries', '/assets/007-toiletries.png'],
    ['Family', '/assets/008-family.png'],
    ['Miscellaneous', '/assets/009-miscellaneous.png'],
    ['Random', '/assets/010-rgb.png'],
    ['Gifts', '/assets/011-magic-box.png'],
    ['Travel', '/assets/012-transportation.png'],
    ['Groceries', '/assets/013-display.png'],
    ['Necessities', '/assets/014-must-have.png'],
    ['Personal', '/assets/015-profile.png'],
    ['Job', '/assets/016-job-offer.png'],
    ['Home', '/assets/017-home.png'],
    ['Icon', '']
  ].freeze

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @transactions = @group.entities.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def redirect
    render root_path unless current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon).merge(user: current_user)
  end
end
