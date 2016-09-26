module ControllerMacros

  FactoryGirl.define do
    factory :player_auth do
      email { Faker::Internet.email }
      password "password"
      password_confirmation "password"
      confirmed_at Date.today
    end
  end

  FactoryGirl.define do
    factory :coach do
      email { Faker::Internet.email }
      password "password"
      password_confirmation "password"
      name { Faker::Name.name }
      phone "+351-000000000"
      #confirmed_at Date.today
    end
  end

  FactoryGirl.define do
    factory :guardian_auth do
      email { Faker::Internet.email }
      password "password"
      password_confirmation "password"
      confirmed_at Date.today
    end
  end

  FactoryGirl.define do
    factory :player do
      name {Faker::Name.name}
      birthday {Faker::Date.backward()}
      address {Faker::Address.street_name}
      zipcode {"5896-458"}
      phone {Faker::PhoneNumber.phone_number}
      district {Faker::Address.state}
      birthplace {Faker::Address.city}
      nacionality {Faker::Address.country}
      id_card_number {Faker::Number.number(9)}
      vat_id {Faker::Number.number(9)}
    end
  end

  def login_coach
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:coach]
      coach = FactoryGirl.create(:coach)
      sign_in coach # Using factory girl as an example
    end
  end

  def login_player_auth
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:player_auth]
      player_auth = FactoryGirl.create(:player_auth)
      player_auth.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in player_auth
    end
  end


  def login_guardian_auth
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:guardian_auth]
      guardian_auth = FactoryGirl.create(:guardian_auth)
      guardian_auth.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in guardian_auth
    end
  end
end
