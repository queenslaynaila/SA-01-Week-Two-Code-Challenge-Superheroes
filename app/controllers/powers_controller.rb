class PowersController < ApplicationController
  before_action :set_power, only: %i[ show update  ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /powers
  def index
    @powers = Power.all

    render json: @powers
  end

  # GET /powers/1
  def show
    render json: @power
  end

  # PATCH/PUT /powers/1
  def update
    if @power.update(power_params)
      render json: @power
    else
      render json: @power.errors.full_messages, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power
      @power = Power.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def power_params
      params.require(:power).permit(:description)
    end

    def render_not_found_response
      render json: { error: "Power not found" }, status: :not_found
  end

end
