require 'rails_helper'

RSpec.describe Player, type: :model do


  # expect(array).to include(3)
  #expect(array, :empty?).to be(true)
  #expect(array, :empty?).to be(false)


  describe '.search' do


    context 'search for something existing' do
      it "returns an array of players" do
        @player1 = Player.create!(name: "Ter Stegen", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
        @player2 = Player.create!(name: "Tertulia", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
        Player.create!(name: "Ana", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
        expect(Player.search("Ter")).to match_array([@player2, @player1])
      end
    end

    context 'search for something inexistent' do
      it "returns an empty array" do
          Player.create(name: "Joao", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
          Player.create(name: "Pinto", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
          Player.create(name: "Ana", phone: "910000000", zipcode: "4562-145", birthday: Time.now)
          expect(Player.search("Ter")).to match_array([])
      end
    end

  end

end
