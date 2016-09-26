module TeamSeasonsHelper

  def get_state(state)
    if state == nil
      t("strings.states.none")
    else
      get_states[state]
    end
  end

  def get_state_initial(state)
    if state == nil
      "N"
    else
      get_states[state][0]
    end
  end

  def get_states
    states = [  I18n.t("strings.states.none"),
                I18n.t("strings.states.present"),
                I18n.t("strings.states.miss"),
                I18n.t("strings.states.late"),
                I18n.t("strings.states.called"),
                I18n.t("strings.states.called_confirmed"),
                I18n.t("strings.states.called_denied")
              ]
  end

  def state_none()
    0
  end

  def state_presence()
    1
  end

  def state_fault()
    2
  end

  def state_late()
    3
  end

  def state_called_no_answer()
    4
  end

  def state_called_confirmed()
    5
  end

  def state_called_denied()
    6
  end


  def get_states_options
    array = []
    i=0
    get_states.each do |state|
      array.push([state,i])
      i+=1
    end
    array
  end

  def get_state_colors(state)
    states = [  '#6666CC',
                '#0cb329',
                '#ff0000',
                '#e26e34',
                '#87ddff',
                '#00aaff',
                '#a9a9a9']
    if state == nil
      return states[0]
    else
      return states[state]
    end
  end

  def get_permission(permission)
    get_permission_types[permission]
  end

  def get_permission_types
    kinds = [t("strings.permissions.all_team"),
            t("strings.permissions.player_only")]
  end


  def get_permissions
    array = []
    i=0
    get_permission_types.each do |kind|
      array.push([kind, i])
      i+=1
    end
    array
  end
end
