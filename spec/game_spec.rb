require_relative '../lib/game'

# rubocop:disable Metrics/BlockLength

describe Game do
  subject(:game) { described_class.new }
  let(:board) { instance_double(Board, show: nil, full?: full_board, game_over?: game_over) }
  let(:full_board) { false }
  let(:game_over) { false }
  let(:player_one) { instance_double(Player, name: 'An') }
  let(:player_two) { instance_double(Player, name: 'Bo') }

  before do
    allow(game).to receive(:board).and_return(board)
    allow(game).to receive(:display_intro)
    allow(game).to receive(:create_player).with(1).and_return(player_one)
    allow(game).to receive(:create_player).with(2).and_return(player_two)
    allow(game).to receive(:puts)
  end

  describe '#setup_players' do
    it 'creates two players' do
      expect(game).to receive(:create_player).twice
      game.setup_players
    end

    it 'selects one player to go first' do
      game.setup_players
      current_player = game.instance_variable_get(:@current_player)
      expect(current_player).not_to be nil
    end
  end

  describe '#play' do
    let(:game_over) { true }

    it 'stops when game over' do
      allow(game).to receive(:player_turns)
      expect(game).not_to receive(:switch_player)
      game.play
    end
  end
end
