# frozen_string_literal: true

class ChoresController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_chore, only: %i[show edit update destroy]
  layout 'child_layout'

  # GET /chores or /chores.json
  def index
    @chores = Chore.all
  end

  # GET /chores/1 or /chores/1.json
  def show; end

  # GET /chores/new
  def new
    @chore = Chore.new
  end

  # GET /chores/1/edit
  def edit; end

  # POST /chores or /chores.json
  def create
    @chore = Chore.new(chore_params)

    respond_to do |format|
      if @chore.save
        format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
        format.json { render :show, status: :created, location: @chore }
      else
        puts "save error: #{@chore.errors.to_a} \n error on: #{@chore.as_json}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1 or /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        puts "update error: #{@chore.errors.to_a} \n error on: #{@chore.as_json}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1 or /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chore
    @chore = Chore.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chore_params
    params.require(:chore).permit(:job, :description, :child_id)
  end

  def catch_not_found(e)
    Rails.logger.debug('There was a not found exception.')
    flash.alert = e.to_s
    redirect_to chores_path
  end
end
