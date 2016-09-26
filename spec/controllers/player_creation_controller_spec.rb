require 'rails_helper'

RSpec.describe PlayerAuths::RegistrationsController, type: :controller do

  let(:valid_player_auth_attributes){
    {
      email: Faker::Internet.email,
      password: "12345678",
      password_confirmation: "12345678"
    }
  }

  let(:empty_player_auth_attributes){
    {

    }
  }

  let(:valid_player_attributes){
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

  let(:valid_guardian_attributes){
    {
      name: Faker::Name.name,
      phone: "910000000"
    }
  }

  let(:valid_guardian_auth_attributes){
    {
      email: Faker::Internet.email,
      password: "12345678",
      password_confirmation: "12345678"
    }
  }


  describe "POST #create" do
    login_coach

    before :each do
      request.env['devise.mapping'] = Devise.mappings[:player_auth]
    end


    # With Guardian ID
    context 'with valid params' do
      context 'with player and selected GuardianAuth' do
        it 'creates a PlayerAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(1).and change(Player, :count).by(1).and change(GuardianAuth, :count).by(0).and change(Guardian, :count).by(0)
        end

        it 'creates a Player' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(1).and change(Player, :count).by(1).and change(GuardianAuth, :count).by(0).and change(Guardian, :count).by(0)
        end

        it 'doesn\'t create a GuardianAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(GuardianAuth, :count).by(0)
        end

        it 'doesn\'t create a Guardian' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(Guardian, :count).by(0)
        end
      end

      # Create guardian only



      context 'with Player and Guardian' do
        it 'creates a PlayerAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(1)
        end

        it 'creates a Player' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(Player, :count).by(1)
        end

        it 'creates a Guardian' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(Guardian, :count).by(1)
        end

        it 'doesn\'t create a GuardianAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(GuardianAuth, :count).by(0)
        end
      end

      context 'with Player and Guardian' do
        it 'creates a Player' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(Player, :count).by(1)
        end

        it 'creates a Guardian' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(Guardian, :count).by(1)
        end

        it 'doesn\'t create a PlayerAuth' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(0)
        end

        it 'doesn\'t create a GuardianAuth' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(GuardianAuth, :count).by(0)
        end
      end

      # Create GuardianAuth and guardian



      context 'with a PlayerAuth, Player, GuardianAuth and a Guardian)' do
        it 'creates PlayerAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes

          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(1)
        end

        it 'creates Player' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes

          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(Player, :count).by(1)
        end

        it 'creates Guardian' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes

          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(Guardian, :count).by(1)
        end

        it 'creates GuardianAuth' do
          valid_player_auth_attributes[:player_attributes] = valid_player_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          valid_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes

          expect {
            post :create, {:player_auth => valid_player_auth_attributes}
          }.to change(GuardianAuth, :count).by(1)
        end
      end

      context 'without PlayerAuth, with GuardianAuth and a Guardian)' do
        it 'creates a Player' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(Player, :count).by(1)
        end

        it 'doesn\'t create a PlayerAuth' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(PlayerAuth, :count).by(0)
        end

        it 'doesn\'t create a GuardianAuth' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(GuardianAuth, :count).by(1)
        end

        it 'doesn\'t create a Guardian' do
          empty_player_auth_attributes[:player_attributes] = valid_player_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes] = valid_guardian_attributes
          empty_player_auth_attributes[:player_attributes][:guardian_attributes][:guardian_auth_attributes] = valid_guardian_auth_attributes
          expect {
            post :create, {:player_auth => empty_player_auth_attributes}
          }.to change(Guardian, :count).by(1)
        end
      end
    end


  end
end
