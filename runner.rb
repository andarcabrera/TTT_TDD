require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/human_player'
require_relative 'lib/computer_player'
require_relative 'lib/input'
require_relative 'lib/output'
require_relative 'lib/view'

ui = UserInterface.new
output = Output.new
view = View.new
player1 = HumanPlayer.new('X', ui, output, view)
player2 = HumanPlayer.new('Y', ui, output, view)
player3 = ComputerPlayer.new('C', ui, output, view)
player4 = ComputerPlayer.new('Z', ui, output, view)
players = [player1, player4]
board = Board.new(['X', 'Z'])

args = {:board => board, :markers => ['X', 'Y'], :players => players, :view => view, :output => output}

game = Game.new(args)
game.play_game