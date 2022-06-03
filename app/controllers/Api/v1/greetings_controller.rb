class Api::V1::GreetingsController < ApplicationController
  before_action :set_greeting, only: %i[show update destroy]

  # GET /greetings
  def index
    @greetings = Greeting.all

    render json: @greetings
  end

  def create
    @greeting = Greeting.new(greeting_params)

    if @greeting.save
      render json: @greeting, status: :created, location: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /greetings/1
  
  # Only allow a list of trusted parameters through.
  def greeting_params
    params.require(:greeting).permit(:title, :message)
  end
end
