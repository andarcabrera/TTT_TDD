require 'rspec'
require 'spec_helper'
require_relative '../lib/player_factory'

describe PlayerFactory do

  let(:info) { double('info') }
  let(:input) { double('input') }
  let(:output) { double('output', :print => nil) }
  let(:view) { double('view', :starting_player => nil) }

  describe '#players' do
    it 'creates a player for each player_info information set' do
      factory = PlayerFactory.new(input, output, view, info)
      allow(info).to receive(:player_info).and_return([['Anda', 'X'], ['Alex', 'Y']])
      allow(input).to receive(:get_user_input).and_return('y')


      expect(factory.players.count).to eq(2)
    end

    context 'receives data sets for 2 human players' do
      it 'creates 2 human players' do
        factory = PlayerFactory.new(input, output, view, info)
        allow(info).to receive(:player_info).and_return([['Eli', 'X'], ['Andrew', 'Y']])
        allow(input).to receive(:get_user_input).and_return('y')


        expect(factory.players[0].class).to be(HumanPlayer)
        expect(factory.players[1].class).to be(HumanPlayer)
      end
    end

    context 'receives data sets for 2 computer players' do
      it 'creates 2 computer players' do
        factory = PlayerFactory.new(input, output, view, info)
        allow(info).to receive(:player_info).and_return([['computer', 'C'], ['computer', 'Z']])
        allow(input).to receive(:get_user_input).and_return('y')


        expect(factory.players[0].class).to be(ComputerPlayer)
        expect(factory.players[1].class).to be(ComputerPlayer)
      end
    end

    context 'receives data sets for 1 computer player and 1 human player' do
      it 'creates 1 computer player and 1 human player' do
        factory = PlayerFactory.new(input, output, view, info)
        allow(info).to receive(:player_info).and_return([['Anda', 'A'], ['computer', 'Z']])
        allow(input).to receive(:get_user_input).and_return('y')

        expect(factory.players[0].class).to be(HumanPlayer)
        expect(factory.players[1].class).to be(ComputerPlayer)
      end
    end

    context 'players are ordered with starting player first' do
      it 'it start with player with marker Y' do
        factory = PlayerFactory.new(input, output, view, info)
        allow(info).to receive(:player_info).and_return([['Anda', 'X'], ['computer', 'Y']])
        allow(input).to receive(:get_user_input).and_return('n')

        expect(factory.players[0].class).to be(ComputerPlayer)
      end
    end
  end
end