require_relative "../lib/game"

describe Game do
  subject(:game) { described_class.new }

  describe "#valid_string" do
    context "when input is valid" do
      it "returns true" do
        v_string = "Zach"
        ans = game.valid_string?(v_string)
        expect(ans).to be true
      end
    end

    context "when input is invalid" do
      it "returns an error" do
        inv_input = 56
        ans = game.verify_input(inv_input)
        expect(ans).to be false
      end
    end
  end

  describe "#turn_count" do
    subject(:game_count) { described_class.new }

    context "when method is called" do
      it "increases by 1" do
        game_count.turn_count
        expect(game_count.turn).to eq 1
      end
    end
  end 

  describe "#player_turn" do
    subject(:game_turn) { described_class.new }
    let(:p1) { game_turn.instance_variable_get(:@p1) }
    let(:p2) { game_turn.instance_variable_get(:@p2) }

    context "when turn is even" do
      it "returns player 1" do
        turn_num = 1
        result = game_turn.player_turn(turn_num)
        expect(result.name).to eq(p1.name)
      end
    end

    context "when turn is odd" do
      it "returns player 2" do
        turn_num = 2
        result = game_turn.player_turn(turn_num)
        expect(result.name).to eq(p2.name)
      end
    end
  end

  describe "#game_over?" do
    subject(:game_end) { described_class.new }

    context "when player is determined winner" do
      xit "game ends" do
      end
    end
  end
end
