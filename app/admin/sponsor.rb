ActiveAdmin.register Sponsor do
  permit_params :homepage, :name, :description, :url, :avatar, competition_ids: [], team_season_ids: []


  filter :name
  filter :phone
  filter :created_at
  # index do
  #   selectable_column
  #   id_column
  #   column :email
  #   column :name
  #   column :phone
  #   column :current_sign_in_at
  #   column :sign_in_count
  #   column :created_at
  #   actions
  # end

  show do |ad|
    attributes_table do
      row :name
      row :description
      row :url

      row :photo do
        image_tag(ad.avatar.url(:medium))
      end
    end
  end

  form do |f|
    f.inputs "Coach Details" do
      f.input :homepage
      f.input :name
      f.input :description
      f.input :url
      f.input :competitions, :as => :select, :input_html => {:multiple => true}
      f.input :team_seasons, :as => :select, collection: TeamSeason.includes(:team, :season).all.collect {|p| [ p.team.name + " " + p.season.start_year.to_s + "/" + p.season.end_year.to_s, p.id ] }, :input_html => {:multiple => true}
      f.input :avatar, :as => :file, :hint => image_tag(f.object.avatar.url(:thumb))
    end
    f.actions
  end

end
