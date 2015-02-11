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
  { name: 'Guide du maitre 2' },
  { name: 'Intervention divine' },
  { name: 'Le Comptoir de l\'aventure 1' },
  { name: 'Le Comptoir de l\'aventure 2' },
  { name: 'Manuel du Joueur 1' },
  { name: 'Manuel du Joueur 2' },
  { name: 'Manuel du Joueur 3' },
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

CommonWeapon.create([
  { name: 'Gantelet cloutés',   weapon_category: WeaponCategory.find_by_code('simcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Baton',              weapon_category: WeaponCategory.find_by_code('simcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Cimeterre',          weapon_category: WeaponCategory.find_by_code('warcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Hallebarde',         weapon_category: WeaponCategory.find_by_code('warcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Katar',              weapon_category: WeaponCategory.find_by_code('supcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Chaine cloutées',    weapon_category: WeaponCategory.find_by_code('supcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Mains nue',          weapon_category: WeaponCategory.find_by_code('impcc'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Objet 2H',           weapon_category: WeaponCategory.find_by_code('impcc'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Arbalete de poing',  weapon_category: WeaponCategory.find_by_code('simra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Arbalete',           weapon_category: WeaponCategory.find_by_code('simra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Arc long',           weapon_category: WeaponCategory.find_by_code('warra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Shuriken',           weapon_category: WeaponCategory.find_by_code('supra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Grand arc',          weapon_category: WeaponCategory.find_by_code('supra'), two_handed: true,  weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') },
  { name: 'Objet 1H',           weapon_category: WeaponCategory.find_by_code('impra'), two_handed: false, weapon_group_ids: [1,2], source: Source.find_by_name('Manuel du Joueur 1') }
  ] )


CommonArmor.create([
  { name: "Armure d'étoffe",    armor_bonus: 0, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('clothe')   },
  { name: "Armure de cuir",     armor_bonus: 2, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('leather')  },
  { name: "Armure de peau",     armor_bonus: 3, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('skin')     },
  { name: "Cotte de mailles",   armor_bonus: 6, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('chainmail')},
  { name: "Armure d'écailles",  armor_bonus: 7, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('scales')   },
  { name: "Harnois",            armor_bonus: 8, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('harnois')  },
  { name: "Bouclier léger",     armor_bonus: 1, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('lightsh')  },
  { name: "Bouclier lourd",     armor_bonus: 2, source: Source.find_by_name('Manuel du Joueur 1'), min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('heavysh')  }
  ])
