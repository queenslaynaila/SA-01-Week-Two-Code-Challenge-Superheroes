class HerosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  before_action :set_hero, only: %i[ show ]

  # GET /heros
  def index
    @heros = Hero.all

    render json: @heros
  end

  # GET /heros/1
  def show
    render json: @hero, serializer: HeroPowerSerializer
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    def render_not_found_response
      render json: { error: "Hero not found" }, status: :not_found
  end
end
