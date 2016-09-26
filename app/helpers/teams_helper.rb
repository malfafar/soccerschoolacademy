module TeamsHelper

  def get_level(level)
    if level == -1
      t("strings.levels.no_level")
    else
      get_levels[level]
    end
  end

  def get_levels
    levels = [  'Traquinas',
                'Petizes',
                'Benjamins',
                'Infantis']
  end

  def get_levels_options
    array = []
    i=0
    get_levels.each do |level|
      array.push([level,i])
      i+=1
    end
    array
  end
end
