require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/human_player'
require_relative 'lib/computer_player'
require_relative 'lib/player_factory'
require_relative 'lib/player_info'
require_relative 'lib/game_setup'
require_relative 'lib/input'
require_relative 'lib/output'
require_relative 'lib/view'

input = Input.new
output = Output.new
view = View.new
setup = GameSetup.new(input, output, view)
info = PlayerInfo.new(input, output, view, setup)
factory = PlayerFactory.new(input, output, view, info)
board = Board.new

args = {:board => board, :view => view, :output => output, :factory => factory}

game = Game.new(args)
game.play_game