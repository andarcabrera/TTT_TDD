require 'rspec'
require 'spec_helper'
require_relative '../lib/board'

describe Board do

  let(:markers) { ['X', 'Y'] }
  let(:board) { Board.new(markers) }

  describe '#initialize' do

    context 'generates a playing surface with a custom number of spots' do
      it 'creates 9 spots for a 3 row board' do

        expect(board.surface.length).to eq(9)
      end

      it 'creates 16 spots for a 4 row board' do
        board = Board.new(markers, 16)

        expect(board.surface.length).to eq(16)
      end
    end

    context 'board is initialized with markers' do
      it 'returns the markers' do

        expect(board.markers).to include('X', 'Y')
      end
    end
  end

  describe "#available_spot" do
    it 'confirms spot is available' do
      board.surface = ["X", "1", "2", "3", "4", "5", "Y", "7", "8"]

      expect(board.available_spot(2)).to be true
    end
  end

  describe "#fill_spot" do
    it 'places marker on the board' do
      spot = '1'
      marker = 'X'
      board.fill_spot(spot, marker)

      expect(board.surface[1]).to eq('X')
    end
  end

  describe 'solved_board?' do
    context 'checks if any rows are solved' do
      it 'returns solved row if a row is solved' do
        board.surface = ["X", "X", "X", "3", "4", "5", "6", "7", "Y"]

        expect(board.solved_board?).to be_truthy
        expect(board.solved_board?).to eq(['X', 'X', 'X'])
      end
    end

    context 'checks if any columns are solved' do
      it 'returns solved column if a column is solved' do
        board.surface = ["X", "1", "Y", "X", "Y", "5", "X", "7", "Y"]

        expect(board.solved_board?).to be_truthy
        expect(board.solved_board?).to eq(['X', 'X', 'X'])
      end
    end

    context 'checks if any diagonals are solved' do
      it 'returns solved diagonal if the left diagonal is solved' do
        board.surface = ["X", "1", "Y", "3", "X", "Y", "Y", "7", "X"]

        expect(board.solved_board?).to be_truthy
        expect(board.solved_board?).to eq(['X', 'X', 'X'])
      end

      it 'returns solved diagonal if the right diagonal is solved' do
        board.surface = ["X", "1", "Y", "3", "Y", "X", "Y", "7", "X"]

        expect(board.solved_board?).to be_truthy
        expect(board.solved_board?).to eq(['Y', 'Y', 'Y'])
      end
    end

    it 'returns nothing if a row is not solved' do
        board.surface = ["X", "Y", "X", "3", "4", "5", "6", "7", "Y"]

        expect(board.solved_board?).to be_falsey
        expect(board.solved_board?).to eq nil
      end
  end

  describe "#tied_board?" do
    it 'returns true if the board is tied' do
      board.surface = ["X", "Y", "X", "X", "Y", "Y", "Y", "X", "Y"]

      expect(board.tied_board?).to be true
    end

    it 'returns false if the board is not tied' do
      board.surface = ["1", "Y", "X", "X", "Y", "Y", "Y", "X", "Y"]

      expect(board.tied_board?).to be false
    end

    it 'returns false if the board is solved' do
      board.surface = ["X", "Y", "X", "X", "Y", "Y", "X", "X", "Y"]

      expect(board.tied_board?).to be false
    end
  end
end