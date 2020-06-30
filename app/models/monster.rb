class Monster < ApplicationRecord
  include ImportDataServices

  belongs_to :source
  has_many :chosen_monsters
  has_many :encounters, through: :chosen_monsters

  scope :categories, -> { pluck(:category).join(', ').split(', ').uniq.sort }
  scope :keywords, -> { pluck(:keywords).join(', ').split(', ').uniq.sort }

  RACE = %w[Animé Bête Créature\ magique Humanoïde].freeze # Type dans le fichier excel
  MAIN_ROLE = %w[Artilleur Brute Chasseur Contrôleur Franc-tireur Soldat].freeze
  SECOND_ROLE = %w[Élite Solo Sbire Normal].freeze
  ORIGIN = %w[Aberrante Élémentaire Féerique Immortelle Naturelle Ombreuse].freeze

  def show_level_name
    "Niv. #{level} | #{name}"
  end

  def self.import_monsters
    sources = Source.all
    filename = Dir.entries(Rails.root + 'lib/import_files').find { |f| f.match(/monstres.csv/) }
    return if filename.nil?

    ActiveRecord::Base.transaction do
      File.open(File.join(Rails.root, 'lib', 'import_files', filename), 'r') do |f|
        f.readline
        # "Nom";"Role";"Role secondaire";"Meneur";"Niveau";"Source";"Race/category";"XP";"Type/race";"Origine";"Mot cles";"Lieux de predilection"
        f.each_line do |l|
          m = Monster.create_monster_from_csv_line(l.split(/;/, -1), sources)
          logger.error "Erreur de validation sur le monstre #{m.name} : #{m.errors.full_messages}" unless m.valid?
          m.save!
        end
      end
    end
    c = Monster.count
    logger.debug "#{c} monstres ont été créés"
  end

  def self.create_monster_from_csv_line(array_line, sources)
    Monster.new(
      name: array_line[0],
      main_role: array_line[1],
      second_role: array_line[2],
      leader: array_line[3] == 'Oui',
      level: array_line[4],
      source: sources.find { |s| s.name == array_line[5] },
      category: array_line[6],
      px: array_line[7],
      race: array_line[8],
      origin: array_line[9],
      keywords: array_line[10]
    )
  end

  def self.level_to_xp(level)
    case level
    when 1..5
      100 + ((level - 1) * 25)
    when 6..9
      250 + ((level - 6) * 50)
    when 10..13
      500 + ((level - 10) * 100)
    when 14..17
      1000 + ((level - 14) * 200)
    when 18..21
      2000 + ((level - 18) * 400)
    when 22..25
      4150 + ((level - 22) * 950)
    when 26..29
      9000 + ((level - 26) * 2000)
    when 30..33
      19_000 + ((level - 30) * 4000)
    when 34..37
      39_000 + ((level - 34) * 8000)
    when 38..40
      79_000 + ((level - 38) * 16_000)
    else
      0
    end
  end

  def self.correct_data
    monsters = Monster.all
    monsters.each do |m|
      m.category = m.category.capitalize
      m.keywords = m.keywords.split(', ').map(&:capitalize).join(', ') unless m.keywords.empty?
      m.save
    end
  end
end
