defmodule Hangman2.Server do

  alias Hangman2.Game # duh

  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    { :ok, Game.new_game() }
  end

  def handle_call({ :make_move, guess }, _from, game) do
    {  game, tally } = Game.make_move(game, guess)
    { :reply, tally, game }
  end

end
