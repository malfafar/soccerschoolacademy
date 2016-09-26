require 'rails_helper'

RSpec.describe CoachPlayersController, type: :controller do


  let(:valid_player_attributes) {
    {
      name: Faker::Name.name,
      birthday: Faker::Date.backward(),
      address: Faker::Address.street_name,
      zipcode: "5896-458",
      phone: "910000000",
      district: Faker::Address.state,
      birthplace: Faker::Address.city,
      nacionality: Faker::Address.country,
      id_card_number: Faker::Number.number(9),
      vat_id: Faker::Number.number(9),
      guardian_family_degree: Faker::Lorem.word,
      second_parent: Faker::Name.name,
      guardian_id: 1
    }
  }

  let(:valid_player_auth_attributes) {
    {
      email: Faker::Internet.email,
      password: "12345678",
      password_confirmation: "12345678"
    }
  }


  let(:valid_guardian_attributes) {
    {
      name: Faker::Name.name,
      phone: "910000000"
    }
  }

  let(:valid_guardian_auth_attributes) {
    {
      email: Faker::Internet.email,
      password: "12345678",
      password_confirmation: "123456789"

    }
  }

  # let(:empty_player_attributes)
  # {
  #   {
  #
  #   }
  # }

  describe "PUT #update" do
    login_coach

    let(:new_valid_player_attributes) {
      {
        name: Faker::Name.name,
        phone: "910000000",
        birthday: Faker::Date.backward(),
        zipcode: "5896-458"
      }
    }

    let(:new_valid_player_auth_attributes) {
      {
        email: Faker::Internet.email
      }
    }

    let(:new_valid_guardian_attributes) {
      {
          name: Faker::Name.name,
          phone: "910000000"
      }
    }

    let(:new_valid_guardian_auth_attributes) {
      {
        email: Faker::Internet.email
      }
    }

    let(:empty_player_attributes){
      {

      }
    }

    context "with valid params" do
      context 'the player has no player auth and has a guardian' do

        context 'changes are made to the player only' do

          it 'updates the player attributes' do
            player = Player.create! valid_player_attributes
            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it "assigns the requested player as @player" do

            player = Player.create! valid_player_attributes
            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            expect(assigns(:player)).to eq(player)
          end

          it "redirects to the player" do
            player = Player.create! valid_player_attributes
            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            expect(response).to redirect_to(coach_index_players_path)
          end
        end

        context 'adds new PlayerAuth' do
          it 'updates the player' do
            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            player = Player.create! valid_player_attributes
            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'adds a new player auth' do
            player = Player.create! valid_player_attributes
            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(PlayerAuth, :count).by(1)
          end
        end

        context 'adds new player auth, guardian and guardian auth' do
          it 'updates the player attributes' do
            player = Player.create! valid_player_attributes
            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'adds a new Player Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            }.to change(PlayerAuth, :count).by(1)
          end

          it 'adds a new Guardian' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes }
            }.to change(Guardian, :count).by(1)
          end

          it 'adds a new Guardian Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes }
            }.to change(GuardianAuth, :count).by(1)
          end
        end

        context 'adds new player auth and a guardian' do
          it 'updates the player attributes' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes }
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'adds a new Player Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes }
            }.to change(PlayerAuth, :count).by(1)
          end

          it 'adds a new Guardian' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes }

            }.to change(Guardian, :count).by(1)
          end

          it 'Doesnt add a new Guardian Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes }

            }.to change(GuardianAuth, :count).by(0)
          end
        end

        context 'adds new guardian' do
          it 'updates the player attributes' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'doesnt add a new Player Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            }.to change(PlayerAuth, :count).by(0)
          end

          it 'adds a new Guardian' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            }.to change(Guardian, :count).by(1)
          end

          it 'doesnt add a new Guardian Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            }.to change(GuardianAuth, :count).by(0)
          end
        end

        context 'adds new guardian and guardian auth' do
          it 'updates the player attributes' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload
            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'doesnt add a new Player Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            }.to change(PlayerAuth, :count).by(0)
          end

          it 'adds a new Guardian' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload

            }.to change(Guardian, :count).by(1)
          end

          it 'adds a new Guardian Auth' do
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload

            }.to change(GuardianAuth, :count).by(1)
          end
        end
      end

      context 'the player already has a player auth' do
        context 'will update the player' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
          end
        end

        context 'will update the player auth' do
          it 'updates the player auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            empty_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes

            put :update, {:id => player.to_param, :player => empty_player_attributes}
            player.reload

            expect(player.player_auth.email).to eq(empty_player_attributes[:player_auth_attributes][:email])
          end
        end

        context 'will update the player and player auth' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
            end

          it 'updates the player auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.player_auth.email).to eq(new_valid_player_attributes[:player_auth_attributes][:email])
          end
        end

        context 'will update the player and add guardian' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'adds a guardian' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(Guardian, :count).by(1)
          end
        end

        context 'will update the player, add guardian and guardian auth' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes


            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'adds a guardian' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(Guardian, :count).by(1)
          end

          it 'adds a guardian auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(GuardianAuth, :count).by(1)
          end
        end

        context 'will update the player and player auth will also add guardian' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'updates the player auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.player_auth.email).to eq(new_valid_player_attributes[:player_auth_attributes][:email])
          end

          it 'adds a guardian' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(Guardian, :count).by(1)
          end

        end

        context 'will update the player and player auth will also add guardian and guardian auth' do
          it 'updates the player' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.name).to eq(new_valid_player_attributes[:name])
          end

          it 'updates the player auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            put :update, {:id => player.to_param, :player => new_valid_player_attributes}
            player.reload

            expect(player.player_auth.email).to eq(new_valid_player_attributes[:player_auth_attributes][:email])
          end

          it 'adds a guardian' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(Guardian, :count).by(1)
          end

          it 'adds a guardian auth' do
            valid_player_attributes[:player_auth_attributes]  = valid_player_auth_attributes
            player = Player.create! valid_player_attributes

            new_valid_player_attributes[:player_auth_attributes] = new_valid_player_auth_attributes
            new_valid_player_attributes[:guardian_attributes] = new_valid_guardian_attributes
            new_valid_player_attributes[:guardian_attributes][:guardian_auth_attributes] = new_valid_guardian_auth_attributes

            expect {
              put :update, {:id => player.to_param, :player => new_valid_player_attributes}
              player.reload
            }.to change(GuardianAuth, :count).by(1)
          end
        end



      end
    end
  end
end
