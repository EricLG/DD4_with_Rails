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
  { name: 'Royaumes Oubliés' },
  { name: 'Secrets des Arcanes' }
])

mdj1 = Source.find_by_name('Manuel des Joueurs 1')
mdj2 = Source.find_by_name('Manuel des Joueurs 2')
mdj3 = Source.find_by_name('Manuel des Joueurs 3')
eber = Source.find_by_name('Eberron')
roou = Source.find_by_name('Royaumes Oubliés')
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
  { name: 'Dague',                  two_handed: "one",    handling: "+3", damage: "1d4",      range: "5/10",  price: "1 po",  weight: "0,5 kg",         source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_legere],               weapon_properties: [jet_leger, secondaire] },
  { name: 'Gourdin',                two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "1 po",  weight: "1,5 kg",         source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse],                    weapon_properties: [no_property] },
  { name: 'Javeline',               two_handed: "one",    handling: "+2", damage: "1d6",      range: "10/20", price: "5 po",  weight: "1 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lance],                     weapon_properties: [jet_lourd] },
  { name: 'Lance',                  two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "3 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lance],                     weapon_properties: [polyvalente] },
  { name: "Masse d'armes",          two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "3 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse],                    weapon_properties: [polyvalente] },
  { name: 'Serpe',                  two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "2 po",  weight: "1 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Bâton',                  two_handed: "two",    handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "2 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [baton],                     weapon_properties: [no_property] },
  { name: 'Faux',                   two_handed: "two",    handling: "+2", damage: "2d4",      range: "0",     price: "5 po",  weight: "4 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_lourde],               weapon_properties: [no_property] },
  { name: 'Massue',                 two_handed: "two",    handling: "+2", damage: "2d4",      range: "0",     price: "1 po",  weight: "5 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse],                    weapon_properties: [no_property] },
  { name: 'Morgenstern',            two_handed: "two",    handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "4 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse],                    weapon_properties: [no_property] },
  { name: 'Cimeterre',              two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "10 po", weight: "2 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Épée courte',            two_handed: "one",    handling: "+3", damage: "1d6",      range: "0",     price: "10 po", weight: "1 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Épée longue',            two_handed: "one",    handling: "+3", damage: "1d8",      range: "0",     price: "15 po", weight: "2 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: "Fléau d'armes",          two_handed: "one",    handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [fleau],                     weapon_properties: [polyvalente] },
  { name: "Hache d'armes",          two_handed: "one",    handling: "+2", damage: "1d10",     range: "0",     price: "15 po", weight: "3 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache],                     weapon_properties: [polyvalente] },
  { name: 'Marteau de guerre',      two_handed: "one",    handling: "+2", damage: "1d10",     range: "0",     price: "15 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau],                   weapon_properties: [polyvalente] },
  { name: 'Marteau de lancer',      two_handed: "one",    handling: "+2", damage: "1d6",      range: "5/10",  price: "5 po",  weight: "1 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau],                   weapon_properties: [jet_lourd, secondaire] },
  { name: 'Pic de guerre',          two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "15 po", weight: "3 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame, polyvalente] },
  { name: 'Cimeterre à deux mains', two_handed: "two",    handling: "+3", damage: "2d4",      range: "0",     price: "25 po", weight: "3,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Coutille',               two_handed: "two",    handling: "+2", damage: "2d4",      range: "0",     price: "25 po", weight: "5 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde, hast],         weapon_properties: [allonge] },
  { name: 'Épée à deux mains',      two_handed: "two",    handling: "+3", damage: "1d10",     range: "0",     price: "30 po", weight: "4 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [allonge] },
  { name: "Fléau d'armes lourd",    two_handed: "two",    handling: "+2", damage: "2d6",      range: "0",     price: "25 po", weight: "5 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [fleau],                     weapon_properties: [no_property] },
  { name: 'Grande hache',           two_handed: "two",    handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache],                     weapon_properties: [no_property] },
  { name: 'Hallebarde',             two_handed: "two",    handling: "+2", damage: "1d10",     range: "0",     price: "25 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache, hast],               weapon_properties: [allonge] },
  { name: 'Maillet',                two_handed: "two",    handling: "+2", damage: "2d6",      range: "0",     price: "30 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau],                   weapon_properties: [no_property] },
  { name: 'Pique',                  two_handed: "two",    handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "4,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hast, lance],               weapon_properties: [allonge] },
  { name: 'Épée bâtarde',           two_handed: "one",    handling: "+3", damage: "1d10",     range: "0",     price: "30 po", weight: "3 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: 'Katar',                  two_handed: "one",    handling: "+3", damage: "1d6",      range: "0",     price: "3 po",  weight: "0,5 kg",         source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [crit_ame, secondaire] },
  { name: 'Rapière',                two_handed: "one",    handling: "+3", damage: "1d8",      range: "0",     price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [no_property] },
  { name: 'Chaine cloutée',         two_handed: "two",    handling: "+3", damage: "2d4",      range: "0",     price: "30 po", weight: "5 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [allonge] },
  { name: 'Mains nues',             two_handed: "one",    handling: "+0", damage: "1d4",      range: "0",     price: "-",     weight: "-",              source: mdj1, weapon_category: impro_cac,   weapon_groups: [mains_nues],                weapon_properties: [no_property] },
  { name: 'Objet 1H',               two_handed: "one",    handling: "+0", damage: "1d4",      range: "0",     price: "-",     weight: "x0,5 - 2,5 kg",  source: mdj1, weapon_category: impro_cac,   weapon_groups: [no_group],                  weapon_properties: [no_property] },
  { name: 'Objet 2H',               two_handed: "two",    handling: "+0", damage: "1d8",      range: "0",     price: "-",     weight: "3 - 6 kg",       source: mdj1, weapon_category: impro_cac,   weapon_groups: [no_group],                  weapon_properties: [no_property] },
  { name: 'Arbalète de poing',      two_handed: "one",    handling: "+2", damage: "1d6",      range: "10/20", price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_libre] },
  { name: 'Fronde',                 two_handed: "one",    handling: "+2", damage: "1d6",      range: "10/20", price: "1 po",  weight: "0 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [fronde],                    weapon_properties: [rechar_libre] },
  { name: 'Arbalete',               two_handed: "two",    handling: "+2", damage: "1d8",      range: "15/30", price: "25 po", weight: "2 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_mineure] },
  { name: 'Arc court',              two_handed: "two",    handling: "+2", damage: "1d8",      range: "15/30", price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: guerre_dist, weapon_groups: [arc],                       weapon_properties: [petite, rechar_libre] },
  { name: 'Arc long',               two_handed: "two",    handling: "+2", damage: "1d10",     range: "20/40", price: "30 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_dist, weapon_groups: [arc],                       weapon_properties: [rechar_libre] },
  { name: 'Shuriken(5)',            two_handed: "one",    handling: "+2", damage: "1d4",      range: "6/12",  price: "1 po",  weight: "0,25 kg",        source: mdj1, weapon_category: guerre_dist, weapon_groups: [lame_legere],               weapon_properties: [jet_leger] },
  { name: 'Objet distance 1H',      two_handed: "one",    handling: "+0", damage: "1d4",      range: "5/10",  price: "-",     weight: "0,5 kg",         source: mdj1, weapon_category: impro_dist,  weapon_groups: [no_group],                  weapon_properties: [no_property] },
  { name: 'Gantelet cloutés',       two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "5 po",  weight: "0,5 kg",         source: cda1, weapon_category: simple_cac,  weapon_groups: [mains_nues],                weapon_properties: [secondaire] },
  { name: 'Épée large',             two_handed: "one",    handling: "+2", damage: "1d10",     range: "0",     price: "20 po", weight: "2,5 kg",         source: cda1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: 'Fouet barbelé',          two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "3 po",  weight: "1 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [fleau],                     weapon_properties: [secondaire] },
  { name: 'Khopesh',                two_handed: "one",    handling: "+2", damage: "1d8",      range: "0",     price: "10 po", weight: "4 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [hache, lame_lourde],        weapon_properties: [brutal_1, polyvalente] },
  { name: 'Pic de guerre léger',    two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "2 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame, secondaire] },
  { name: 'Trident',                two_handed: "one",    handling: "+2", damage: "1d8",      range: "3/6",   price: "10 po", weight: "2 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [lance],                     weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Pic de guerre lourd',    two_handed: "two",    handling: "+2", damage: "1d12",     range: "0",     price: "20 po", weight: "4 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame] },
  { name: 'Bouclier à pointe',      two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "3,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Dague de parade',        two_handed: "one",    handling: "+2", damage: "1d4",      range: "0",     price: "5 po",  weight: "0,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [defensive, secondaire] },
  { name: 'Fléau à trois têtes',    two_handed: "one",    handling: "+3", damage: "1d10",     range: "0",     price: "15 po", weight: "3 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [polyvalente] },
  { name: 'Hache de guerre',        two_handed: "one",    handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "5 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [polyvalente] },
  { name: 'Kukri',                  two_handed: "one",    handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "1 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [brutal_1, secondaire] },
  { name: "marteau d'escarpe",      two_handed: "one",    handling: "+2", damage: "1d10",     range: "0",     price: "20 po", weight: "3 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],                   weapon_properties: [brutal_2, polyvalente] },
  { name: 'Tratnyr',                two_handed: "one",    handling: "+2", damage: "1d8",      range: "10/20", price: "10 po", weight: "2,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lance],                     weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Espadon',                two_handed: "two",    handling: "+3", damage: "1d12",     range: "0",     price: "30 po", weight: "5 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Grande lance',           two_handed: "two",    handling: "+3", damage: "1d10",     range: "0",     price: "25 po", weight: "4 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hast, lance],               weapon_properties: [allonge] },
  { name: 'hache de bourreau',      two_handed: "two",    handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "7 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [brutal_2, crit_ame] },
  { name: 'Mordenkrad',             two_handed: "two",    handling: "+2", damage: "2d6",      range: "0",     price: "30 po", weight: "6 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],                   weapon_properties: [brutal_1] },
  { name: 'Épée double',            two_handed: "double", handling: "+3", damage: "1d8/1d8",  range: "0",     price: "40 po", weight: "4,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere, lame_lourde],  weapon_properties: [defensive, secondaire] },
  { name: 'Fléau double',           two_handed: "double", handling: "+2", damage: "1d10/1d10",range: "0",     price: "30 po", weight: "5,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [defensive, secondaire] },
  { name: 'Hache double',           two_handed: "double", handling: "+2", damage: "1d10/1d10",range: "0",     price: "40 po", weight: "7,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [defensive, secondaire] },
  { name: 'Urgrosh',                two_handed: "double", handling: "+2", damage: "1d12/1d8", range: "0",     price: "30 po", weight: "6 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache, lance],              weapon_properties: [defensive, secondaire] },
  { name: 'Arbalète à répétition',  two_handed: "two",    handling: "+2", damage: "1d8",      range: "10/20", price: "35 po", weight: "3 kg",           source: cda1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_libre] },
  { name: 'Arbalète supérieure',    two_handed: "two",    handling: "+3", damage: "1d10",     range: "20/40", price: "30 po", weight: "3 kg",           source: cda1, weapon_category: sup_dist,    weapon_groups: [arbalete],                  weapon_properties: [rechar_mineure] },
  { name: 'Grand arc',              two_handed: "two",    handling: "+2", damage: "1d12",     range: "25/50", price: "30 po", weight: "2,5 kg",         source: cda1, weapon_category: sup_dist,    weapon_groups: [arc],                       weapon_properties: [rechar_libre] }
])

clothe      = ArmorCategory.create( name: "Armures d'étoffe",    heavy: false,  code: 'clothe'    )
leather     = ArmorCategory.create( name: "Armures de cuir",     heavy: false,  code: 'leather'   )
skin        = ArmorCategory.create( name: "Armures de peau",     heavy: false,  code: 'skin'      )
chainmail   = ArmorCategory.create( name: "Cottes de mailles",   heavy: true,   code: 'chainmail' )
scales      = ArmorCategory.create( name: "Armures d'écailles",  heavy: true,   code: 'scales'    )
harnois     = ArmorCategory.create( name: "Harnois",             heavy: true,   code: 'harnois'   )
lightsh     = ArmorCategory.create( name: "Boucliers légers",    heavy: false,  code: 'lightsh'   )
heavysh     = ArmorCategory.create( name: "Boucliers lourds",    heavy: true,   code: 'heavysh'   )



CommonArmor.create([
  { name: "Vêtements normaux",              armor_bonus: 0,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,    price: "1 PO",    weight: "2 kg" ,    armor_category: clothe   },
  { name: "Armure d'étoffe féerique",       armor_bonus: 1,   source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "2,5 kg",   armor_category: clothe   },
  { name: "Armure d'étoffe céleste",        armor_bonus: 2,   source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "1,5 kg",   armor_category: clothe   },
  { name: "Armure d'étoffe gith",           armor_bonus: 0,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "1 kg",     armor_category: clothe, special: "+1 en Volonté"   },
  { name: "Armure d'étoffe mentale",        armor_bonus: 0,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "1 kg",     armor_category: clothe, special: "+2 en Volonté"   },
  { name: "Armure d'étoffe éfrit",          armor_bonus: 1,   source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "1 kg",     armor_category: clothe, special: "+1 en Volonté"   },
  { name: "Armure d'étoffe mentaux",        armor_bonus: 1,   source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "1 kg",     armor_category: clothe, special: "+2 en Volonté"   },

  { name: "Armure de cuir",                 armor_bonus: 2,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,    price: "25 PO",   weight: "7,5 kg",   armor_category: leather  },
  { name: "Armure de cuir féerique",        armor_bonus: 3,   source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "7,5 kg",   armor_category: leather  },
  { name: "Armure de cuir céleste",         armor_bonus: 4,   source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "7,5 kg",   armor_category: leather  },
  { name: "Armure de tramée drow",          armor_bonus: 2,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "5 kg",   armor_category: leather, special: "+1 en Réflexes"  },
  { name: "Armure ophidienne",              armor_bonus: 2,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "5 kg",   armor_category: leather, special: "+2 en Réflexes"  },
  { name: "Armure anathème",                armor_bonus: 3,   source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "5 kg",   armor_category: leather, special: "+1 en Réflexes"  },
  { name: "Armure de faucheur ailé",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,    price: "Spécial", weight: "5 kg",   armor_category: leather, special: "+2 en Réflexes"  },

  { name: "Armure de peau",                 armor_bonus: 3,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -1,  ms_malus: 0,    price: "30 PO",   weight: "12,5 kg",  armor_category: skin     },
  { name: "Armure de sombrepeau",           armor_bonus: 4,   source: mdj1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin     },
  { name: "Armure de peau vénérable",       armor_bonus: 5,   source: mdj1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin     },
  { name: "Armure de peau rocheuse",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 3,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin, special: "+1 en Vigueur"     },
  { name: "Armure de peau féerique",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin, special: "+2 en Vigueur"     },
  { name: "Armure de peau de traqueur",     armor_bonus: 4,   source: cda1, min_alteration_bonus: 5,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin, special: "+1 en Vigueur"     },
  { name: "Armure de peau-néant",           armor_bonus: 4,   source: cda1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: 0,    price: "Spécial", weight: "12,5 kg",  armor_category: skin, special: "+ en Vigueur"     },

  { name: "Cotte de mailles",               armor_bonus: 6,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail},
  { name: "Cotte de forgemailles",          armor_bonus: 9,   source: mdj1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail},
  { name: "Cotte de mailles céleste",       armor_bonus: 12,  source: mdj1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail},
  { name: "Armure de mailles fines",        armor_bonus: 7,   source: cda1, min_alteration_bonus: 2,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail},
  { name: "Armure de mailles tressées",     armor_bonus: 8,   source: cda1, min_alteration_bonus: 3,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail},
  { name: "Armure de cristacier",           armor_bonus: 8,   source: cda1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail, special: "+2 en Volonté"},
  { name: "Armure de mailles tissées",      armor_bonus: 10,  source: cda1, min_alteration_bonus: 5,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail, special: "+1 en Volonté"},
  { name: "Armure de diantremailles ",      armor_bonus: 11,  source: cda1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: -1,   price: "Spécial", weight: "20 kg",    armor_category: chainmail, special: "+2 en Volonté"},

  { name: "Armure d'écailles",              armor_bonus: 7,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: -1,   price: "45 PO",   weight: "22,5 kg",  armor_category: scales   },
  { name: "Armure draconique",              armor_bonus: 10,  source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales   },
  { name: "Armure d'écailles vénérables",   armor_bonus: 13,  source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales   },
  { name: "Armure d'écailles drakéennes",   armor_bonus: 8,   source: cda1, min_alteration_bonus: 2,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales   },
  { name: "Armure d'écailles guivrées",     armor_bonus: 9,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales   },
  { name: "Armure d'écailles tempétueuses", armor_bonus: 9,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales, special: "+2 en Vigueur"   },
  { name: "Armure d'écailles nagas",        armor_bonus: 11,  source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales, special: "+1 en Vigueur"   },
  { name: "Armure d'écailles titanesques",  armor_bonus: 12,  source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: -1,   price: "Spécial", weight: "22,5 kg",  armor_category: scales, special: "+2 en Vigueur"   },

  { name: "Harnois",                        armor_bonus: 8,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -2,  ms_malus: -10,  price: "50 PO",   weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de guerre",              armor_bonus: 11,  source: mdj1, min_alteration_bonus: 4,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois divin",                  armor_bonus: 14,  source: mdj1, min_alteration_bonus: 6,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de flammegivre",         armor_bonus: 8,   source: cda1, min_alteration_bonus: 2,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 1 à tout"  },
  { name: "Harnois feuilleté",              armor_bonus: 9,   source: cda1, min_alteration_bonus: 2,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois gith",                   armor_bonus: 10,  source: cda1, min_alteration_bonus: 3,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois spectral",               armor_bonus: 10,  source: cda1, min_alteration_bonus: 4,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 2 à tout"  },
  { name: "Harnois de légionnaire",         armor_bonus: 12,  source: cda1, min_alteration_bonus: 5,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de tarasque",            armor_bonus: 12,  source: cda1, min_alteration_bonus: 6,  skill_malus: -2,  ms_malus: -10,  price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 5 à tout"  },

  { name: "Bouclier léger",                 armor_bonus: 1,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,    price: "5 PO",    weight: "3 kg",     armor_category: lightsh  },
  { name: "Bouclier lourd",                 armor_bonus: 2,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0-2, ms_malus: 0,    price: "10 PO",   weight: "7,5 kg",   armor_category: heavysh  }
])

ObjectLevel.create([
  { level: 1,  alteration: 1, price: "360",     cons_price: "-"},
  { level: 2,  alteration: 1, price: "520",     cons_price: "25"},
  { level: 3,  alteration: 1, price: "680",     cons_price: "30"},
  { level: 4,  alteration: 1, price: "840",     cons_price: "40"},
  { level: 5,  alteration: 1, price: "1000",    cons_price: "50"},
  { level: 6,  alteration: 2, price: "1800",    cons_price: "75"},
  { level: 7,  alteration: 2, price: "2600",    cons_price: "100"},
  { level: 8,  alteration: 2, price: "3400",    cons_price: "125"},
  { level: 9,  alteration: 2, price: "4200",    cons_price: "160"},
  { level: 10, alteration: 2, price: "5000",    cons_price: "200"},
  { level: 11, alteration: 3, price: "9000",    cons_price: "350"},
  { level: 12, alteration: 3, price: "13000",   cons_price: "500"},
  { level: 13, alteration: 3, price: "17000",   cons_price: "650"},
  { level: 14, alteration: 3, price: "21000",   cons_price: "800"},
  { level: 15, alteration: 3, price: "25000",   cons_price: "1000"},
  { level: 16, alteration: 4, price: "45000",   cons_price: "1800"},
  { level: 17, alteration: 4, price: "65000",   cons_price: "2600"},
  { level: 18, alteration: 4, price: "85000",   cons_price: "3400"},
  { level: 19, alteration: 4, price: "105000",  cons_price: "4200"},
  { level: 20, alteration: 4, price: "125000",  cons_price: "5000"},
  { level: 21, alteration: 5, price: "225000",  cons_price: "9000"},
  { level: 22, alteration: 5, price: "325000",  cons_price: "13000"},
  { level: 23, alteration: 5, price: "425000",  cons_price: "17000"},
  { level: 24, alteration: 5, price: "525000",  cons_price: "21000"},
  { level: 25, alteration: 5, price: "625000",  cons_price: "25000"},
  { level: 26, alteration: 6, price: "1125000", cons_price: "45000"},
  { level: 27, alteration: 6, price: "1625000", cons_price: "65000"},
  { level: 28, alteration: 6, price: "2125000", cons_price: "85000"},
  { level: 29, alteration: 6, price: "2625000", cons_price: "105000"},
  { level: 30, alteration: 6, price: "3125000", cons_price: "125000"},
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

r = "race"
kalashtar_language = 'commun, télépathie 5 (vous êtes capable de communiquer mentalement avec toute créature douée de langage située dans votre ligne de mire et dans un rayon de 5 cases, sachant que la communication se fait dans les deux sens)'

changelin            = Race.create(name: "Changelin",            skill: Skill.new(bluff: 2, insight: 2),            average_height: '1,65 m à 1,80 m',  average_weight: '60 à 80 kg',   vision: 'normale',  language: 'commun',                                       stats: [Stat.new(intelligence:  2, charisma:      2, kind: r), Stat.new(intelligence:   2, dexterity:     2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
cristallien          = Race.create(name: "Cristallien",          skill: Skill.new(arcana: 2, endurance: 2),         average_height: '1,70 m à 1,85 m',  average_weight: '90 à 115 kg',  vision: 'normale',  language: 'commun, profond, une autre au choix',          stats: [Stat.new(intelligence:  2, wisdom:        2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
demi_elfe            = Race.create(name: "Demi-elfe",            skill: Skill.new(diplomacy:  2, insight:     2),   average_height: '1,65 m à 1,85 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique, une supplémentaire au choix', stats: [Stat.new(constitution:  2, wisdom:        2, kind: r), Stat.new(constitution:   2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
demi_orque           = Race.create(name: "Demi-orque",           skill: Skill.new(endurance: 2, intimidate: 2),     average_height: '1,90 m à 2,10 m',  average_weight: '77 à 112 kg',  vision: 'nocturne', language: 'commun, géant',                                stats: [Stat.new(dexterity:     2, strength:      2, kind: r), Stat.new(dexterity:      2, constitution:  2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
deva                 = Race.create(name: "Déva",                 skill: Skill.new(history: 2, religion: 2),         average_height: '2 m à 2,15 m',     average_weight: '87 à 140 kg',  vision: 'normale',  language: 'commun, deux supplémentaires au choix',        stats: [Stat.new(intelligence:  2, wisdom:        2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
drakeide             = Race.create(name: "Drakéide",             skill: Skill.new(history:    2, intimidate:  2),   average_height: '1,85 m à 2 m',     average_weight: '110 à 160 kg', vision: 'normale',  language: 'commun, draconique',                           stats: [Stat.new(charisma:      2, strength:      2, kind: r), Stat.new(charisma:       2, constitution:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
drow                 = Race.create(name: "Drow",                 skill: Skill.new(stealth: 2, intimidate: 2),       average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(dexterity:     2, charisma:      2, kind: r), Stat.new(dexterity:      2, wisdom:        2,  kind: r)], source_id: roou.id, cat_size: "M", speed: 6)
eladrin              = Race.create(name: "Éladrin",              skill: Skill.new(arcana: 2, history: 2),           average_height: '1,65 m à 1,85 m',  average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(intelligence:  2, dexterity:     2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
elfe                 = Race.create(name: "Elfe",                 skill: Skill.new(nature: 2, perception: 2),        average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r), Stat.new(dexterity:      2, intelligence:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
feral_griffe_effilee = Race.create(name: "Féral griffe-effilée", skill: Skill.new(acrobatics: 2, stealth: 2),       average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r)],                                                          source_id: mdj2.id, cat_size: "M", speed: 6)
feral_longue_dent    = Race.create(name: "Féral longue-dent",    skill: Skill.new(athletics: 2, endurance: 2),      average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength:      2, wisdom:        2, kind: r)],                                                          source_id: mdj2.id, cat_size: "M", speed: 6)
forgelier            = Race.create(name: "Forgelier",            skill: Skill.new(endurance: 2, intimidate: 2),     average_height: '1,80 m à 1,95 m',  average_weight: '135 à 150 kg', vision: 'normale',  language: 'commun',                                       stats: [Stat.new(constitution:  2, strength:      2, kind: r), Stat.new(constitution:   2, intelligence:  2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
genasi               = Race.create(name: "Genasi",               skill: Skill.new(endurance: 2, nature: 2),         average_height: '1,70 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, originel',                             stats: [Stat.new(strength:      2, intelligence:  2, kind: r), Stat.new(strength:       2, constitution:  2,  kind: r)], source_id: roou.id, cat_size: "M", speed: 6)
githzerai            = Race.create(name: "Githzerai",            skill: Skill.new(acrobatics: 2, athletics: 2),     average_height: '1,80 m à 1,95 m',  average_weight: '80 à 95 kg',   vision: 'normale',  language: 'commun, profond',                              stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r), Stat.new(dexterity:      2, intelligence:  2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
gnome                = Race.create(name: "Gnome",                skill: Skill.new(arcana: 2, stealth: 2),           average_height: '1,10 m à 1,20 m',  average_weight: '25 à 37 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(intelligence:  2, charisma:      2, kind: r), Stat.new(intelligence:   2, dexterity:     2,  kind: r)], source_id: mdj2.id, cat_size: "P", speed: 5)
goliath              = Race.create(name: "Goliath",              skill: Skill.new(athletics: 2, nature: 2),         average_height: '2,40 m à 2,50 m',  average_weight: '140 à 170 kg', vision: 'normale',  language: 'commun, et nain ou géant',                     stats: [Stat.new(strength:      2, constitution:  2, kind: r), Stat.new(strength:       2, wisdom:        2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
halfelin             = Race.create(name: "Halfelin",             skill: Skill.new(acrobatics: 2, thievery: 2),      average_height: '1,15 m à 1,25 m',  average_weight: '37 à 42 kg',   vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(dexterity:     2, constitution:  2, kind: r), Stat.new(dexterity:      2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "P", speed: 6)
humain               = Race.create(name: "Humain",               skill: nil,                                        average_height: '1,65 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength: 2, kind: r), Stat.new(constitution: 2, kind: r), Stat.new(dexterity: 2, kind: r), Stat.new(intelligence: 2, kind: r), Stat.new(wisdom: 2, kind: r), Stat.new(charisma: 2, kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
kalashtar            = Race.create(name: "Kalashtar",            skill: Skill.new(insight: 2),                      average_height: '1,70 m à 1,90 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: kalashtar_language,                             stats: [Stat.new(wisdom:        2, charisma:      2, kind: r), Stat.new(wisdom:         2, intelligence:  2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
minotaure            = Race.create(name: "Minotaure",            skill: Skill.new(nature: 2, perception: 2),        average_height: '2,15 m à 2,30 m',  average_weight: '160 à 175 kg', vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength:      2, constitution:  2, kind: r), Stat.new(strength:       2, wisdom:        2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
nain                 = Race.create(name: "Nain",                 skill: Skill.new(endurance: 2, dungeoneering: 2),  average_height: '1,25 m à 1,45 m',  average_weight: '80 à 110 kg',  vision: 'nocturne', language: 'commun, nain',                                 stats: [Stat.new(constitution:  2, strength:      2, kind: r), Stat.new(constitution:   2, wisdom:        2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 5)
silvyen              = Race.create(name: "Silvyen",              skill: Skill.new(stealth: 2, nature: 2),           average_height: '1,80 m à 1,95 m',  average_weight: '70 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(constitution:  2, wisdom:        2, kind: r), Stat.new(constitution:   2, dexterity:     2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
tieffelin            = Race.create(name: "Tieffelin",            skill: Skill.new(bluff: 2, stealth: 2),            average_height: '1,65 m à 1,85 m',  average_weight: '70 à 115 kg',  vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(charisma:      2, constitution:  2, kind: r), Stat.new(charisma:       2, intelligence:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)

RaceFeature.create(races: [eladrin, elfe, gnome, silvyen, drow],  name: "Origine féerique",     description: "vos ancêtres étaient natifs de Féerie, vous êtes donc considéré comme une créature féerique au regard des effets liés à cette origine.")
RaceFeature.create(races: [cristallien, forgelier],   name: "Créature artificielle vivante",    description: "vous êtes une créature artificielle vivante. Vous n'avez pas besoin de manger, de boire, de respirer et de dormir. Vous n'effectuez jamais de tests d'Endurance pour résister aux effets de la faim, de la soif ou de l'asphyxie.")
RaceFeature.create(races: [demi_elfe],                name: "Dilettante",                       description: "au niveau 1, vous choisissez un pouvoir à volonté d'une classe différente de la vôtre, que vous pouvez utiliser en tant que pouvoir de rencontre.")
RaceFeature.create(races: [demi_elfe],                name: "Diplomatie de groupe",             description: "vous conférez un bonus racial de +1 aux tests de Diplomatie de tous vos alliés situés dans un rayon de 10 cases.")
RaceFeature.create(races: [demi_elfe],                name: "Double héritage",                  description: "vous avez accès aux talents ayant elfe ou humain comme prérequis (ainsi que ceux qui s'adressent spécifiquement aux demi-elfes), du moment que vous remplissez les autres conditions.")
RaceFeature.create(races: [drakeide],                 name: "Fureur drakéide",                  description: "lorsque vous êtes en péril, vous bénéficiez d'un bonus racial de +1 aux jets d'attaque.")
RaceFeature.create(races: [drakeide],                 name: "Héritage draconique",              description: "votre valeur de récupération est égale au quart de vos points de vie maximums + votre modificateur de Constitution.")
RaceFeature.create(races: [drakeide],                 name: "Souffle de dragon",                description: "vous pouvez utilisez <em>souffle de dragon</em> en tant que pouvoir de rencontre.")
RaceFeature.create(races: [eladrin],                  name: "Éclipse féerique",                 description: "vous pouvez utilisez <em>Éclipse féerique</em> en tant que pouvoir de rencontre.")
RaceFeature.create(races: [eladrin],                  name: "Éducation éladrine",               description: "vous bénéficiez d'une formation supplémentaire dans une compétence choisie dans la liste du Chapitre 5.")
RaceFeature.create(races: [eladrin],                  name: "Maniement des armes éladrines",    description: "vous êtes formé au maniement de l'épée longue.")
RaceFeature.create(races: [eladrin, drow],            name: "Transe",                           description: "plutôt que de dormir, vous entrez dans un état méditatif connu sous le nom de transe. Quatre heures de transe vous procurent les mêmes effets que six heures de repos prolongé pour toute autre race. Lorsque vous êtes en transe, vous êtes parfaitement conscient de ce qui vous entoure. Vous pouvez ainsi détecter les ennemis en approche et tout autre événement.")
RaceFeature.create(races: [eladrin],                  name: "Volonté éladrine",                 description: "vous bénéficiez d'un bonus racial de +1 en Volonté, et d'un bonus racial de +5 aux jets de sauvegarde contre les effets de charme.")
RaceFeature.create(races: [elfe],                     name: "Maniement des armes elfiques",     description: "vous êtes formé au maniement de l'arc court et de l'arc long.")
RaceFeature.create(races: [elfe],                     name: "Pas assuré",                       description: "vous ignorez un terrain difficile lorsque vous vous décalez (même si vous possédez un pouvoir vous permettant de vous décalez sur plusieurs cases).")
RaceFeature.create(races: [elfe],                     name: "Précision elfique",                description: "vous pouvez utilisez <em>Précision elfique</em> en tant que pouvoir de rencontre.")
RaceFeature.create(races: [elfe],                     name: "Vigilance de groupe",              description: "vous conférez un bonus racial de +1 aux tests de Perception de tous vos alliés non elfes situés dans un rauon de 5 cases.")
RaceFeature.create(races: [halfelin],                 name: "Audacieux",                        description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre la terreur.")
RaceFeature.create(races: [halfelin],                 name: "Deuxième chance",                  description: "vous pouvez utilisez <em>Deuxième chance</em> en tant que pouvoir de rencontre.")
RaceFeature.create(races: [halfelin],                 name: "Réflexes éclair",                  description: "vous bénéficiez d'un bonus racial de +2 à la CA contre les attaques d'opportunité.")
RaceFeature.create(races: [humain],                   name: "Bonus de défense humain",          description: "vous bénéficiez d'un bonus de +1 en Vigueur, Réflexes et Volonté.")
RaceFeature.create(races: [humain],                   name: "Compétence supplémentaire",        description: "vous gagnez une formation supplémentaire dans une de vos compétences de classe.")
RaceFeature.create(races: [humain],                   name: "Pouvoir à volonté supplémentaire", description: "vous connaissez un pouvoir à volonté supplémentaire de votre classe.")
RaceFeature.create(races: [humain],                   name: "Talent supplémentaire",            description: "vous gagnez un talent supplémentaire au niveau 1. Vous devez cependant en remplir les prérequis.")
RaceFeature.create(races: [nain],                     name: "Ancré dans le sol",                description: "lorsque vous êtes la cible d'une poussée, d'un tirage ou d'une glissade, vous pouvez réduire de 1 le nombre de case de déplacement qui vous est imposé. Cela signifie qu'un effet qui pousse, tire ou fait glisser de 1 case ne vous affecte que si vous le désirez.<br>De plus, lorsqu'une attaque vous fait tomber à terre, vous pouvez immédiatement effectuer un jet de sauvegarde pour éviter cette chute.")
RaceFeature.create(races: [nain],                     name: "Boyaux d'acier",                   description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre le poison.")
RaceFeature.create(races: [nain],                     name: "Déplacement avec charge",          description: "vous avancez à la hauteur de votre VD, même lorsque celle-ci doit être réduite du fait de votre armure ou d'une charge lourde. Les autres effets qui diminuent votre VD vous affecte normalement (comme un terrain difficile ou un effet magique).")
RaceFeature.create(races: [nain],                     name: "Maniement des armes naines",       description: "vous êtes formé au maniement du marteau de lancer et du marteau de guerre.")
RaceFeature.create(races: [nain],                     name: "Résistance naine",                 description: "vous pouvez recourir à votre second souffle au prix d'une action mineure au lieu d'une action simple.")
RaceFeature.create(races: [tieffelin],                name: "Appel du sang",                    description: "vous bénéficiez d'un bonus racial de +1 aux jets d'attaque contre les adversaires en péril.")
RaceFeature.create(races: [tieffelin],                name: "Courroux infernal",                description: "vous pouvez utilisez <em>Courroux infernal</em> en tant que poiuvoir de rencontre.")
RaceFeature.create(races: [tieffelin],                name: "Résistance au feu",                description: "vous bénéficiez d'une résistance au feu 5 + la moitié de votre niveau.")
RaceFeature.create(races: [demi_orque],               name: "Assaut enragé",                    description: "vous avez le pouvoir <em>Assaut enragé</em>.")
RaceFeature.create(races: [demi_orque],               name: "Charge véloce",                    description: "vous gagnez un bonus de +2 à la vitesse de déplacement lorsque vous chargez.")
RaceFeature.create(races: [demi_orque],               name: "Vitalité demi-orque",              description: "la première fois que vous êtes en péril au cours d'une rencontre, vous gagnez5 points de vie temporaires. Ce nombre augment à 10 au niveau 11 et 15 au niveau 21.")
RaceFeature.create(races: [deva],                     name: "Majesté astrale",                  description: "vous bénéficiez d'un bonus de +1 à toutes vos défenses contre les attaques effectuées par une créature en péril.")
RaceFeature.create(races: [deva],                     name: "Mémoire d'un millier de vies",     description: "vous avez le pouvoir <em>Mémoire d'un millier de vies</em>.")
RaceFeature.create(races: [deva, cristallien],        name: "Origine immortelle",               description: "votre âme est native de la Mer Astrale et vous êtes considéré comme une créature immortelle pour déterminer les effets relatifs à l'origine d'une créature.")
RaceFeature.create(races: [deva],                     name: "Résistance astrale",               description: "vous bénéficiez d'une résistance aux dégâts nécrotiques et radiants égale à 5 + la moitié de votre niveau.")
RaceFeature.create(races: [feral_griffe_effilee],     name: "Sauvagerie griffe-effilée",        description: "Vous avez le pouvoir <em>Sauvagerie griffe-effilée</em>.")
RaceFeature.create(races: [feral_longue_dent],        name: "Sauvagerie longue-dent",           description: "Vous avez le pouvoir <em>Sauvagerie longue-dent</em>.")
RaceFeature.create(races: [gnome],                    name: "Discrétion réactive",              description: "Vous avez le pouvoir <em>Effacement</em>.")
RaceFeature.create(races: [gnome],                    name: "Maître menteur",                   description: "une fois par rencontre, vous pouvez utilisez le tour de prestigitation de magicien <em>Son imaginaire</em> (cf. p.76 du <em>Manuel des Joueurs</em>) au prix d'une action mineure.")
RaceFeature.create(races: [gnome],                    name: "Perspicacité du menteur",          description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre les illusions.")
RaceFeature.create(races: [goliath],                  name: "Athlète puissant",                 description: "lorsque vous effectuez un test d'Athlétisme pour sauter ou grimper, jetez deux dés et conservez l'un des résultats.")
RaceFeature.create(races: [goliath],                  name: "Endurance de la pierre",           description: "Vous avez le pouvoir <em>Endurance de la pierre</em>.")
RaceFeature.create(races: [goliath],                  name: "Ténacité de la montagne",          description: "vous bénéficiez d'un bonus racial de +1 à la Volonté.")
RaceFeature.create(races: [cristallien],              name: "Esprit cristallin",                description: "vous bénéficiez d'une résistance psychique 5. Cette résistance augment à 10 au niveau 11 et 15 au niveau 21.")
RaceFeature.create(races: [cristallien],              name: "Nuée de cristaux",                 description: "Vous avez le pouvoir <em>Nué de cristaux</em>.")
RaceFeature.create(races: [cristallien],              name: "Télépathie",                       description: "vous pouvez communiquer par télépathie avec toute créature douée de langage située dans un rayon de 5 cases.")
RaceFeature.create(races: [githzerai],                name: "Esprit défendu",                   description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegardecontre les effets qui hébètent, dominent ou étourdissent.")
RaceFeature.create(races: [githzerai],                name: "Heureuse fortune",                 description: "quand vous utilisez votre second souffle, vous pouvez vous décalez de 3 cases au prix d'une action libre.")
RaceFeature.create(races: [githzerai],                name: "Mental dacier",                    description: "Vous avez le pouvoir <em>Mental d'acier</em>.")
RaceFeature.create(races: [githzerai],                name: "Sens du danger",                   description: "vous bénéficiez d'un bonus racial de +2 aux tests d'initiative.")
RaceFeature.create(races: [minotaure],                name: "Charge encornée",                  description: "Vous avez le pouvoir <em>Charge encornée</em>.")
RaceFeature.create(races: [minotaure],                name: "Charge intrépide",                 description: "vous bénéficiez d'un bonus racial de +2 à la CA contre les attaques d'opportunités que vous provoquez lors d'une charge.")
RaceFeature.create(races: [minotaure],                name: "Férocité",                         description: "lorsque vous êtes réduit à 0 point de vie ou moins, vous pouvez effectuer une attaque de base de corps à corps au prix d'une interruption immédiate.")
RaceFeature.create(races: [minotaure],                name: "Vitalité",                         description: "vous avez une récupération supplémentaire")
RaceFeature.create(races: [silvyen],                  name: "Aspect de la nature",              description: "quand vous arrivez au bout d'un repos prolongé, choisissez lequel des aspects de la nature suivant vous manifestez.<br><em>Aspect des anciens</em> : vous pouvez utilisez le pouvoir <em>Voyage des anciens</em> quand vous manifestez cet aspect.<br><em>Aspect du chasseur</em> : vous pouvez utilisez le pouvoir <em>Poursuite du chasseur</em> quand vous manifestez cet aspect.<br><em>Aspect du destructeur</em> : vous pouvez utilisez le pouvoir <em>Courroux du destructeur</em> quand vous manifestez cet aspect.")
RaceFeature.create(races: [silvyen],                  name: "Forme endurcie",                   description: "choisissez les Réflexes, la Vigueur ou la Volonté. Vous bénéficiez d'un bonus racial de +1 dans cette défense.")
RaceFeature.create(races: [changelin],                name: "Change-forme",                     description: "vous avez le pouvoir <em>Déguisement du changelin</em>.")
RaceFeature.create(races: [changelin],                name: "Défense mentale",                  description: "vous bénéficiez d'un bonus racial de +1 en Volonté.")
RaceFeature.create(races: [changelin],                name: "Métamorphe",                       description: "vous êtes un métmorphe et pouvez modifier votre apparence. Vous êtes donc sujet aux effets et états préjudiciables qui affectent les métmorphes.")
RaceFeature.create(races: [changelin],                name: "Ruse du changelin",                description: "vous avez le pouvoir <em>Ruse du changelin</em>.")
RaceFeature.create(races: [forgelier],                name: "Esprit du forgelier",              description: "vous bénéficiez d'un bonus racial de +1 en Volonté.")
RaceFeature.create(races: [forgelier],                name: "Opiniâtreté forgelière",           description: "vous avez le pouvoir <em>Opiniâtreté forgelière</em.")
RaceFeature.create(races: [forgelier],                name: "Résistance forgelière",            description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegarde contre les dégâts continus. De plus, lorsque vous effectuez un jet de sauvegarde contre la mort, vous pouvez choisir de faire 10 pour remplacer le résultat de votre jet.")
RaceFeature.create(races: [forgelier],                name: "Veilleur infatigable",             description: "vous n'avez pas besoin de dormir, mais vous devez rester inactif pendant 4 heures pour prendre un repos prolongé. Dans cet état de passivité, vous êtes pleinement conscient de ce qui vous entoure. Vous pouvez ainsi remarquez les ennemis en approche et tout autre événement.")
RaceFeature.create(races: [kalashtar],                name: "Âme double",                       description: "au début de votre tour de jeu, vous pouvez effectuer un jet de sauvegarde contre chaque effet qui vous hébète ou vous domine. Si vous ratez ce jet de sauvegarde, vous n'en effectuez pas un autre contre l'effet en question à la fin de votre tour de jeu.")
RaceFeature.create(races: [kalashtar],                name: "Bastion de clarté mentale",        description: "vous avez le pouvoir <em>Bastion de clarté mentale</em.")
RaceFeature.create(races: [drow],                     name: "Lolthaïque",                       description: "une fois par rencontre, vous pouvez utilisez <em>Chape d'obscurité</em> ou <em>Noirfeu</em>.")
RaceFeature.create(races: [genasi],                   name: "Origine élémentaire",              description: "vos ancêtres étaient natifs du Chaos Élémentaire, vous êtes donc considéré comme une créature élémentaire au regard des effets liés à cette origine.")
RaceFeature.create(races: [genasi],                   name: "Manifestation élémentaire",        description: "choisissez une manifestation élémentaire: âme d'eau, âme de feu, âme d'orage, âme de terre ou âme de vent. Cette manifestation fait partie intégrante de votre nature(le talent <em>Manifestation élémentaire</em>, p.136, vous permet cependant de prendre des manifestations en plus et d'en changer). Chaque manifestation élémentaire propose des avantages particuliers et un pouvoir de rencontre. Enfin votre apparence change selon l'élement que vous manifestez.<br>
<em>Âme d'eau</em> : vous pouvez respirer sous l'eau. Vous bénéficiez également d'un bonus racial de +2 aux jets de sauvegarde contre les dégâts continus et du pouvoir <em>Cours rapide</em>.<br>
<em>Âme de feu</em> : vous bénéficiez d'un bonus racial de +1 en Réflexes, d'une résistance au feu 5 et du pouvoir <em>Retour de flammes</em>.<br>
Au niveau 11, la résistance augmente à feu 10.<br>
Au niveau 21, la résistance augmente à feu 15.<br>
<em>Âme d'orage</em> : vous bénéficiez d'un bonus racial de +1 en Vigueur, d'une résistance à l'électricité 5 et du pouvoir <em>Promesse d'orage</em>.<br>
Au niveau 11, la résistance augmente à électricité 10.<br>
Au niveau 21, la résistance augmente à électricité 15.<br>
<em>Âme de terre</em> : vous bénéficiez d'un bonus racial de +1 en Vigueur, d'un bonus racial de +1 aux jets de sauvegarde et du pouvoir <em>Secousse sismique</em>.<br>
<em>Âme de vent</em> : vous bénéficiezd'une résistance au froid 5 du pouvoir <em>Arpenteur des vents</em>.<br>
Au niveau 11, la résistance augmente à froid 10.<br>
Au niveau 21, la résistance augmente à froid 15.")









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
        t = KlassFeature.create(name: top_feature, klasses: [klass])
        children_feature.each do |child|
          KlassFeature.create(name: child, klasses: [klass], top_feature: t)
        end
      end
    else
      c = KlassFeature.find_by_name(feature)
      if c.nil?
        KlassFeature.create(name: feature, klasses: [klass])
      else
        c.klasses << klass
        c.save
      end
    end
  end
end

# password: plop
User.create(name: 'illisae', email: 'eric.le.guellaut@hotmail.fr',  password_digest: '$2a$10$mW18Uf2qvZPfVQW.oQwnEO5pkYX.uQQ2qrQ3mSwetQ8wf8E/Y2gJK')
