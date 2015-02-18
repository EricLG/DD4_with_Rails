#require 'import_data'

class WelcomeController < ApplicationController

 #include ImportData

  def index

  end

  def import
    import_weapons

    redirect_to :root
  end


    def import_weapons
    sources = Source.all
    levels  = ObjectLevel.all
    groups  = WeaponGroup.all
    filename = Dir.entries('tmp/import_files').find{|f| f.match(/export_arme_OK/)}
    ActiveRecord::Base.transaction do
      File.open(File.join('tmp/import_files', filename), 'r') do |f|
        f.readline
        f.each_line do |l| # "Titre";"Description";"Altération";"Niveau minimum";"Prix par niveau et altération";"Arme";"Critique";"Propriété";"Pouvoir";"Source";"Spécial"
          array_line = l.split(/";"/, -1)
          m = MagicWeapon.new(
            name:           clear_field(array_line[0]),
            description:    clear_field(array_line[1]),
            alteration:     clear_field(array_line[2]),
            critical:       clear_field(array_line[6]),
            property:       clear_field(array_line[7]),
            power:          clear_field(array_line[8]),
            special:        clear_field(array_line[10]),
            source:         sources.find{|s| s.name == clear_field(array_line[9])},
            object_levels:  calcul_level_array(clear_field(array_line[3]).to_i, levels),
            weapon_groups:  find_weapon_groups(clear_field(array_line[5]), groups)
            )
          if m.valid?
            begin
              m.save!
            rescue
              logger.debug "Erreur lors de l'ajout de l'arme suivante: #{m.name}"
              logger.debug "#{m.errors.full_messages}"
            end
          else
             logger.debug "Erreur de validation sur l'arme #{m.name}"
             logger.debug "#{m.errors.full_messages}"
          end

        end
      end
    end
    c = MagicWeapon.count
    puts "#{c} armes magiques ont été crées"
  end

  def clear_field(field)
    field = field.strip
    if field.first == '"'
      field = field[1..-1]
    end
    if field.last == '"'
      field = field[0...-1]
    end
    field
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
    array
  end

end
