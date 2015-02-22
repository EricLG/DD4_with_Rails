module ImportData


  def import_weapons
    sources = Source.all
    levels  = ObjectLevel.all
    groups  = WeaponGroup.all
    filename = Dir.entries('tmp/import_files').find{|f| f.match(/export_arme_OK/)}
    File.open(File.join('tmp/import_files', filename), 'r') do |f|
      f.readline
      f.each_line do |l| # "Titre";"Description";"Altération";"Niveau minimum";"Prix par niveau et altération";"Arme";"Critique";"Propriété";"Pouvoir";"Source";"Spécial"
        array_line = l.split(/";"/, -1)
        binding.pry if "Arme chapardeuse" == array_line[0].strip[1...-1]
        m = MagicWeapon.new(
          name:           array_line[0].strip[1...-1],
          description:    array_line[1].strip[1...-1],
          alteration:     array_line[2].strip[1...-1],
          critical:       array_line[6].strip[1...-1],
          property:       array_line[7].strip[1...-1],
          power:          array_line[8].strip[1...-1],
          special:        array_line[10].strip[1...-1],
          source:         sources.find{|s| s.name == array_line[9][1...-1]},
          object_levels:  calcul_level_array(array_line[3].strip[1...-2].to_i, levels),
          weapon_groups:  find_weapon_groups(array_line[5].strip[1...-1], groups)
          )
        if m.valid?
          begin
            m.save!
          rescue
            puts "Erreur lors de l'enregistrement sur la ligne :"
            puts l
          end
        else
          puts '--------------'
          puts "Erreur sur l'arme #{m.name}"
          puts m.errors.full_messages
          puts "Fin de l'erreur -----"
        end

      end
    end
    c = MagicWeapon.count
    puts "#{c} armes magiques ont été crées"
  end

  def calcul_level_array(min, levels)
    array = []
    while min < 31 && min > 0
      level = levels.find{|l| l.level == min}
      array << level
      min += 5
    end
    array
  end

  def find_weapon_groups(data, groups)
    array = []
    datas = data.split(',', -1)
    datas.each do |d|
      array << groups.find{|g| g.name == d.strip}
    end
    if array.nil? || array.empty?
      binding.pry
    end
    array
  end

end
