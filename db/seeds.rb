# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
  c1 = Coach.create(name: "Jorge Jesus", email: "j@j.com", password: "12345678", phone:"910000000")
  c2 =Coach.create(name: "rui vitoria", email: "r@j.com", password: "12345678", phone:"910000000")
  c3 = Coach.create(name: "lotapegui", email: "l@j.com", password: "12345678", phone:"910000000")
  c4 = Coach.create(name: "inacio", email: "i@j.com", password: "12345678", phone:"910000000")
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  s1 = Season.create(start_year: 2014, end_year: 2015)
  s2 = Season.create(start_year: 2015, end_year: 2016)
  barcelona = Team.create(name: "Barcelona", description: "barcelona description")
  real = Team.create(name: "Real Madrid", description: "barcelona description")
  atletico = Team.create(name: "Atletico Madrid", description: "barcelona description")

  ga1 = GuardianAuth.create(email: "dd@g.com", password: "123456789", confirmed_at: Time.now)
  g1 = Guardian.new(name: "D. Dolores", phone: "910000000")
  g1.save
  ga1.guardian = g1
  ga1.save

  ga2 = GuardianAuth.create(email: "g@g.com", password: "123456789", confirmed_at: Time.now)
  g2 = Guardian.new(name: "Guardiola", phone: "910000000")
  g2.save
  ga2.guardian = g2
  ga2.save

  ga3 = GuardianAuth.create(email: "m@g.com", password: "123456789", confirmed_at: Time.now)
  g3 = Guardian.new(name: "Maradona", phone: "910000000")
  g3.save
  ga3.guardian = g3
  ga3.save

  ga4 = GuardianAuth.create(email: "so@g.com", password: "123456789", confirmed_at: Time.now)
  g4 = Guardian.new(name: "Mourinho", phone: "910000000")
  g4.save
  ga4.guardian = g4
  ga4.save

  ga5 = GuardianAuth.create(email: "bdc@g.com", password: "123456789", confirmed_at: Time.now)
  g5 = Guardian.new(name: "Bruno de Carvalho", phone: "910000000")
  g5.save
  ga5.guardian = g5
  ga5.save

  real1 = TeamSeason.create()
  real1.team = real
  real1.season = s1
  real1.coaches << c1
  real1.save

  real2 = TeamSeason.create()
  real2.team = real
  real2.season = s2
  real2.coaches << c1
  real2.coaches << c4
  real2.save

  atletico1 = TeamSeason.create()
  atletico1.team = atletico
  atletico1.season = s1
  atletico1.coaches << c2
  atletico1.save

  atletico2 = TeamSeason.create()
  atletico2.team = atletico
  atletico2.season = s2
  atletico2.coaches << c2
  atletico2.save


  barcelona1 = TeamSeason.create()
  barcelona1.team = barcelona
  barcelona1.season = s1
  barcelona1.coaches << c3
  barcelona1.save

  barcelona2 = TeamSeason.create()
  barcelona2.team = barcelona
  barcelona2.season = s2
  barcelona2.coaches << c3
  barcelona2.save

  competition1 = Competition.create(nr_teams: 20, name: "Competicao 1", knockout: false)
  competition2 = Competition.create(nr_teams: 10, name: "Competicao 2", knockout: false)

  competition1.team_seasons << [real1, atletico1, barcelona1]
  competition2.team_seasons << [real2, atletico2, barcelona2]

  s1.competitions << competition1
  s2.competitions << competition2

  player = Player.create(name: "Marc-André ter Stegen", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  pa = PlayerAuth.new(email: "stegen@p.com", password: "12345678", confirmed_at: Time.now)

  player_season = PlayerSeason.create(shirt_name: "Stegen", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  pa.player = player
  pa.save
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Stegen", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g1.players << player

  player = Player.create(name: "Gerard Pique", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "pique", shirt_number: 2, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "pique", shirt_number: 2, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save

  player = Player.create(name: "Dani Alves", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124912", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "alves", shirt_number: 3, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "alves", shirt_number: 3, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save

  player = Player.create(name: "Jordi Alba", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124129412", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "alba", shirt_number: 4, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "alba", shirt_number: 4, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save

  player = Player.create(name: "Andres Iniesta", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124912412", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "iniesta", shirt_number: 5, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "iniesta", shirt_number: 5, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g5.players << player

  player = Player.create(name: "Ivan Rakitic", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124912", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Ivan Rakitic", shirt_number: 6, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Ivan Rakitic", shirt_number: 6, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g1.players << player

  player = Player.create(name: "Luis Suarez", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Luis Suarez", shirt_number: 7, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Luis Suarez", shirt_number: 7, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g5.players << player

  player = Player.create(name: "Lionel Messi", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Lionel Messi", shirt_number: 8, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Lionel Messi", shirt_number: 8, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g5.players << player

  player = Player.create(name: "Neymar", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Neymar", shirt_number: 9, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Neymar", shirt_number: 9, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g1.players << player

  player = Player.create(name: "Rafinha", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Rafinha", shirt_number: 10, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Rafinha", shirt_number: 10, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save

  player = Player.create(name: "Luis Suarez", birthday: Time.now, address: "cenas", zipcode: "3040-333", phone:"123456789", birthplace: "Coimbra", nationality: "PT", id_card_number: "1234567", vat_id: "124124192", guardian_family_degree: "9ano")
  player_season = PlayerSeason.create(shirt_name: "Luis Suarez", shirt_number: 11, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona2
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Luis Suarez", shirt_number: 11, shoe_size: 43)
  player_season.player = player
  player_season.team_season = barcelona1
  player_season.save
  g4.players << player

  date = Time.now
  player = Player.create(name: "Cristiano Ronaldo", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "PT", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "CR", shirt_number: 7, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "CR", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g1.players << player

  player = Player.create(name: "Karim Benzema", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "FR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Karim", shirt_number: 9, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Karim", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g4.players << player


  player = Player.create(name: "Gareth Bale", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "WL", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Bale", shirt_number: 11, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Bale", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save

  player = Player.create(name: "Pepe", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "PT", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Pepe", shirt_number: 2, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Pepe", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g4.players << player


  player = Player.create(name: "Sergio Ramos", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ES", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Ramos", shirt_number: 3, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Ramos", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g4.players << player

  player = Player.create(name: "Keylor Navas", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "CR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Navas", shirt_number: 12, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Navas", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g3.players << player

  player = Player.create(name: "Marcelo", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "BR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Marcelo", shirt_number: 5, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Marcelo", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g1.players << player

  player = Player.create(name: "Arbeloa", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ES", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Arbeloa", shirt_number: 7, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Arbeloa", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save

  player = Player.create(name: "James Rodriguez", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "COL", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "James", shirt_number: 10, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "James", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save

  player = Player.create(name: "Toni Kroos", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "GER", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Kroos", shirt_number: 8, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Kroos", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g3.players << player

  player = Player.create(name: "Luka Modric", birthday: date, address: "Rua de Madrid", district: "Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "CRT", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Modric", shirt_number: 6, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Modric", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = real2
  player_season.save
  g1.players << player

  player = Player.create(name: "Jan Oblak", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "SRV", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Oblak", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Oblak", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g1.players << player

  player = Player.create(name: "Juanfran", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ES", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Juanfran", shirt_number: 7, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Juanfran", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g3.players << player

  player = Player.create(name: "Godin", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "URU", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Godin", shirt_number: 3, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Godin", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save

  player = Player.create(name: "Stefan Savic", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "MNTNGR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Savic", shirt_number: 2, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Savic", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g1.players << player

  player = Player.create(name: "Guilherme Siqueira", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "BR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Siqueira", shirt_number: 5, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Siqueira", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g2.players << player

  player = Player.create(name: "Tiago", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "PT", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Tiago", shirt_number: 6, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Tiago", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g2.players << player

  player = Player.create(name: "Koke", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ES", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Koke", shirt_number: 10, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Koke", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g2.players << player

  player = Player.create(name: "Gabi", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ES", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Gabi", shirt_number: 8, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Gabi", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save

  player = Player.create(name: "Griezmann", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "FR", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Griezmann", shirt_number: 9, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Griezmann", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g1.players << player

  player = Player.create(name: "Jackson Martinez", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "COL", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Jackson", shirt_number: 11, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Jackson", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g1.players << player

  player = Player.create(name: "Angel Correa", birthday: date, address: "Rua de Atletico Madrid", district: "Atletico Madrid", zipcode: "5555-444", phone: "123654789", birthplace: "Madeira", nationality: "ARG", id_card_number: "123456", vat_id: "123456799", guardian_family_degree: "Pai")
  player_season = PlayerSeason.create(shirt_name: "Correa", shirt_number: 19, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico1
  player_season.save
  player_season = PlayerSeason.create(shirt_name: "Correa", shirt_number: 1, shoe_size: 43)
  player_season.player = player
  player_season.team_season = atletico2
  player_season.save
  g1.players << player

  real_home = true
  atletico_away = false




  (0..20).each do |i|
    if i.odd?
      practice = Practice.create(practice_date: Time.now + i.days, observations: "adasdasdav as a d a fa a fafsfafafafsafas")
      practice.team_season = barcelona2
      practice.save
      barcelona2.players.each do |pp|
        player_practice = PlayerPractice.new
        player_practice.player = pp
        player_practice.practice = practice
        player_practice.save
      end

      practice = Practice.create(practice_date: Time.now + i.days, observations: "adasdasdav as a d a fa a fafsfafafafsafas")
      practice.team_season = real2
      practice.save
      real2.players.each do |pp|
        player_practice = PlayerPractice.new
        player_practice.player = pp
        player_practice.practice = practice
        player_practice.save
      end

      practice = Practice.create(practice_date: Time.now + i.days, observations: "adasdasdav as a d a fa a fafsfafafafsafas")
      practice.team_season = atletico2
      practice.save
      atletico2.players.each do |pp|
        player_practice = PlayerPractice.new
        player_practice.player = pp
        player_practice.practice = practice
        player_practice.save
      end

    else

      if real_home
        home_id = real2.id
        real_home = false
        if !atletico_away
          away_id = barcelona2.id
          atletico_away = true
        else
          away_id = atletico2.id
          atletico_away = false
        end
      else
        home_id = barcelona2.id
        real_home = true
        if !atletico_away
          away_id = real2.id
          atletico_away = true
        else
          away_id = atletico2.id
          atletico_away = false
        end
      end
      match = Match.create(match_date: Time.now + i.days, home_team_id: home_id, away_team_id: away_id)


      competition2.matches << match

      home_players = match.home_team.players
      away_players = match.away_team.players
      home_players.each do |hplayer|
        Statistic.create(player_id: hplayer.id, match_id: match.id)
      end
      away_players.each do |aplayer|
        Statistic.create(player_id: aplayer.id, match_id: match.id, home: false)
      end
    end
  end

  Post.create(coach_id: c1.id, title: "True Olympic spirit found in those who come last", text: "True Olympic spirit found in those who come last 1 hour 45 min ago True Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found", private: false )
  Post.create(coach_id: c2.id, title: "True Olympic spirit found in those who come last", text: "True Olympic spirit found in those who come last 1 hour 45 min ago True Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found", private: false )
  Post.create(coach_id: c3.id, title: "True Olympic spirit found in those who come last", text: "True Olympic spirit found in those who come last 1 hour 45 min ago True Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found", private: false )
  Post.create(coach_id: c4.id, title: "True Olympic spirit found in those who come last", text: "True Olympic spirit found in those who come last 1 hour 45 min ago True Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found in those who come lastTrue Olympic spirit found", private: false )

when "production"

end
