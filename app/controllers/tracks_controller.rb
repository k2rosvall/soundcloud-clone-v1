# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: %i[edit update destroy]

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1
  def show
    @track = Track.find_by(id: params[:id])
  end

  # GET /tracks/1/edit
  def edit; end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to profile_path(current_user.profile_id), notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_track
    @track = Track.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def track_params
    params.require(:track).permit(:track_file, :cover_image, :title, :genre, :description, :user_id)
  end

  def valid_content_type?(content_type)
    accepted_types = ['audio/mp3', 'audio/mpeg', 'audio/wav', 'audio/flac', 'audio/alac', 'audio/aliff']
    accepted_types.include?(content_type)
  end
end
