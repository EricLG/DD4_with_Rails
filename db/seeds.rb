# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Source.create([
  { name: 'Art de la Guerre 1' },
  { name: 'Art de la Guerre 2' },
  { name: 'Eberron' },
  { name: 'Force de la Nature' },
  { name: 'Guide du Maitre 1' },
  { name: 'Guide du Maitre 2' },
  { name: 'Intervention divine' },
  { name: 'Le Comptoir de l\'Aventure 1' },
  { name: 'Le Comptoir de l\'Aventure 2' },
  { name: 'Manuel des Joueurs 1' },
  { name: 'Manuel des Joueurs 2' },
  { name: 'Manuel des Joueurs 3' },
  { name: 'Manuel des Monstres 1' },
  { name: 'Manuel des Monstres 2' },
  { name: 'Manuel des Monstres 3' },
  { name: 'Royaume Oubliés' },
  { name: 'Secret des arcanes' }
  ])

WeaponGroup.create([
  { name: 'Arbalètes' },
  { name: 'Arcs' },
  { name: 'Armes d\'hast' },
  { name: 'Bâtons' },
  { name: 'Fléaux' },
  { name: 'Frondes' },
  { name: 'Haches' },
  { name: 'Lames légères' },
  { name: 'Lames lourdes' },
  { name: 'Lances' },
  { name: 'Mains nues' },
  { name: 'Marteaux' },
  { name: 'Masses' },
  { name: 'Pics' }
  ])

WeaponProperty.create([
  { name: 'Allonge' },
  { name: 'Arme de jet légère' },
  { name: 'Arme de jet lourde' },
  { name: 'Brutale 1' },
  { name: 'Brutale 2' },
  { name: 'Critique amélioré' },
  { name: 'Défensive' },
  { name: 'Petite' },
  { name: 'Polyvalente' },
  { name: 'Rechargement (libre)' },
  { name: 'Rechargement (mineure)' },
  { name: 'Secondaire' }
  ])

WeaponCategory.create([
  { name: 'Armes improvisées de corps à corps', ranged: false,  code: 'impcc' },
  { name: 'Armes improvisées à distance',       ranged: true,   code: 'impra' },
  { name: 'Armes simples de corps à corps',     ranged: false,  code: 'simcc' },
  { name: 'Armes simples à distance',           ranged: true,   code: 'simra' },
  { name: 'Armes de guerre de corps à corps',   ranged: false,  code: 'warcc' },
  { name: 'Armes de guerre à distance',         ranged: true,   code: 'warra' },
  { name: 'Armes supérieures de corps à corps', ranged: false,  code: 'supcc' },
  { name: 'Armes supérieures à distance',       ranged: true,   code: 'supra' }
  ])

ArmorCategory.create([
  { name: "Armures d'étoffe",    heavy: false,  code: 'clothe'     },
  { name: "Armures de cuir",     heavy: false,  code: 'leather'    },
  { name: "Armures de peau",     heavy: false,  code: 'skin'       },
  { name: "Cottes de mailles",   heavy: true,   code: 'chainmail'  },
  { name: "Armures d'écailles",  heavy: true,   code: 'scales'     },
  { name: "Harnois",             heavy: true,   code: 'harnois'    },
  { name: "Boucliers légers",    heavy: false,  code: 'lightsh'    },
  { name: "Boucliers lourds",    heavy: true,   code: 'heavysh'    }
  ])

ImplementGroup.create([
  { name: "Baguettes",        code: 'wands'         },
  { name: "Bâtons",           code: 'batons'        },
  { name: "Orbes",            code: 'orbs'          },
  { name: "Sceptres",         code: 'scepters'      },
  { name: "Symboles sacrés",  code: 'holy_symbols'  },
  { name: "Tomes",            code: 'tomes'         },
  { name: "Totems",           code: 'totems'        }
  ])

