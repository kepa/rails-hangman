class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  MSG = {
      win: 'YOU WIN!',
      game_over: 'YOU LOSE',
      correct: "You're correct!",
      wrong: "Wrong letter"
    }
  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.create
    redirect_to game_url(@game), notice: "Game was successfully created."
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    @game.play_round(game_params[:chance])
    #binding.pry
    if @game.save
      redirect_to game_url(@game), notice: MSG[:correct]
    end

  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
     # params.require(:game).permit(:lives, :word, :chance, :wrong_letters)
     params.require(:game).permit(:chance)
    end
end
