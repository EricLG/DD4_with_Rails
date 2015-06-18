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
  { name: 'Guide du Maître 1' },
  { name: 'Guide du Maître 2' },
  { name: 'Intervention Divine' },
  { name: 'Le Comptoir de l\'Aventure 1' },
  { name: 'Le Comptoir de l\'Aventure 2' },
  { name: 'Manuel des Joueurs 1' },
  { name: 'Manuel des Joueurs 2' },
  { name: 'Manuel des Joueurs 3' },
  { name: 'Manuel des Monstres 1' },
  { name: 'Manuel des Monstres 2' },
  { name: 'Manuel des Monstres 3' },
  { name: 'Royaume Oubliés' },
  { name: 'Secret des Arcanes' }
  ])
mdj1 = Source.find_by_name('Manuel des Joueurs 1')
mdj2 = Source.find_by_name('Manuel des Joueurs 2')
mdj3 = Source.find_by_name('Manuel des Joueurs 3')
eber = Source.find_by_name('Eberron')
roou = Source.find_by_name('Royaume Oubliés')
cda1 = Source.find_by_name('Le Comptoir de l\'Aventure 1')
cda2 = Source.find_by_name('Le Comptoir de l\'Aventure 2')


arbalete    = WeaponGroup.create(name:'Arbalètes')
arc         = WeaponGroup.create(name:'Arcs')
hast        = WeaponGroup.create(name:'Armes d\'hast')
baton       = WeaponGroup.create(name:'Bâtons')
fleau       = WeaponGroup.create(name:'Fléaux')
fronde      = WeaponGroup.create(name:'Frondes')
hache       = WeaponGroup.create(name:'Haches')
lame_legere = WeaponGroup.create(name:'Lames légères')
lame_lourde = WeaponGroup.create(name:'Lames lourdes')
lance       = WeaponGroup.create(name:'Lances')
mains_nues  = WeaponGroup.create(name:'Mains nues')
marteau     = WeaponGroup.create(name:'Marteaux')
massse      = WeaponGroup.create(name:'Masses')
pic         = WeaponGroup.create(name:'Pics')
no_group    = WeaponGroup.create(name:'Aucun')


allonge         = WeaponProperty.create(name: "Allonge")
jet_leger       = WeaponProperty.create(name: "Arme de jet légère")
jet_lourd       = WeaponProperty.create(name: "Arme de jet lourde")
brutal_1        = WeaponProperty.create(name: "Brutale 1")
brutal_2        = WeaponProperty.create(name: "Brutale 2")
crit_ame        = WeaponProperty.create(name: "Critique amélioré")
defensive       = WeaponProperty.create(name: "Défensive")
petite          = WeaponProperty.create(name: "Petite")
polyvalente     = WeaponProperty.create(name: "Polyvalente")
rechar_libre    = WeaponProperty.create(name: "Rechargement (libre)")
rechar_mineure  = WeaponProperty.create(name: "Rechargement (mineure")
secondaire      = WeaponProperty.create(name: "Secondaire")
no_property     = WeaponProperty.create(name: "-")


