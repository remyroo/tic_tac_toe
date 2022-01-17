require_relative '../lib/board'

# rubocop:disable Metrics/BlockLength

describe Board do
  subject(:board) { described_class.new }

  describe '#update' do
    player_position = 1
    player_marker = 'x'

    context 'when target cell is empty' do
      it 'updates the cell with the new value' do
        expect(board.grid[0][0]).to eq nil
        board.update(player_position, player_marker)
        expect(board.grid[0][0]).to eq player_marker
      end
    end

    context 'when target cell is not empty' do
      before { board.update(player_position, player_marker) }

      it 'does not update the cell' do
        result = board.update(player_position, player_marker)
        expect(result).to be false
      end
    end
  end

  describe '#full?' do
    context 'when board is new' do
      it 'is not full' do
        expect(board).not_to be_full
      end
    end

    context 'when board is partially filled' do
      before do
        board.instance_variable_set(:@grid, [['x', nil, 'y']])
      end

      it 'is not full' do
        expect(board).not_to be_full
      end
    end

    context 'when board is full' do
      before do
        board.instance_variable_set(:@grid, [%w[x x y], %w[x y y], %w[x x y]])
      end

      it 'returns true' do
        expect(board).to be_full
      end
    end
  end

  describe '#game_over' do
    context 'when game is new' do
      it 'is not game over' do
        expect(board).not_to be_game_over
      end
    end

    context 'when there is a horizontal 3-in-a-row' do
      before do
        board.instance_variable_set(:@grid, [%w[x x x], ['y', nil, 'y'], [nil, nil, 'y']])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end

    context 'when there is a vertical 3-in-a-row' do
      before do
        board.instance_variable_set(:@grid, [['x', 'y', nil], ['x', nil, 'y'], ['x', nil, 'y']])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end

    context 'when there is a diagonal 3-in-a-row' do
      before do
        board.instance_variable_set(:@grid, [['x', 'y', nil], [nil, 'x', 'y'], [nil, 'y', 'x']])
      end

      it 'is game over' do
        expect(board).to be_game_over
      end
    end
  end
end
