require 'pry'

class PlayerFactory

  def initialize(info, input, output, view)
    @info = info
    @input = input
    @output = output
    @view = view
  end

  def players
    players = []
    player_info.each do |info|
      if info[0] == "computer"
        p info
        players << ComputerPlayer.new(info, @input, @output, @view)
      else
        players << HumanPlayer.new(info, @input, @output, @view)
      end
    end
    players
  end

  def player_info
    @info.player_info
  end

end