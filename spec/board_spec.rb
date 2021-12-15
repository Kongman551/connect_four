require_relative "../lib/board"

describe Board do
  describe subject(:board) { described_class.new }

  describe "#check_match?" do
    context "when the board contains four in a row" do
      it "returns true" do
        match_arr = [["X", "X", "X", "X"]]
        player_sym = "X"
        sol = board.check_match?(match_arr, player_sym)
        expect(sol).to be true
      end
    end

    context "when the board DOES NOT contain four in a row" do
      it "returns false" do
        unmatch_arr = [["X", "X", "X", "."]]
        player_sym = "X"
        sol = board.check_match?(unmatch_arr, player_sym)
        expect(sol).to be false
      end
    end
  end

  describe "#update_board" do
    subject(:board_update) { described_class.new }
    let(:grid) { board_update.instance_variable_get(:@grid) }

    context "when board is empty" do
      it "adds player symbol at last row" do
        board_update.update_board(4, "X")
        expect(grid[5][4]).to eq("X")
      end
    end

    context "when board contains 2 pieces in column 3" do
      before do
        board_update.update_board(3, "X")
        board_update.update_board(3, "X")
      end
      it "adds player symbol to row 3" do
        board_update.update_board(3, "X")
        expect(grid[3][3]).to eq("X")
      end
    end
  end

  subject(:board_diag) { described_class.new }
  let(:grid) { board_diag.instance_variable_get(:@grid) }

  describe "#left_diagonals" do
    context "when the board contains four in a row diagonally" do
      before do
        symbol = "X"
        grid[0][4] = symbol
        grid[1][3] = symbol
        grid[2][2] = symbol
        grid[3][1] = symbol
      end
      it "returns true" do
        sol = board_diag.left_diagonals(0, 4, "X")
        expect(sol).to be true
      end
    end

    context "when the board does NOT contains four in a row diagonally" do
      it "returns false" do
        sol = board_diag.left_diagonals(0, 4, "X")
        expect(sol).to be false
      end
    end
  end

  describe "#right_diagonals" do
    context "when the board contains four in a row diagonally" do
      before do
        symbol = "X"
        grid[0][0] = symbol
        grid[1][1] = symbol
        grid[2][2] = symbol
        grid[3][3] = symbol
      end
      it "returns true" do
        sol = board_diag.right_diagonals(0, 0, "X")
        expect(sol).to be true
      end
    end

    context "when the board does NOT contains four in a row diagonally" do
      it "returns false" do
        sol = board_diag.right_diagonals(0, 0, "X")
        expect(sol).to be false
      end
    end
  end
end
