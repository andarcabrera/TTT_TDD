require 'rspec'
require 'spec_helper'
require_relative '../lib/computer_player'
require_relative '../lib/board'

describe ComputerPlayer do

  let(:input) { double('input')}
  let(:output) { double('output', :print => nil)}
  let(:view) { double('view', :computer_thinking => nil)}
  let(:computer) { ComputerPlayer.new('Y', input, output, view)}
  let(:board) { Board.new(['X', 'Y']) }

  context 'it picks the best spot on the board' do
    it 'picks the winning spot if it can win in the same round' do
      board.surface = ["Y", "Y", "2", "X", "4", "5", "X", "7", "X"]

      expect(computer.pick_spot(board)).to eq("2")
    end

    it 'picks the spot that would make the other player a winner' do
      board.surface = ["X", "X", "2", "Y", "4", "5", "Y", "7", "X"]

      expect(computer.pick_spot(board)).to eq("2")
    end
  end
end