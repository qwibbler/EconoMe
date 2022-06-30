class GroupsController < ApplicationController
  before_action :redirect
  before_action :set_group, only: %i[show edit update destroy]

  ICONS = [
    ['Entertainment', '001-theater.png'],
    ['Pets', '002-pet-house.png'],
    ['Health', '003-heartbeat.png'],
    ['Bills', '004-receipt.png'],
    ['Games', '005-controller.png'],
    ['Clothes', '006-hanger.png'],
    ['Toiletries', '007-toiletries.png'],
    ['Family', '008-family.png'],
    ['Miscellaneous', '009-miscellaneous.png'],
    ['Random', '010-rgb.png'],
    ['Gifts', '011-magic-box.png'],
    ['Travel', '012-transportation.png'],
    ['Groceries', '013-display.png'],
    ['Necessities', '014-must-have.png'],
    ['Personal', '015-profile.png'],
    ['Job', '016-job-offer.png'],
    ['Home', '017-home.png']
  ].freeze

  # GET /groups or /groups.json
  def index
    @groups = current_user.groups.includes([:entity_groups]).all
    @header = { title: 'Categories' }
  end

  # GET /groups/1 or /groups/1.json
  def show
    @transactions = @group.entities.all.order('created_at desc')
    @header = { title: 'Transactions', url: edit_group_path(@group) }
  end

  # GET /groups/new
  def new
    @group = Group.new
    @header = { title: 'New Category' }
  end

  # GET /groups/1/edit
  def edit
    @header = { title: 'Edit Category' }
  end

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
    redirect_to root_path unless current_user
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