impro_cac   = WeaponCategory.create(name: 'Armes improvisées de corps à corps', ranged: false,  code: 'impcc')
impro_dist  = WeaponCategory.create(name: 'Armes improvisées à distance',       ranged: true,   code: 'impra')
simple_cac  = WeaponCategory.create(name: 'Armes simples de corps à corps',     ranged: false,  code: 'simcc')
simple_dist = WeaponCategory.create(name: 'Armes simples à distance',           ranged: true,   code: 'simra')
guerre_cac  = WeaponCategory.create(name: 'Armes de guerre de corps à corps',   ranged: false,  code: 'warcc')
guerre_dist = WeaponCategory.create(name: 'Armes de guerre à distance',         ranged: true,   code: 'warra')
sup_cac     = WeaponCategory.create(name: 'Armes supérieures de corps à corps', ranged: false,  code: 'supcc')
sup_dist    = WeaponCategory.create(name: 'Armes supérieures à distance',       ranged: true,   code: 'supra')

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
  { name: 'Gantelet cloutés',     two_handed: "one",    handling: "+2", damage: "1d6",        range: "0",     price: "5 po",  weight: "0,5 kg", source: cda1, weapon_category: simple_cac,  weapon_groups: [mains_nues],    weapon_properties: [secondaire] },
  { name: 'Épée large',           two_handed: "one",    handling: "+2", damage: "1d10",       range: "0",     price: "20 po", weight: "2,5 kg", source: cda1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],   weapon_properties: [polyvalente] },
  { name: 'Fouet barbelé',        two_handed: "one",    handling: "+2", damage: "1d8",        range: "0",     price: "3 po",  weight: "1 kg",   source: cda1, weapon_category: guerre_cac,  weapon_groups: [fleau],         weapon_properties: [secondaire] },
  { name: 'Khopesh',              two_handed: "one",    handling: "+2", damage: "1d8",        range: "0",     price: "10 po", weight: "4 kg",   source: cda1, weapon_category: guerre_cac,  weapon_groups: [hache, lame_lourde], weapon_properties: [brutal_1, polyvalente] },
  { name: 'Pic de guerre léger',  two_handed: "one",    handling: "+2", damage: "1d6",        range: "0",     price: "10 po", weight: "2 kg",   source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],           weapon_properties: [crit_ame, secondaire] },
  { name: 'Trident',              two_handed: "one",    handling: "+2", damage: "1d8",        range: "3/6",   price: "10 po", weight: "2 kg",   source: cda1, weapon_category: guerre_cac,  weapon_groups: [lance],         weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Pic de guerre lourd',  two_handed: "two",    handling: "+2", damage: "1d12",       range: "0",     price: "20 po", weight: "4 kg",   source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],           weapon_properties: [crit_ame] },
  { name: 'Bouclier à pointe',    two_handed: "one",    handling: "+2", damage: "1d6",        range: "0",     price: "10 po", weight: "3,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],   weapon_properties: [secondaire] },
  { name: 'Dague de parade',      two_handed: "one",    handling: "+2", damage: "1d4",        range: "0",     price: "5 po",  weight: "0,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],   weapon_properties: [defensive, secondaire] },
  { name: 'Fléau à trois têtes',  two_handed: "one",    handling: "+3", damage: "1d10",       range: "0",     price: "15 po", weight: "3 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],         weapon_properties: [polyvalente] },
  { name: 'Hache de guerre',      two_handed: "one",    handling: "+2", damage: "1d12",       range: "0",     price: "30 po", weight: "5 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],         weapon_properties: [polyvalente] },
  { name: 'Kukri',                two_handed: "one",    handling: "+2", damage: "1d6",        range: "0",     price: "10 po", weight: "1 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],   weapon_properties: [brutal_1, secondaire] },
  { name: "marteau d'escarpe",    two_handed: "one",    handling: "+2", damage: "1d10",       range: "0",     price: "20 po", weight: "3 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],       weapon_properties: [brutal_2, polyvalente] },
  { name: 'Tratnyr',              two_handed: "one",    handling: "+2", damage: "1d8",        range: "10/20", price: "10 po", weight: "2,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [lance],         weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Espadon',              two_handed: "two",    handling: "+3", damage: "1d12",       range: "0",     price: "30 po", weight: "5 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_lourde],   weapon_properties: [crit_ame] },
  { name: 'Grande lance',         two_handed: "two",    handling: "+3", damage: "1d10",       range: "0",     price: "25 po", weight: "4 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [hast, lance],   weapon_properties: [allonge] },
  { name: 'hache de bourreau',    two_handed: "two",    handling: "+2", damage: "1d12",       range: "0",     price: "30 po", weight: "7 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],         weapon_properties: [brutal_2, crit_ame] },
  { name: 'Mordenkrad',           two_handed: "two",    handling: "+2", damage: "2d6",        range: "0",     price: "30 po", weight: "6 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],       weapon_properties: [brutal_1] },
  { name: 'Épée double',          two_handed: "double", handling: "+3", damage: "1d8/1d8",    range: "0",     price: "40 po", weight: "4,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere, lame_lourde], weapon_properties: [defensive, secondaire] },
  { name: 'Fléau double',         two_handed: "double", handling: "+2", damage: "1d10/1d10",  range: "0",     price: "30 po", weight: "5,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],         weapon_properties: [defensive, secondaire] },
  { name: 'Hache double',         two_handed: "double", handling: "+2", damage: "1d10/1d10",  range: "0",     price: "40 po", weight: "7,5 kg", source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],         weapon_properties: [defensive, secondaire] },
  { name: 'Urgrosh',              two_handed: "double", handling: "+2", damage: "1d12/1d8",   range: "0",     price: "30 po", weight: "6 kg",   source: cda1, weapon_category: sup_cac,     weapon_groups: [hache, lance],  weapon_properties: [defensive, secondaire] },
  { name: 'Arbalète à répétition',two_handed: "two",    handling: "+2", damage: "1d8",        range: "10/20", price: "35 po", weight: "3 kg",   source: cda1, weapon_category: simple_dist, weapon_groups: [arbalete],      weapon_properties: [rechar_libre] },
  { name: 'Arbalète supérieure',  two_handed: "two",    handling: "+3", damage: "1d10",       range: "20/40", price: "30 po", weight: "3 kg",   source: cda1, weapon_category: sup_dist,    weapon_groups: [arbalete],      weapon_properties: [rechar_mineure] },
  { name: 'Grand arc',            two_handed: "two",    handling: "+2", damage: "1d12",       range: "25/50", price: "30 po", weight: "2,5 kg", source: cda1, weapon_category: sup_dist,    weapon_groups: [arc],           weapon_properties: [rechar_libre] },
  { name: 'Bâton',                two_handed: "one",    handling: "+2", damage: "1d10",       range: "0",     price: "20 po", weight: "2,5kg",  source: cda1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],   weapon_properties: [polyvalente] },
  { name: 'Cimeterre',            two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],   weapon_properties: [crit_ame] },
  { name: 'Hallebarde',           two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache, hast],   weapon_properties: [allonge] },
  { name: 'Katar',                two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_legere],   weapon_properties: [crit_ame, secondaire] },
  { name: 'Chaine cloutée',       two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: sup_cac,     weapon_groups: [fleau],         weapon_properties: [allonge] },
  { name: 'Mains nues',           two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: impro_cac,   weapon_groups: [mains_nues],    weapon_properties: [no_property] },
  { name: 'Objet 2H',             two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: impro_cac,   weapon_groups: [no_group],      weapon_properties: [no_property] },
  { name: 'Arbalète de poing',    two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],      weapon_properties: [rechar_libre] },
  { name: 'Arbalete',             two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],      weapon_properties: [rechar_mineure] },
  { name: 'Arc long',             two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: guerre_dist, weapon_groups: [arc],           weapon_properties: [rechar_libre] },
  { name: 'Shuriken',             two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: guerre_dist, weapon_groups: [lame_legere],   weapon_properties: [jet_leger] },
  { name: 'Grand arc',            two_handed: "two",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: cda1, weapon_category: sup_dist,    weapon_groups: [arc],           weapon_properties: [rechar_libre] },
  { name: 'Objet 1H',             two_handed: "one",    handling: "+2", damage: "1d",       range: "0",       price: "x po", weight: "x kg",    source: mdj1, weapon_category: sup_dist,    weapon_groups: [no_group],      weapon_properties: [no_property] }
  ] )


CommonArmor.create([
  { name: "Armure d'étoffe",    armor_bonus: 0, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('clothe')   },
  { name: "Armure de cuir",     armor_bonus: 2, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('leather')  },
  { name: "Armure de peau",     armor_bonus: 3, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('skin')     },
  { name: "Cotte de mailles",   armor_bonus: 6, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('chainmail')},
  { name: "Armure d'écailles",  armor_bonus: 7, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('scales')   },
  { name: "Harnois",            armor_bonus: 8, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('harnois')  },
  { name: "Bouclier léger",     armor_bonus: 1, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('lightsh')  },
  { name: "Bouclier lourd",     armor_bonus: 2, source_id: mdj1.id, min_alteration_bonus:0, skill_malus: 0, ms_malus: 0, armor_category: ArmorCategory.find_by_code('heavysh')  }
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
{ name: "Anneaux"             , code: "ring"},
{ name: "Bras"                , code: "arm"},
{ name: "Pieds"               , code: "foots"},
{ name: "Arme"                , code: "weapon"},
{ name: "Focaliseur"          , code: "implement"},
{ name: "Compagnon"           , code: "companion"},
{ name: "Objets merveilleux"  , code: "wonderful_object"},
{ name: "Consommmables"       , code: "expendable"},
{ name: "Munition"            , code: "ammo"},
  ])

{
"Changelin"             => {book_source: eber.id, cat_size: "M", speed: 6, features: ["Change-forme", "Défense mentale", "Métamorphe", "Ruse du changelin"]},
"Cristallien"           => {book_source: mdj3.id, cat_size: "M", speed: 6, features: ["Créature artificielle vivante", "Esprit cristallien", "Nuée de cristaux", "Origine immortelle", "Télépathie"]},
"Demi-elfe"             => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Dilettante", "Diplomatie de groupe", "Double héritage"]},
"Demi-orque"            => {book_source: mdj2.id, cat_size: "M", speed: 6, features: ["Assaut enragé", "Charge véloce", "Vitalité demi-orque"]},
"Déva"                  => {book_source: mdj2.id, cat_size: "M", speed: 6, features: ["Majesté astrale", "Résistance astrale", "Origine immortelle", "Mémoire d'un millier de vies"]},
"Drakéide"              => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Fureur drakéide", "Héritage draconique", "Souffle de dragon"]},
"Drow"                  => {book_source: roou.id, cat_size: "M", speed: 6, features: ["Lolthaïque", "Origine féerique", "Transe"]},
"Éladrin"               => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Éclipse féerique", "Éducation éladrine", "Maniement des armes éladrines", "Origine féerique", "Transe", "Volonté éladrine"]},
"Elfe"                  => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Maniement des armes elfiques", "Origine féerique", "Pas assuré", "Précision elfique", "Vigilance de groupe"]},
"Féral longue-dent"     => {book_source: mdj2.id, cat_size: "M", speed: 6, features: ["Sauvagerie longue-dent"]},
"Féral griffe-effilée"  => {book_source: mdj2.id, cat_size: "M", speed: 6, features: ["Sauvagerie griffe-effilée"]},
"Forgelier"             => {book_source: eber.id, cat_size: "M", speed: 6, features: ["Créature artificielle vivante","Esprit du forgelier", "Opiniâtreté forgelière", "Résistance forgelière", "Veilleur infatigable"]},
"Genasi"                => {book_source: roou.id, cat_size: "M", speed: 6, features: ["Origine élémentaire", "Manifestation élémentaire"]},
"Githzerai"             => {book_source: mdj3.id, cat_size: "M", speed: 6, features: ["Esprit défendu", "Heureuse fortune", "Mental d'acier", "Sens du danger"]},
"Gnome"                 => {book_source: mdj2.id, cat_size: "P", speed: 5, features: ["Discrétion réactive", "Effacement", "Maître menteur", "Origine féerique", "Perspicacité du menteur"]},
"Goliath"               => {book_source: mdj2.id, cat_size: "M", speed: 6, features: ["Ténacité de la montagne", "Athlète puissant", "Endurance de la pierre"]},
"Halfelin"              => {book_source: mdj1.id, cat_size: "P", speed: 6, features: ["Audacieux", "Deuxième chance", "Réflexes éclair"]},
"Humain"                => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Bonus de défense humain", "Compétence supplémentaire", "Pouvoir à volonté supplémentaire", "Talent supplémentaire"]},
"Kalashtar"             => {book_source: eber.id, cat_size: "M", speed: 6, features: ["Âme double", "Bastion de clarté mentale"]},
"Minotaure"             => {book_source: mdj3.id, cat_size: "M", speed: 6, features: ["Charge encornée", "Charge intrépide", "Férocité", "Vitalité"]},
"Nain"                  => {book_source: mdj1.id, cat_size: "M", speed: 5, features: ["Ancré dans le sol", "Boyaux d'acier", "Déplacement avec charge", "Maniement des armes naines", "Résistance naine"]},
"Silvyen"               => {book_source: mdj3.id, cat_size: "M", speed: 6, features: ["Aspect de la nature", "Forme endurcie", "Origine féerique"]},
"Tieffelin"             => {book_source: mdj1.id, cat_size: "M", speed: 6, features: ["Appel du sang", "Courroux infernal", "Résistance au feu"]}
}.each do |race, info|
  race = Race.create(name: race, source_id: info[:book_source], cat_size: info[:cat_size], speed: info[:speed])
  info[:features].each do |feature|
    r = RaceFeature.find_by_name(feature)
    if r.nil?
       RaceFeature.create(name: feature, races: [race])
    else
      r.races << race
      r.save
    end
  end
end

{
"Barbare"           => {book_source: mdj2.id, power_source: "Primale",    features: ["Agilité du barbare", "Carnage", {"Force indomptable" => ["Ardeur sanguinaire", "Triomphe du champion", "Colère du fils du tonnerre", "Faucheur tournoyant"]}, "Frappe enragée"]},
"Barde"             => {book_source: mdj2.id, power_source: "Arcanique",  features: ["Chant apaisant", "Formation de barde", "Multiclassage versatile", "Paroles d'amitié", "Paroles de majesté", "Savoir-faire polyvalent", {"Vertu des bardes" => ["Vertu de vaillance", "Vertu de ruse", "vertu de prescience"]}]},
"Batailleur"        => {book_source: mdj3.id, power_source: "Psionique",  features: ["Accentuation psionique", "Défense psionique", {"Étude psionique" => ["Résistance de combat", "Vitesse de la pensée"]}]},
"Druide"            => {book_source: mdj2.id, power_source: "Primale",    features: ["Harmonie de la nature", {"Aspect primal" => ["Gardien primal", "Prédateur primal", "Nuée primale"]}, "Magie rituelle", "Métamorphose animale"]},
"Ensorceleur"       => {book_source: mdj2.id, power_source: "Arcanique",  features: [{"Source des sorts" => ["Magie draconique", "Magie sauvage", "Magie des tempêtes", "Magie cosmique"]}]},
"Façonneur"         => {book_source: eber.id, power_source: "Arcanique",  features: [{"Bonification arcanique" => ["Partage d'énergie", "Intensification d'énergie"]}, "Infusion vulnéraire" , "Jouvence arcanique", "Magie rituelle"]},
"Flamboyant"        => {book_source: mdj3.id, power_source: "Psionique",  features: ["Accentuation psionique", {"Manteau flamboyant" => ["Manteau d'allégresse", "Manteau de clarté"]}, "Regain flamboyant"]},
"Gardien"           => {book_source: mdj2.id, power_source: "Primale",    features: ["Fontaine de vie", {"Puissance du gardien" => ["Force de la terre", "Sang indompté", "Coeur de tempête", "Esprit vital"]}, "Colère de la nature"]},
"Guerrier"          => {book_source: mdj1.id, power_source: "Martiale",   features: ["Catégorie d'arme favorite", "Défi en combat", "Supériorité au combat", "Technique de la tempête", "Vigueur du guerrier téméraire", "Agilité en combat", "Style du bagarreur"]},
"Invocateur"        => {book_source: mdj2.id, power_source: "Divine",     features: [{"Alliance divine" => ["Alliance de colère", "Alliance protectrice", "Alliance de malédiction"]}, "Conduit divin", "Magie rituelle" ]},
"Limier"            => {book_source: mdj3.id, power_source: "Primale",    features: [{"Lien du limier" => ["Lien désincarné", "Lien du sang"]}, "Tir implacable"]},
"Mage lames"        => {book_source: roou.id, power_source: "Arcanique",  features: ["Écran du mage d'armes", {"Égide du mage d'armes" => ["Égide défensive", "Égide offensive"]}, "Porte-lame"]},
"Magicien"          => {book_source: mdj1.id, power_source: "Arcanique",  features: ["Grimoire d'arcaniste", "Magie rituelle", {"Maîtrise des focaliseurs arcaniques" =>["Baguette de défense", "Bâton de défense", "Orbe du châtiment", "Orbe de tromperie", "Tome de coercition", "Tome de préparation"]}, "Tour de magie"]},
"Maître de guerre"  => {book_source: mdj1.id, power_source: "Martiale",   features: [{"Autorité naturelle" => ["Présence inspiratrice", "Présence tactique", "Présence ingénieuse", "Présence intrépide", "Présence perspicace", "Présence du tirailleur"]}, "Chef de troupe", "Parole inspiratrice", "Chef avisé", "Maître de guerre archer", "Chef d'assaut"]},
"Moine"             => {book_source: mdj3.id, power_source: "Psionique",  features: ["Combattant à mains nues", "Défense sans armure", {"Poing de pierre" => ["Déluge de coup", "Bastion mental"]}, {"Soufle centré" => ["Déluge de coups", "Équilibre mental"]}]},
"Paladin"           => {book_source: mdj1.id, power_source: "Divine",     features: ["Conduit divin", "Défi divin", "Imposition des mains"]},
"Prêtre"            => {book_source: mdj1.id, power_source: "Divine",     features: ["Conduit divin", "Magie rituelle", "Mot de guérison", "Savoir de soigneur"]},
"Prêtre des runes"  => {book_source: mdj3.id, power_source: "Divine",     features: ["Maître des runes", "Rune de préparation", {"Tradition runique" => ["Marteau de l'ire", "Parole du défi"]}]},
"Psion"             => {book_source: mdj3.id, power_source: "Psionique",  features: ["Accentuation psionique", {"Discipline de spécialisation" => ["Spécialisation en télékinésie", "Spécialisation en télépathie"]}, "Magie rituelle"]},
"Rôdeur"            => {book_source: mdj1.id, power_source: "Martiale",   features: [{"Style de combat" => ["Style de combat à distance", "Style de combat à deux armes", "Maîtrise des bêtes", "Style du combat du chasseur", "Style de combat du maraudeur"]}, "Tir de proximité", "Traque", "Course d'assaut"]},
"Shaman"            => {book_source: mdj2.id, power_source: "Primale",    features: [{"Compagnon spirituel" => ["Esprit protecteur", "Esprit prédateur", "Esprit du guetteur", "Esprit du messager des mondes"]}, "Guérison spirituelle", "Communication avec les esprits"]},
"Sorcier"           => {book_source: mdj1.id, power_source: "Arcanique",  features: ["Décharge occulte", "Déplacement enténébré", "Envoûtement", {"Pacte occulte" => ["Pacte féerique", "Pacte infernal", "Pacte stellaire", "Pacte des vestiges"]}, "Tir de proximité"]},
"Vengeur"           => {book_source: mdj2.id, power_source: "Divine",     features: ["Armure de la foi", {"Censure du vengeur" => ["Censure de poursuite", "Censure rétributive", "Censure collective"]}, "Conduit divin", "Serment d'inimitié"]},
"Voleur"            => {book_source: mdj1.id, power_source: "Martiale",   features: ["Armes du voleur", "Attaque sournoise", "Frappe de la mante", {"Tactique du roublard" => ["Brute des bas-fonds", "Esthète de l'esquive", "Ruffian impitoyable", "Furtivité"]}, "Tireur d'élite"]},
"Hybride"           => {book_source: mdj3.id, power_source: "Mixte",      features: []}
}.each do |klass, info|
  klass = Klass.create(name: klass, power_source: info[:power_source], source_id: info[:book_source])
  info[:features].each do |feature|
    if feature.kind_of?(Hash)
      feature.each do |top_feature, children_feature|
        t = ClassFeature.create(name: top_feature, klasses: [klass])
        children_feature.each do |child|
          ClassFeature.create(name: child, klasses: [klass], top_feature: t)
        end
      end
    else
      c = ClassFeature.find_by_name(feature)
      if c.nil?
        ClassFeature.create(name: feature, klasses: [klass])
      else
        c.klasses << klass
        c.save
      end
    end
  end
end