CommonWeapon.create([
  { name: 'Gantelet cloutés',   weapon_category: WeaponCategory.find_by_code('simcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Baton',              weapon_category: WeaponCategory.find_by_code('simcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Cimeterre',          weapon_category: WeaponCategory.find_by_code('warcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Hallebarde',         weapon_category: WeaponCategory.find_by_code('warcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Katar',              weapon_category: WeaponCategory.find_by_code('supcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Chaine cloutées',    weapon_category: WeaponCategory.find_by_code('supcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Mains nue',          weapon_category: WeaponCategory.find_by_code('impcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Objet 2H',           weapon_category: WeaponCategory.find_by_code('impcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Arbalete de poing',  weapon_category: WeaponCategory.find_by_code('simra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Arbalete',           weapon_category: WeaponCategory.find_by_code('simra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Arc long',           weapon_category: WeaponCategory.find_by_code('warra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Shuriken',           weapon_category: WeaponCategory.find_by_code('supra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Grand arc',          weapon_category: WeaponCategory.find_by_code('supra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') },
  { name: 'Objet 1H',           weapon_category: WeaponCategory.find_by_code('impra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel des Joueurs 1') }
  ] )


CommonArmor.create([
  { name: "Armure d'étoffe",    armor_bonus: 0, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('clothe')   },
  { name: "Armure de cuir",     armor_bonus: 2, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('leather')  },
  { name: "Armure de peau",     armor_bonus: 3, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('skin')     },
  { name: "Cotte de mailles",   armor_bonus: 6, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('chainmail')},
  { name: "Armure d'écailles",  armor_bonus: 7, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('scales')   },
  { name: "Harnois",            armor_bonus: 8, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('harnois')  },
  { name: "Bouclier léger",     armor_bonus: 1, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('lightsh')  },
  { name: "Bouclier lourd",     armor_bonus: 2, source: Source.find_by_name('Manuel des Joueurs 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('heavysh')  }
  ])

ObjectLevel.create([
  { level: 1,  alteration: 1, price: "360"},
  { level: 2,  alteration: 1, price: "520"},
  { level: 3,  alteration: 1, price: "680"},
  { level: 4,  alteration: 1, price: "840"},
  { level: 5,  alteration: 1, price: "1000"},
  { level: 6,  alteration: 2, price: "1800"},
  { level: 7,  alteration: 2, price: "2600"},
  { level: 8,  alteration: 2, price: "3400"},
  { level: 9,  alteration: 2, price: "4200"},
  { level: 10, alteration: 2, price: "5000"},
  { level: 11, alteration: 3, price: "9000"},
  { level: 12, alteration: 3, price: "13000"},
  { level: 13, alteration: 3, price: "17000"},
  { level: 14, alteration: 3, price: "21000"},
  { level: 15, alteration: 3, price: "25000"},
  { level: 16, alteration: 4, price: "45000"},
  { level: 17, alteration: 4, price: "65000"},
  { level: 18, alteration: 4, price: "85000"},
  { level: 19, alteration: 4, price: "105000"},
  { level: 20, alteration: 4, price: "125000"},
  { level: 21, alteration: 5, price: "225000"},
  { level: 22, alteration: 5, price: "325000"},
  { level: 23, alteration: 5, price: "425000"},
  { level: 24, alteration: 5, price: "525000"},
  { level: 25, alteration: 5, price: "625000"},
  { level: 26, alteration: 6, price: "1125000"},
  { level: 27, alteration: 6, price: "1625000"},
  { level: 28, alteration: 6, price: "2125000"},
  { level: 29, alteration: 6, price: "2625000"},
  { level: 30, alteration: 6, price: "3125000"},
  ])

Location.create([
{ name: "Tête"                , code: "head"},
{ name: "Cou"                 , code: "neck"},
{ name: "Torse"               , code: "chest"},
{ name: "Taille"              , code: "belt"},
{ name: "Mains"               , code: "hands"},
{ name: "Anneau"              , code: "ring"},
{ name: "Bras"                , code: "arm"},
{ name: "Pieds"               , code: "foots"},
{ name: "Arme"                , code: "weapon"},
{ name: "Focaliseur"          , code: "implement"},
{ name: "Compagnon"           , code: "companion"},
{ name: "Objets merveilleux"  , code: "wonderful_object"},
{ name: "Consommmables"       , code: "expendable"},
{ name: "Munition"            , code: "ammo"},
  ])
