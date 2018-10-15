class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :update, :destroy]

  # GET /speakers
  def index
    @speakers = Speaker.all

    render json: @speakers
  end

  # GET /speakers/1
  def show
    render json: @speaker
  end

  # POST /speakers
  def create
    @speaker = Speaker.new(speaker_params)

    if @speaker.save
      render json: @speaker, status: :created, location: @speaker
    else
      render json: @speaker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /speakers/1
  def update
    if @speaker.update(speaker_params)
      render json: @speaker
    else
      render json: @speaker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /speakers/1
  def destroy
    @speaker.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def speaker_params
      params.require(:speaker).permit(:session_id, :name, :biography, :email, :speaker_agreement)
    end
end
