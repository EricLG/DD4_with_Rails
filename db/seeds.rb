# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Start to seed DB ..."

Source.create([
  { name: 'Art de la Guerre 1' },
  { name: 'Art de la Guerre 2' },
  { name: 'Bestiaire Fantastique 1' },
  { name: 'Bestiaire Fantastique 2' },
  { name: 'Bestiaire Fantastique 3' },
  { name: 'Chaos Élémentaire' },
  { name: 'Eberron' },
  { name: 'Encyclopédie des Royaumes Oubliés' },
  { name: 'Force de la Nature' },
  { name: 'Guide du Maître 1' },
  { name: 'Guide du Maître 2' },
  { name: 'Intervention Divine' },
  { name: 'Le Comptoir de l\'Aventure 1' },
  { name: 'Le Comptoir de l\'Aventure 2' },
  { name: 'Manuel des Joueurs 1' },
  { name: 'Manuel des Joueurs 2' },
  { name: 'Manuel des Joueurs 3' },
  { name: 'Manuel des Plans' },
  { name: 'Mer Astrale' },
  { name: 'Outreterre' },
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

allonge         = WeaponProperty.create(name: "Allonge",                description:"Avec une arme à allonge, vous pouvez attaquez des ennemis situés à 2 cases (mais aussi des adversaires adjacents) sans malus à l'attaque. Par contre, vous ne pouvez effectuer d'attaques d'opportunité que contre les ennemis adjacents. De même, vous ne pouvez prendre en tenaille qu'un ennemi adjacent.")
jet_leger       = WeaponProperty.create(name: "Arme de jet légère",     description:"Une attaque à distance normale avec une arme de jet légère s'appuie sur la Dextérité. Ces armes n'infligent pas autant de dégâts que les armes de jet lourdes, mais différents pouvoirs vous permettent d'en lancer plusieurs à la fois ou de suite.")
jet_lourd       = WeaponProperty.create(name: "Arme de jet lourde",     description:"Cette arme ne lance pas de projectiles. En revanche, on peut la lancer. Une attaque à distance avec une arme de jet lourde s'appuie sur la Force (et non la Dextérité) pour les jets d'attaques et de dégâts.")
brutal_1        = WeaponProperty.create(name: "Brutale 1",              description:"Les dégâts minimaux d'une arme brutale sont plus élevés que ceux d'une arme normale. Lorsque vous jetez les dégâts de l'arme, relancez tous les dés dont le résultat est égal ou inférieur à 1.")
brutal_2        = WeaponProperty.create(name: "Brutale 2",              description:"Les dégâts minimaux d'une arme brutale sont plus élevés que ceux d'une arme normale. Lorsque vous jetez les dégâts de l'arme, relancez tous les dés dont le résultat est égal ou inférieur à 2.")
crit_ame        = WeaponProperty.create(name: "Critique amélioré",      description:"Une arme ayant cette propriété inflige plus de dégâts lorsque vous réussissez un coup critique. Un coup critique inflige les dégâts maximums de l'arme, auxquels s'ajoutent des dégâts supplémentaires égaux à 1[A] aux niveaux 1-10, 2[A] aux niveaux 11-20 et 3[A] aux niveaux 21-30. Ces dégâts supplémentaires s'ajoutent à d'éventuels dégâts critiques que produirait une arme magique.")
defensive       = WeaponProperty.create(name: "Défensive",              description:"Une arme défensive vous confère un bonus de +1 à la CA tant que vous la tenez dans une main et que vous tenez une seconde arme de corps à corps dans l'autre main. L'utilisation de plusieurs armes défensives n'augmentent pas ce bonus. Pour bénéficiez de ce dernier, vous n'avez pas besoin d'attaquer avec l'arme défensive, mais vous devez être formé à son maniement.")
petite          = WeaponProperty.create(name: "Petite",                 description:"Cette propriété désigne une arme à deux mains ou polyvalente qu'un personnage de taille P peut utiliser comme le ferait un personnage de taille M. Par exemple, un halfelin peut utiliser un arc court même si habituellement les représentants de cette race ne peuvent pas se servir d'armes à deux mains.")
polyvalente     = WeaponProperty.create(name: "Polyvalente",            description:"Les armes polyvalentes sont des armes à une main, mais vous pouvez les utilisez à deux mains. Si vous maniez une arme polyvalente à deux mains, vous infligez 1 dégât supplémentaire quand vous frappez. Un personnage de taille P est obligé d'utiliser les deux mains pour manier une arme polyvalente et n'inflige pas de dégât supplémentaire.")
rechar_libre    = WeaponProperty.create(name: "Rechargement (libre)",   description:"Les armes à distance qui tirent des projectiles doivent être rechargées. Cette arme nécessite une action libre pour être rechargée.")
rechar_mineure  = WeaponProperty.create(name: "Rechargement (mineure",  description:"Les armes à distance qui tirent des projectiles doivent être rechargées. Cette arme nécessite une action mineure pour être rechargée.")
secondaire      = WeaponProperty.create(name: "Secondaire",             description:"Une arme secondaire est assez légère pour que vous puissiez la tenir dans la main non directrice et attaquer tout en portant une arme dans la main principale. Vous ne pouvez attaquer avec les deux armes durant le même tour à moins d'avoir un pouvoir qui vous le permette. En revanche, vous pouvez attaquer avec l'une ou l'autre.")


impro_cac   = WeaponCategory.create(name: 'Armes improvisées de corps à corps', ranged: false,  code: 'impcc')
impro_dist  = WeaponCategory.create(name: 'Armes improvisées à distance',       ranged: true,   code: 'impra')
simple_cac  = WeaponCategory.create(name: 'Armes simples de corps à corps',     ranged: false,  code: 'simcc')
simple_dist = WeaponCategory.create(name: 'Armes simples à distance',           ranged: true,   code: 'simra')
guerre_cac  = WeaponCategory.create(name: 'Armes de guerre de corps à corps',   ranged: false,  code: 'warcc')
guerre_dist = WeaponCategory.create(name: 'Armes de guerre à distance',         ranged: true,   code: 'warra')
sup_cac     = WeaponCategory.create(name: 'Armes supérieures de corps à corps', ranged: false,  code: 'supcc')
sup_dist    = WeaponCategory.create(name: 'Armes supérieures à distance',       ranged: true,   code: 'supra')

baguettes   =  ImplementGroup.create(name: "Baguettes",        code: 'wands'         )
batons_i    =  ImplementGroup.create(name: "Bâtons",           code: 'batons'        )
orbes       =  ImplementGroup.create(name: "Orbes",            code: 'orbs'          )
sceptres    =  ImplementGroup.create(name: "Sceptres",         code: 'scepters'      )
symboles    =  ImplementGroup.create(name: "Symboles sacrés",  code: 'holy_symbols'  )
tomes       =  ImplementGroup.create(name: "Tomes",            code: 'tomes'         )
totems      =  ImplementGroup.create(name: "Totems",           code: 'totems'        )
focus_ki    =  ImplementGroup.create(name: "Focus ki",         code: 'focus_ki'      )

CommonWeapon.create([
  { name: 'Dague',                  two_handed: 1, handling: "+3", damage: "1d4",      range: "5/10",  price: "1 po",  weight: "0,5 kg",         source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_legere],               weapon_properties: [jet_leger, secondaire] },
  { name: 'Gourdin',                two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "1 po",  weight: "1,5 kg",         source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse] },
  { name: 'Javeline',               two_handed: 1, handling: "+2", damage: "1d6",      range: "10/20", price: "5 po",  weight: "1 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lance],                     weapon_properties: [jet_lourd] },
  { name: 'Lance',                  two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "3 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lance],                     weapon_properties: [polyvalente] },
  { name: "Masse d'armes",          two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "3 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse],                    weapon_properties: [polyvalente] },
  { name: 'Serpe',                  two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "2 po",  weight: "1 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Bâton',                  two_handed: 2, handling: "+2", damage: "1d8",      range: "0",     price: "5 po",  weight: "2 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [baton] },
  { name: 'Faux',                   two_handed: 2, handling: "+2", damage: "2d4",      range: "0",     price: "5 po",  weight: "4 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [lame_lourde] },
  { name: 'Massue',                 two_handed: 2, handling: "+2", damage: "2d4",      range: "0",     price: "1 po",  weight: "5 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse] },
  { name: 'Morgenstern',            two_handed: 2, handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "4 kg",           source: mdj1, weapon_category: simple_cac,  weapon_groups: [massse] },
  { name: 'Cimeterre',              two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "10 po", weight: "2 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Épée courte',            two_handed: 1, handling: "+3", damage: "1d6",      range: "0",     price: "10 po", weight: "1 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Épée longue',            two_handed: 1, handling: "+3", damage: "1d8",      range: "0",     price: "15 po", weight: "2 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: "Fléau d'armes",          two_handed: 1, handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [fleau],                     weapon_properties: [polyvalente] },
  { name: "Hache d'armes",          two_handed: 1, handling: "+2", damage: "1d10",     range: "0",     price: "15 po", weight: "3 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache],                     weapon_properties: [polyvalente] },
  { name: 'Marteau de guerre',      two_handed: 1, handling: "+2", damage: "1d10",     range: "0",     price: "15 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau],                   weapon_properties: [polyvalente] },
  { name: 'Marteau de lancer',      two_handed: 1, handling: "+2", damage: "1d6",      range: "5/10",  price: "5 po",  weight: "1 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau],                   weapon_properties: [jet_lourd, secondaire] },
  { name: 'Pic de guerre',          two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "15 po", weight: "3 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame, polyvalente] },
  { name: 'Cimeterre à deux mains', two_handed: 2, handling: "+3", damage: "2d4",      range: "0",     price: "25 po", weight: "3,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Coutille',               two_handed: 2, handling: "+2", damage: "2d4",      range: "0",     price: "25 po", weight: "5 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde, hast],         weapon_properties: [allonge] },
  { name: 'Épée à deux mains',      two_handed: 2, handling: "+3", damage: "1d10",     range: "0",     price: "30 po", weight: "4 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [allonge] },
  { name: "Fléau d'armes lourd",    two_handed: 2, handling: "+2", damage: "2d6",      range: "0",     price: "25 po", weight: "5 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [fleau] },
  { name: 'Grande hache',           two_handed: 2, handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache] },
  { name: 'Hallebarde',             two_handed: 2, handling: "+2", damage: "1d10",     range: "0",     price: "25 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hache, hast],               weapon_properties: [allonge] },
  { name: 'Maillet',                two_handed: 2, handling: "+2", damage: "2d6",      range: "0",     price: "30 po", weight: "6 kg",           source: mdj1, weapon_category: guerre_cac,  weapon_groups: [marteau] },
  { name: 'Pique',                  two_handed: 2, handling: "+2", damage: "1d10",     range: "0",     price: "10 po", weight: "4,5 kg",         source: mdj1, weapon_category: guerre_cac,  weapon_groups: [hast, lance],               weapon_properties: [allonge] },
  { name: 'Épée bâtarde',           two_handed: 1, handling: "+3", damage: "1d10",     range: "0",     price: "30 po", weight: "3 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: 'Katar',                  two_handed: 1, handling: "+3", damage: "1d6",      range: "0",     price: "3 po",  weight: "0,5 kg",         source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [crit_ame, secondaire] },
  { name: 'Rapière',                two_handed: 1, handling: "+3", damage: "1d8",      range: "0",     price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [lame_legere] },
  { name: 'Chaine cloutée',         two_handed: 2, handling: "+3", damage: "2d4",      range: "0",     price: "30 po", weight: "5 kg",           source: mdj1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [allonge] },
  { name: 'Mains nues',             two_handed: 1, handling: "+0", damage: "1d4",      range: "0",     price: "-",     weight: "-",              source: mdj1, weapon_category: impro_cac,   weapon_groups: [mains_nues] },
  { name: 'Objet 1H',               two_handed: 1, handling: "+0", damage: "1d4",      range: "0",     price: "-",     weight: "x0,5 - 2,5 kg",  source: mdj1, weapon_category: impro_cac,   weapon_groups: [no_group] },
  { name: 'Objet 2H',               two_handed: 2, handling: "+0", damage: "1d8",      range: "0",     price: "-",     weight: "3 - 6 kg",       source: mdj1, weapon_category: impro_cac,   weapon_groups: [no_group] },
  { name: 'Arbalète de poing',      two_handed: 1, handling: "+2", damage: "1d6",      range: "10/20", price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_libre] },
  { name: 'Fronde',                 two_handed: 1, handling: "+2", damage: "1d6",      range: "10/20", price: "1 po",  weight: "0 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [fronde],                    weapon_properties: [rechar_libre] },
  { name: 'Arbalete',               two_handed: 2, handling: "+2", damage: "1d8",      range: "15/30", price: "25 po", weight: "2 kg",           source: mdj1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_mineure] },
  { name: 'Arc court',              two_handed: 2, handling: "+2", damage: "1d8",      range: "15/30", price: "25 po", weight: "1 kg",           source: mdj1, weapon_category: guerre_dist, weapon_groups: [arc],                       weapon_properties: [petite, rechar_libre] },
  { name: 'Arc long',               two_handed: 2, handling: "+2", damage: "1d10",     range: "20/40", price: "30 po", weight: "2,5 kg",         source: mdj1, weapon_category: guerre_dist, weapon_groups: [arc],                       weapon_properties: [rechar_libre] },
  { name: 'Shuriken(5)',            two_handed: 1, handling: "+2", damage: "1d4",      range: "6/12",  price: "1 po",  weight: "0,25 kg",        source: mdj1, weapon_category: guerre_dist, weapon_groups: [lame_legere],               weapon_properties: [jet_leger] },
  { name: 'Objet distance 1H',      two_handed: 1, handling: "+0", damage: "1d4",      range: "5/10",  price: "-",     weight: "0,5 kg",         source: mdj1, weapon_category: impro_dist,  weapon_groups: [no_group] },
  { name: 'Gantelet cloutés',       two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "5 po",  weight: "0,5 kg",         source: cda1, weapon_category: simple_cac,  weapon_groups: [mains_nues],                weapon_properties: [secondaire] },
  { name: 'Épée large',             two_handed: 1, handling: "+2", damage: "1d10",     range: "0",     price: "20 po", weight: "2,5 kg",         source: cda1, weapon_category: guerre_cac,  weapon_groups: [lame_lourde],               weapon_properties: [polyvalente] },
  { name: 'Fouet barbelé',          two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "3 po",  weight: "1 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [fleau],                     weapon_properties: [secondaire] },
  { name: 'Khopesh',                two_handed: 1, handling: "+2", damage: "1d8",      range: "0",     price: "10 po", weight: "4 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [hache, lame_lourde],        weapon_properties: [brutal_1, polyvalente] },
  { name: 'Pic de guerre léger',    two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "2 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame, secondaire] },
  { name: 'Trident',                two_handed: 1, handling: "+2", damage: "1d8",      range: "3/6",   price: "10 po", weight: "2 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [lance],                     weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Pic de guerre lourd',    two_handed: 2, handling: "+2", damage: "1d12",     range: "0",     price: "20 po", weight: "4 kg",           source: cda1, weapon_category: guerre_cac,  weapon_groups: [pic],                       weapon_properties: [crit_ame] },
  { name: 'Bouclier à pointe',      two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "3,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [secondaire] },
  { name: 'Dague de parade',        two_handed: 1, handling: "+2", damage: "1d4",      range: "0",     price: "5 po",  weight: "0,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [defensive, secondaire] },
  { name: 'Fléau à trois têtes',    two_handed: 1, handling: "+3", damage: "1d10",     range: "0",     price: "15 po", weight: "3 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [polyvalente] },
  { name: 'Hache de guerre',        two_handed: 1, handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "5 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [polyvalente] },
  { name: 'Kukri',                  two_handed: 1, handling: "+2", damage: "1d6",      range: "0",     price: "10 po", weight: "1 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere],               weapon_properties: [brutal_1, secondaire] },
  { name: "marteau d'escarpe",      two_handed: 1, handling: "+2", damage: "1d10",     range: "0",     price: "20 po", weight: "3 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],                   weapon_properties: [brutal_2, polyvalente] },
  { name: 'Tratnyr',                two_handed: 1, handling: "+2", damage: "1d8",      range: "10/20", price: "10 po", weight: "2,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lance],                     weapon_properties: [jet_lourd, polyvalente] },
  { name: 'Espadon',                two_handed: 2, handling: "+3", damage: "1d12",     range: "0",     price: "30 po", weight: "5 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_lourde],               weapon_properties: [crit_ame] },
  { name: 'Grande lance',           two_handed: 2, handling: "+3", damage: "1d10",     range: "0",     price: "25 po", weight: "4 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hast, lance],               weapon_properties: [allonge] },
  { name: 'hache de bourreau',      two_handed: 2, handling: "+2", damage: "1d12",     range: "0",     price: "30 po", weight: "7 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [brutal_2, crit_ame] },
  { name: 'Mordenkrad',             two_handed: 2, handling: "+2", damage: "2d6",      range: "0",     price: "30 po", weight: "6 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [marteau],                   weapon_properties: [brutal_1] },
  { name: 'Épée double',            two_handed: 3, handling: "+3", damage: "1d8/1d8",  range: "0",     price: "40 po", weight: "4,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [lame_legere, lame_lourde],  weapon_properties: [defensive, secondaire] },
  { name: 'Fléau double',           two_handed: 3, handling: "+2", damage: "1d10/1d10",range: "0",     price: "30 po", weight: "5,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [fleau],                     weapon_properties: [defensive, secondaire] },
  { name: 'Hache double',           two_handed: 3, handling: "+2", damage: "1d10/1d10",range: "0",     price: "40 po", weight: "7,5 kg",         source: cda1, weapon_category: sup_cac,     weapon_groups: [hache],                     weapon_properties: [defensive, secondaire] },
  { name: 'Urgrosh',                two_handed: 3, handling: "+2", damage: "1d12/1d8", range: "0",     price: "30 po", weight: "6 kg",           source: cda1, weapon_category: sup_cac,     weapon_groups: [hache, lance],              weapon_properties: [defensive, secondaire] },
  { name: 'Arbalète à répétition',  two_handed: 2, handling: "+2", damage: "1d8",      range: "10/20", price: "35 po", weight: "3 kg",           source: cda1, weapon_category: simple_dist, weapon_groups: [arbalete],                  weapon_properties: [rechar_libre] },
  { name: 'Arbalète supérieure',    two_handed: 2, handling: "+3", damage: "1d10",     range: "20/40", price: "30 po", weight: "3 kg",           source: cda1, weapon_category: sup_dist,    weapon_groups: [arbalete],                  weapon_properties: [rechar_mineure] },
  { name: 'Grand arc',              two_handed: 2, handling: "+2", damage: "1d12",     range: "25/50", price: "30 po", weight: "2,5 kg",         source: cda1, weapon_category: sup_dist,    weapon_groups: [arc],                       weapon_properties: [rechar_libre] }
])

dague       = CommonWeapon.find_by_name("Dague")
baton       = CommonWeapon.find_by_name("Bâton")
cimeterre   = CommonWeapon.find_by_name("Cimeterre")
epee_courte = CommonWeapon.find_by_name("Épée courte")
epee_longue = CommonWeapon.find_by_name("Épée longue")
cim2mains   = CommonWeapon.find_by_name("Cimeterre à deux mains")
coutile     = CommonWeapon.find_by_name("Coutille")
epee2mains  = CommonWeapon.find_by_name("Épée à deux mains")
epeelarge   = CommonWeapon.find_by_name("Épée large")
khopesh     = CommonWeapon.find_by_name("Khopesh")
mains_nues  = CommonWeapon.find_by_name("Mains nues")
fronde_arme = CommonWeapon.find_by_name("Fronde")
gourdin     = CommonWeapon.find_by_name("Gourdin")
lance_arme  = CommonWeapon.find_by_name("Lance")
shuriken    = CommonWeapon.find_by_name("Shuriken(5)")
pique       = CommonWeapon.find_by_name("Pique")
arba_poing  = CommonWeapon.find_by_name("Arbalète de poing")

etoffe      = ArmorCategory.create( name: "Armures d'étoffe",    heavy: false,  code: 'clothe'    )
cuir        = ArmorCategory.create( name: "Armures de cuir",     heavy: false,  code: 'leather'   )
peau        = ArmorCategory.create( name: "Armures de peau",     heavy: false,  code: 'skin'      )
mailles     = ArmorCategory.create( name: "Cottes de mailles",   heavy: true,   code: 'chainmail' )
ecailles    = ArmorCategory.create( name: "Armures d'écailles",  heavy: true,   code: 'scales'    )
harnois     = ArmorCategory.create( name: "Harnois",             heavy: true,   code: 'harnois'   )
lightsh     = ArmorCategory.create( name: "Boucliers légers",    heavy: false,  code: 'lightsh'   )
heavysh     = ArmorCategory.create( name: "Boucliers lourds",    heavy: true,   code: 'heavysh'   )



CommonArmor.create([
  { name: "Vêtements normaux",              armor_bonus: 0,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,  price: "1 PO",    weight: "2 kg" ,    armor_category: etoffe   },
  { name: "Armure d'étoffe féerique",       armor_bonus: 1,   source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "2,5 kg",   armor_category: etoffe   },
  { name: "Armure d'étoffe céleste",        armor_bonus: 2,   source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "1,5 kg",   armor_category: etoffe   },
  { name: "Armure d'étoffe gith",           armor_bonus: 0,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "1 kg",     armor_category: etoffe, special: "+1 en Volonté"   },
  { name: "Armure d'étoffe mentale",        armor_bonus: 0,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "1 kg",     armor_category: etoffe, special: "+2 en Volonté"   },
  { name: "Armure d'étoffe éfrit",          armor_bonus: 1,   source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "1 kg",     armor_category: etoffe, special: "+1 en Volonté"   },
  { name: "Armure d'étoffe mentaux",        armor_bonus: 1,   source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "1 kg",     armor_category: etoffe, special: "+2 en Volonté"   },

  { name: "Armure de cuir",                 armor_bonus: 2,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,  price: "25 PO",   weight: "7,5 kg",   armor_category: cuir  },
  { name: "Armure de cuir féerique",        armor_bonus: 3,   source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "7,5 kg",   armor_category: cuir  },
  { name: "Armure de cuir céleste",         armor_bonus: 4,   source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "7,5 kg",   armor_category: cuir  },
  { name: "Armure de tramée drow",          armor_bonus: 2,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "5 kg",     armor_category: cuir, special: "+1 en Réflexes"  },
  { name: "Armure ophidienne",              armor_bonus: 2,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "5 kg",     armor_category: cuir, special: "+2 en Réflexes"  },
  { name: "Armure anathème",                armor_bonus: 3,   source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "5 kg",     armor_category: cuir, special: "+1 en Réflexes"  },
  { name: "Armure de faucheur ailé",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: 0,  price: "Spécial", weight: "5 kg",     armor_category: cuir, special: "+2 en Réflexes"  },

  { name: "Armure de peau",                 armor_bonus: 3,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -1,  ms_malus: 0,  price: "30 PO",   weight: "12,5 kg",  armor_category: peau     },
  { name: "Armure de sombrepeau",           armor_bonus: 4,   source: mdj1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau     },
  { name: "Armure de peau vénérable",       armor_bonus: 5,   source: mdj1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau     },
  { name: "Armure de peau rocheuse",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 3,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau, special: "+1 en Vigueur"     },
  { name: "Armure de peau féerique",        armor_bonus: 3,   source: cda1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau, special: "+2 en Vigueur"     },
  { name: "Armure de peau de traqueur",     armor_bonus: 4,   source: cda1, min_alteration_bonus: 5,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau, special: "+1 en Vigueur"     },
  { name: "Armure de peau-néant",           armor_bonus: 4,   source: cda1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: 0,  price: "Spécial", weight: "12,5 kg",  armor_category: peau, special: "+2 en Vigueur"     },

  { name: "Cotte de mailles",               armor_bonus: 6,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles},
  { name: "Cotte de forgemailles",          armor_bonus: 9,   source: mdj1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles},
  { name: "Cotte de mailles céleste",       armor_bonus: 12,  source: mdj1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles},
  { name: "Armure de mailles fines",        armor_bonus: 7,   source: cda1, min_alteration_bonus: 2,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles},
  { name: "Armure de mailles tressées",     armor_bonus: 8,   source: cda1, min_alteration_bonus: 3,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles},
  { name: "Armure de cristacier",           armor_bonus: 8,   source: cda1, min_alteration_bonus: 4,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles, special: "+2 en Volonté"},
  { name: "Armure de mailles tissées",      armor_bonus: 10,  source: cda1, min_alteration_bonus: 5,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles, special: "+1 en Volonté"},
  { name: "Armure de diantremailles ",      armor_bonus: 11,  source: cda1, min_alteration_bonus: 6,  skill_malus: -1,  ms_malus: -1, price: "Spécial", weight: "20 kg",    armor_category: mailles, special: "+2 en Volonté"},

  { name: "Armure d'écailles",              armor_bonus: 7,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: -1, price: "45 PO",   weight: "22,5 kg",  armor_category: ecailles   },
  { name: "Armure draconique",              armor_bonus: 10,  source: mdj1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles   },
  { name: "Armure d'écailles vénérables",   armor_bonus: 13,  source: mdj1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles   },
  { name: "Armure d'écailles drakéennes",   armor_bonus: 8,   source: cda1, min_alteration_bonus: 2,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles   },
  { name: "Armure d'écailles guivrées",     armor_bonus: 9,   source: cda1, min_alteration_bonus: 3,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles   },
  { name: "Armure d'écailles tempétueuses", armor_bonus: 9,   source: cda1, min_alteration_bonus: 4,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles, special: "+2 en Vigueur"   },
  { name: "Armure d'écailles nagas",        armor_bonus: 11,  source: cda1, min_alteration_bonus: 5,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles, special: "+1 en Vigueur"   },
  { name: "Armure d'écailles titanesques",  armor_bonus: 12,  source: cda1, min_alteration_bonus: 6,  skill_malus: 0,   ms_malus: -1, price: "Spécial", weight: "22,5 kg",  armor_category: ecailles, special: "+2 en Vigueur"   },

  { name: "Harnois",                        armor_bonus: 8,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -2,  ms_malus: -1, price: "50 PO",   weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de guerre",              armor_bonus: 11,  source: mdj1, min_alteration_bonus: 4,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois divin",                  armor_bonus: 14,  source: mdj1, min_alteration_bonus: 6,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de flammegivre",         armor_bonus: 8,   source: cda1, min_alteration_bonus: 2,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 1 à tout"  },
  { name: "Harnois feuilleté",              armor_bonus: 9,   source: cda1, min_alteration_bonus: 2,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois gith",                   armor_bonus: 10,  source: cda1, min_alteration_bonus: 3,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois spectral",               armor_bonus: 10,  source: cda1, min_alteration_bonus: 4,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 2 à tout"  },
  { name: "Harnois de légionnaire",         armor_bonus: 12,  source: cda1, min_alteration_bonus: 5,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois  },
  { name: "Harnois de tarasque",            armor_bonus: 12,  source: cda1, min_alteration_bonus: 6,  skill_malus: -2,  ms_malus: -1, price: "Spécial", weight: "25 kg",    armor_category: harnois, special: "Résistance 5 à tout"  },

  { name: "Bouclier léger",                 armor_bonus: 1,   source: mdj1, min_alteration_bonus: 0,  skill_malus: 0,   ms_malus: 0,  price: "5 PO",    weight: "3 kg",     armor_category: lightsh  },
  { name: "Bouclier lourd",                 armor_bonus: 2,   source: mdj1, min_alteration_bonus: 0,  skill_malus: -2,  ms_malus: 0,  price: "10 PO",   weight: "7,5 kg",   armor_category: heavysh  }
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
  { name: "Consommables"        , code: "expendable"},
  { name: "Munition"            , code: "ammo"},
])

r = "race"
kalashtar_language = 'commun, télépathie 5 (vous êtes capable de communiquer mentalement avec toute créature douée de langage située dans votre ligne de mire et dans un rayon de 5 cases, sachant que la communication se fait dans les deux sens)'

changelin            = Race.create(name: "Changelin",            skill_bonuses: "bluff, insight",         average_height: '1,65 m à 1,80 m',  average_weight: '60 à 80 kg',   vision: 'normale',  language: 'commun',                                       nb_language_sup: 0, ability_bonuses: "Int 2, Cha 2 ou Dex 2, Int 2", source_id: eber.id, cat_size: "M", speed: 6)
cristallien          = Race.create(name: "Cristallien",          skill_bonuses: "arcana, endurance, bonus", average_height: '1,70 m à 1,85 m',  average_weight: '90 à 115 kg',  vision: 'normale',  language: 'commun, profond, une supplémentaire au choix', nb_language_sup: 1, ability_bonuses: "Int 2, Sag 2 ou Int 2, Cha 2", source_id: mdj3.id, cat_size: "M", speed: 6)
demi_elfe            = Race.create(name: "Demi-elfe",            skill_bonuses: "diplomacy, insight",    average_height: '1,65 m à 1,85 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique, une supplémentaire au choix', nb_language_sup: 1, ability_bonuses: "Con 2, Sag 2 ou Con 2, Cha 2", source_id: mdj1.id, cat_size: "M", speed: 6)
demi_orque           = Race.create(name: "Demi-orque",           skill_bonuses: "endurance, intimidate",  average_height: '1,90 m à 2,10 m',  average_weight: '77 à 112 kg',  vision: 'nocturne', language: 'commun, géant',                                nb_language_sup: 0, ability_bonuses: "For 2, Dex 2 ou Con 2, Dex 2", source_id: mdj2.id, cat_size: "M", speed: 6)
deva                 = Race.create(name: "Déva",                 skill_bonuses: "history, religion",       average_height: '2 m à 2,15 m',     average_weight: '87 à 140 kg',  vision: 'normale',  language: 'commun, deux supplémentaires au choix',        nb_language_sup: 2, ability_bonuses: "Int 2, Sag 2 ou Int 2, Cha 2", source_id: mdj2.id, cat_size: "M", speed: 6)
drakeide             = Race.create(name: "Drakéide",             skill_bonuses: "history, intimidate",   average_height: '1,85 m à 2 m',     average_weight: '110 à 160 kg', vision: 'normale',  language: 'commun, draconique',                           nb_language_sup: 0, ability_bonuses: "For 2, Cha 2 ou Con 2, Cha 2", source_id: mdj1.id, cat_size: "M", speed: 6)
drow                 = Race.create(name: "Drow",                 skill_bonuses: "stealth, intimidate", average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              nb_language_sup: 0, ability_bonuses: "Dex 2, Cha 2 ou Dex 2, Sag 2", source_id: roou.id, cat_size: "M", speed: 6)
eladrin              = Race.create(name: "Éladrin",              skill_bonuses: "arcana, history",         average_height: '1,65 m à 1,85 m',  average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, elfique',                              nb_language_sup: 0, ability_bonuses: "Dex 2, Int 2 ou Int 2, Cha 2", source_id: mdj1.id, cat_size: "M", speed: 6)
elfe                 = Race.create(name: "Elfe",                 skill_bonuses: "nature, perception",       average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              nb_language_sup: 0, ability_bonuses: "Dex 2, Sag 2 ou Dex 2, Int 2", source_id: mdj1.id, cat_size: "M", speed: 6)
feral_griffe_effilee = Race.create(name: "Féral griffe-effilée", skill_bonuses: "acrobatics, stealth",   average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "Dex 2, Sag 2" ,                source_id: mdj2.id, cat_size: "M", speed: 6)
feral_longue_dent    = Race.create(name: "Féral longue-dent",    skill_bonuses: "athletics, endurance",    average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "For 2, Sag 2" ,                source_id: mdj2.id, cat_size: "M", speed: 6)
forgelier            = Race.create(name: "Forgelier",            skill_bonuses: "endurance, intimidate",  average_height: '1,80 m à 1,95 m',  average_weight: '135 à 150 kg', vision: 'normale',  language: 'commun',                                       nb_language_sup: 0, ability_bonuses: "For 2, Con 2 ou Con 2, Int 2", source_id: eber.id, cat_size: "M", speed: 6)
genasi               = Race.create(name: "Genasi",               skill_bonuses: "endurance, nature",        average_height: '1,70 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, originel',                             nb_language_sup: 0, ability_bonuses: "For 2, Int 2 ou For 2, Con 2", source_id: roou.id, cat_size: "M", speed: 6)
githzerai            = Race.create(name: "Githzerai",            skill_bonuses: "acrobatics, athletics",   average_height: '1,80 m à 1,95 m',  average_weight: '80 à 95 kg',   vision: 'normale',  language: 'commun, profond',                              nb_language_sup: 0, ability_bonuses: "Dex 2, Sag 2 ou Dex 2, Int 2", source_id: mdj3.id, cat_size: "M", speed: 6)
gnome                = Race.create(name: "Gnome",                skill_bonuses: "arcana, stealth",       average_height: '1,10 m à 1,20 m',  average_weight: '25 à 37 kg',   vision: 'nocturne', language: 'commun, elfique',                              nb_language_sup: 0, ability_bonuses: "Int 2, Cha 2 ou Dex 2, Int 2", source_id: mdj2.id, cat_size: "P", speed: 5)
goliath              = Race.create(name: "Goliath",              skill_bonuses: "athletics, nature",       average_height: '2,40 m à 2,50 m',  average_weight: '140 à 170 kg', vision: 'normale',  language: 'commun, et nain ou géant',                     nb_language_sup: 1, ability_bonuses: "For 2, Con 2 ou For 2, Sag 2", source_id: mdj2.id, cat_size: "M", speed: 6)
halfelin             = Race.create(name: "Halfelin",             skill_bonuses: "acrobatics, thievery",       average_height: '1,15 m à 1,25 m',  average_weight: '37 à 42 kg',   vision: 'normale',  language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "Con 2, Dex 2 ou Dex 2, Cha 2", source_id: mdj1.id, cat_size: "P", speed: 6)
humain               = Race.create(name: "Humain",               skill_bonuses: "",                               average_height: '1,65 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "For 2 ou Con 2 ou Dex 2 ou Int 2 ou Sag 2 ou Cha 2", source_id: mdj1.id, cat_size: "M", speed: 6)
kalashtar            = Race.create(name: "Kalashtar",            skill_bonuses: "insight, bonus", average_height: '1,70 m à 1,90 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: kalashtar_language,           nb_language_sup: 0, ability_bonuses: "Sag 2, Cha 2 ou Int 2, Sag 2", source_id: eber.id, cat_size: "M", speed: 6)
minotaure            = Race.create(name: "Minotaure",            skill_bonuses: "nature, perception",       average_height: '2,15 m à 2,30 m',  average_weight: '160 à 175 kg', vision: 'normale',  language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "For 2, Con 2 ou For 2, Sag 2", source_id: mdj3.id, cat_size: "M", speed: 6)
nain                 = Race.create(name: "Nain",                 skill_bonuses: "endurance, dungeoneering",   average_height: '1,25 m à 1,45 m',  average_weight: '80 à 110 kg',  vision: 'nocturne', language: 'commun, nain',                                 nb_language_sup: 0, ability_bonuses: "For 2, Con 2 ou Con 2, Sag 2", source_id: mdj1.id, cat_size: "M", speed: 5)
silvyen              = Race.create(name: "Silvyen",              skill_bonuses: "stealth, nature",       average_height: '1,80 m à 1,95 m',  average_weight: '70 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              nb_language_sup: 0, ability_bonuses: "Con 2, Sag 2 ou Con 2, Dex 2", source_id: mdj3.id, cat_size: "M", speed: 6)
tieffelin            = Race.create(name: "Tieffelin",            skill_bonuses: "bluff, stealth",        average_height: '1,65 m à 1,85 m',  average_weight: '70 à 115 kg',  vision: 'nocturne', language: 'commun, une supplémentaire au choix',          nb_language_sup: 1, ability_bonuses: "Con 2, Cha 2 ou Int 2, Cha 2", source_id: mdj1.id, cat_size: "M", speed: 6)

forme_endurcie  = Feature.create(races: [silvyen],  kind: "race", name: "Forme endurcie",             description: "choisissez les Réflexes, la Vigueur ou la Volonté. Vous bénéficiez d'un bonus racial de +1 dans cette défense.")
manif_elem      = Feature.create(races: [genasi],   kind: "race", name: "Manifestation élémentaire",  description: "choisissez une manifestation élémentaire: âme d'eau, âme de feu, âme d'orage, âme de terre ou âme de vent. Cette manifestation fait partie intégrante de votre nature(le talent <em>Manifestation élémentaire</em>, p.136, vous permet cependant de prendre des manifestations en plus et d'en changer). Chaque manifestation élémentaire propose des avantages particuliers et un pouvoir de rencontre. Enfin votre apparence change selon l’élément que vous manifestez.<br>
<em>Âme d'eau</em> : vous pouvez respirer sous l'eau. Vous bénéficiez également d'un bonus racial de +2 aux jets de sauvegarde contre les dégâts continus et du pouvoir <em>Cours rapide</em>.<br>
<em>Âme de feu</em> : vous bénéficiez d'un bonus racial de +1 en Réflexes, d'une résistance au feu 5 et du pouvoir <em>Retour de flammes</em>.<br>
Au niveau 11, la résistance augmente à feu 10.<br>
Au niveau 21, la résistance augmente à feu 15.<br>
<em>Âme d'orage</em> : vous bénéficiez d'un bonus racial de +1 en Vigueur, d'une résistance à l'électricité 5 et du pouvoir <em>Promesse d'orage</em>.<br>
Au niveau 11, la résistance augmente à électricité 10.<br>
Au niveau 21, la résistance augmente à électricité 15.<br>
<em>Âme de terre</em> : vous bénéficiez d'un bonus racial de +1 en Vigueur, d'un bonus racial de +1 aux jets de sauvegarde et du pouvoir <em>Secousse sismique</em>.<br>
<em>Âme de vent</em> : vous bénéficiez d'une résistance au froid 5 du pouvoir <em>Arpenteur des vents</em>.<br>
Au niveau 11, la résistance augmente à froid 10.<br>
Au niveau 21, la résistance augmente à froid 15.")
origin_feerique = [eladrin, elfe, gnome, silvyen, drow]
Feature.create([
  {races: origin_feerique,            kind: "race", name: "Origine féerique",                 description: "vos ancêtres étaient natifs de Féerie, vous êtes donc considéré comme une créature féerique au regard des effets liés à cette origine."},
  {races: [cristallien, forgelier],   kind: "race", name: "Créature artificielle vivante",    description: "vous êtes une créature artificielle vivante. Vous n'avez pas besoin de manger, de boire, de respirer et de dormir. Vous n'effectuez jamais de tests d'Endurance pour résister aux effets de la faim, de la soif ou de l'asphyxie."},
  {races: [demi_elfe],                kind: "race", name: "Dilettante",                       description: "au niveau 1, vous choisissez un pouvoir à volonté d'une classe différente de la vôtre, que vous pouvez utiliser en tant que pouvoir de rencontre.", required: "choice_1"},
  {races: [demi_elfe],                kind: "race", name: "La clé du succès",                 description: "vous pouvez utiliser <em>La clé du succès</em> en tant que pouvoir de rencontre.", required: "choice_1"},
  {races: [demi_elfe],                kind: "race", name: "Diplomatie de groupe",             description: "vous conférez un bonus racial de +1 aux tests de Diplomatie de tous vos alliés situés dans un rayon de 10 cases."},
  {races: [demi_elfe],                kind: "race", name: "Double héritage",                  description: "vous avez accès aux talents ayant elfe ou humain comme prérequis (ainsi que ceux qui s'adressent spécifiquement aux demi-elfes), du moment que vous remplissez les autres conditions."},
  {races: [drakeide],                 kind: "race", name: "Fureur drakéide",                  description: "lorsque vous êtes en péril, vous bénéficiez d'un bonus racial de +1 aux jets d'attaque."},
  {races: [drakeide],                 kind: "race", name: "Héritage draconique",              description: "votre valeur de récupération est égale au quart de vos points de vie maximums + votre modificateur de Constitution."},
  {races: [drakeide],                 kind: "race", name: "Souffle de dragon",                description: "vous pouvez utilisez <em>Souffle de dragon</em> en tant que pouvoir de rencontre."},
  {races: [eladrin],                  kind: "race", name: "Éclipse féerique",                 description: "vous pouvez utilisez <em>Éclipse féerique</em> en tant que pouvoir de rencontre."},
  {races: [eladrin],                  kind: "race", name: "Éducation éladrine",               description: "vous bénéficiez d'une formation supplémentaire dans une compétence choisie dans la liste du Chapitre 5."},
  {races: [eladrin],                  kind: "race", name: "Maniement des armes éladrines",    description: "vous êtes formé au maniement de l'épée longue."},
  {races: [eladrin, drow],            kind: "race", name: "Transe",                           description: "plutôt que de dormir, vous entrez dans un état méditatif connu sous le nom de transe. Quatre heures de transe vous procurent les mêmes effets que six heures de repos prolongé pour toute autre race. Lorsque vous êtes en transe, vous êtes parfaitement conscient de ce qui vous entoure. Vous pouvez ainsi détecter les ennemis en approche et tout autre événement."},
  {races: [eladrin],                  kind: "race", name: "Volonté éladrine",                 description: "vous bénéficiez d'un bonus racial de +1 en Volonté, et d'un bonus racial de +5 aux jets de sauvegarde contre les effets de charme."},
  {races: [elfe],                     kind: "race", name: "Maniement des armes elfiques",     description: "vous êtes formé au maniement de l'arc court et de l'arc long."},
  {races: [elfe],                     kind: "race", name: "Pas assuré",                       description: "vous ignorez un terrain difficile lorsque vous vous décalez (même si vous possédez un pouvoir vous permettant de vous décalez sur plusieurs cases)."},
  {races: [elfe],                     kind: "race", name: "Précision elfique",                description: "vous pouvez utilisez <em>Précision elfique</em> en tant que pouvoir de rencontre."},
  {races: [elfe],                     kind: "race", name: "Vigilance de groupe",              description: "vous conférez un bonus racial de +1 aux tests de Perception de tous vos alliés non elfes situés dans un rayon de 5 cases."},
  {races: [halfelin],                 kind: "race", name: "Audacieux",                        description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre la terreur."},
  {races: [halfelin],                 kind: "race", name: "Deuxième chance",                  description: "vous pouvez utilisez <em>Deuxième chance</em> en tant que pouvoir de rencontre."},
  {races: [halfelin],                 kind: "race", name: "Réflexes éclair",                  description: "vous bénéficiez d'un bonus racial de +2 à la CA contre les attaques d'opportunité."},
  {races: [humain],                   kind: "race", name: "Bonus de défense humain",          description: "vous bénéficiez d'un bonus de +1 en Vigueur, Réflexes et Volonté."},
  {races: [humain],                   kind: "race", name: "Compétence supplémentaire",        description: "vous gagnez une formation supplémentaire dans une de vos compétences de classe."},
  {races: [humain],                   kind: "race", name: "Pouvoir à volonté supplémentaire", description: "vous connaissez un pouvoir à volonté supplémentaire de votre classe.",             required: "choice_1"},
  {races: [humain],                   kind: "race", name: "Effort héroïque",                  description: "vous pouvez utiliser <em>Effort héroïque</em> en tant que pouvoir de rencontre.",  required: "choice_1"},
  {races: [humain],                   kind: "race", name: "Talent supplémentaire",            description: "vous gagnez un talent supplémentaire au niveau 1. Vous devez cependant en remplir les prérequis."},
  {races: [nain],                     kind: "race", name: "Ancré dans le sol",                description: "lorsque vous êtes la cible d'une poussée, d'un tirage ou d'une glissade, vous pouvez réduire de 1 le nombre de case de déplacement qui vous est imposé. Cela signifie qu'un effet qui pousse, tire ou fait glisser de 1 case ne vous affecte que si vous le désirez.<br>De plus, lorsqu'une attaque vous fait tomber à terre, vous pouvez immédiatement effectuer un jet de sauvegarde pour éviter cette chute."},
  {races: [nain],                     kind: "race", name: "Boyaux d'acier",                   description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre le poison."},
  {races: [nain],                     kind: "race", name: "Déplacement avec charge",          description: "vous avancez à la hauteur de votre VD, même lorsque celle-ci doit être réduite du fait de votre armure ou d'une charge lourde. Les autres effets qui diminuent votre VD vous affecte normalement (comme un terrain difficile ou un effet magique)."},
  {races: [nain],                     kind: "race", name: "Maniement des armes naines",       description: "vous êtes formé au maniement du marteau de lancer et du marteau de guerre."},
  {races: [nain],                     kind: "race", name: "Résistance naine",                 description: "vous pouvez recourir à votre second souffle au prix d'une action mineure au lieu d'une action simple."},
  {races: [tieffelin],                kind: "race", name: "Appel du sang",                    description: "vous bénéficiez d'un bonus racial de +1 aux jets d'attaque contre les adversaires en péril."},
  {races: [tieffelin],                kind: "race", name: "Courroux infernal",                description: "vous pouvez utilisez <em>Courroux infernal</em> en tant que pouvoir de rencontre."},
  {races: [tieffelin],                kind: "race", name: "Résistance au feu",                description: "vous bénéficiez d'une résistance au feu 5 + la moitié de votre niveau."},
  {races: [demi_orque],               kind: "race", name: "Assaut enragé",                    description: "vous avez le pouvoir <em>Assaut enragé</em>."},
  {races: [demi_orque],               kind: "race", name: "Charge véloce",                    description: "vous gagnez un bonus de +2 à la vitesse de déplacement lorsque vous chargez."},
  {races: [demi_orque],               kind: "race", name: "Vitalité demi-orque",              description: "la première fois que vous êtes en péril au cours d'une rencontre, vous gagnez 5 points de vie temporaires. Ce nombre augment à 10 au niveau 11 et 15 au niveau 21."},
  {races: [deva],                     kind: "race", name: "Majesté astrale",                  description: "vous bénéficiez d'un bonus de +1 à toutes vos défenses contre les attaques effectuées par une créature en péril."},
  {races: [deva],                     kind: "race", name: "Mémoire d'un millier de vies",     description: "vous avez le pouvoir <em>Mémoire d'un millier de vies</em>."},
  {races: [deva, cristallien],        kind: "race", name: "Origine immortelle",               description: "votre âme est native de la Mer Astrale et vous êtes considéré comme une créature immortelle pour déterminer les effets relatifs à l'origine d'une créature."},
  {races: [deva],                     kind: "race", name: "Résistance astrale",               description: "vous bénéficiez d'une résistance aux dégâts nécrotiques et radiants égale à 5 + la moitié de votre niveau."},
  {races: [feral_griffe_effilee],     kind: "race", name: "Sauvagerie griffe-effilée",        description: "Vous avez le pouvoir <em>Sauvagerie griffe-effilée</em>."},
  {races: [feral_longue_dent],        kind: "race", name: "Sauvagerie longue-dent",           description: "Vous avez le pouvoir <em>Sauvagerie longue-dent</em>."},
  {races: [gnome],                    kind: "race", name: "Discrétion réactive",              description: "Vous avez le pouvoir <em>Effacement</em>."},
  {races: [gnome],                    kind: "race", name: "Maître menteur",                   description: "une fois par rencontre, vous pouvez utilisez le tour de prestidigitation de magicien <em>Son imaginaire</em> (cf. p.76 du <em>Manuel des Joueurs</em>) au prix d'une action mineure."},
  {races: [gnome],                    kind: "race", name: "Perspicacité du menteur",          description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre les illusions."},
  {races: [goliath],                  kind: "race", name: "Athlète puissant",                 description: "lorsque vous effectuez un test d'Athlétisme pour sauter ou grimper, jetez deux dés et conservez l'un des résultats."},
  {races: [goliath],                  kind: "race", name: "Endurance de la pierre",           description: "Vous avez le pouvoir <em>Endurance de la pierre</em>."},
  {races: [goliath],                  kind: "race", name: "Ténacité de la montagne",          description: "vous bénéficiez d'un bonus racial de +1 à la Volonté."},
  {races: [cristallien],              kind: "race", name: "Esprit cristallin",                description: "vous bénéficiez d'une résistance psychique 5. Cette résistance augment à 10 au niveau 11 et 15 au niveau 21."},
  {races: [cristallien],              kind: "race", name: "Nuée de cristaux",                 description: "Vous avez le pouvoir <em>Nué de cristaux</em>."},
  {races: [cristallien],              kind: "race", name: "Télépathie",                       description: "vous pouvez communiquer par télépathie avec toute créature douée de langage située dans un rayon de 5 cases."},
  {races: [githzerai],                kind: "race", name: "Esprit défendu",                   description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegarde contre les effets qui hébètent, dominent ou étourdissent."},
  {races: [githzerai],                kind: "race", name: "Heureuse fortune",                 description: "quand vous utilisez votre second souffle, vous pouvez vous décalez de 3 cases au prix d'une action libre."},
  {races: [githzerai],                kind: "race", name: "Mental d'acier",                   description: "Vous avez le pouvoir <em>Mental d'acier</em>."},
  {races: [githzerai],                kind: "race", name: "Sens du danger",                   description: "vous bénéficiez d'un bonus racial de +2 aux tests d'initiative."},
  {races: [minotaure],                kind: "race", name: "Charge encornée",                  description: "Vous avez le pouvoir <em>Charge encornée</em>."},
  {races: [minotaure],                kind: "race", name: "Charge intrépide",                 description: "vous bénéficiez d'un bonus racial de +2 à la CA contre les attaques d'opportunités que vous provoquez lors d'une charge."},
  {races: [minotaure],                kind: "race", name: "Férocité",                         description: "lorsque vous êtes réduit à 0 point de vie ou moins, vous pouvez effectuer une attaque de base de corps à corps au prix d'une interruption immédiate."},
  {races: [minotaure],                kind: "race", name: "Vitalité",                         description: "vous avez une récupération supplémentaire"},
  {races: [silvyen],                  kind: "race", name: "Aspect de la nature",              description: "quand vous arrivez au bout d'un repos prolongé, choisissez lequel des aspects de la nature suivant vous manifestez.<br><em>Aspect des anciens</em> : vous pouvez utilisez le pouvoir <em>Voyage des anciens</em> quand vous manifestez cet aspect.<br><em>Aspect du chasseur</em> : vous pouvez utilisez le pouvoir <em>Poursuite du chasseur</em> quand vous manifestez cet aspect.<br><em>Aspect du destructeur</em> : vous pouvez utilisez le pouvoir <em>Courroux du destructeur</em> quand vous manifestez cet aspect."},
  {races: [silvyen],                  kind: "race", name: "Réflexes endurcie",                description: "vous choisissez les Réflexes.",  required:"choice_1", parent_feature: forme_endurcie},
  {races: [silvyen],                  kind: "race", name: "Vigueur endurcie",                 description: "vous choisissez la Vigueur.",    required:"choice_1", parent_feature: forme_endurcie},
  {races: [silvyen],                  kind: "race", name: "Volonté endurcie",                 description: "vous choisissez la Volonté.",    required:"choice_1", parent_feature: forme_endurcie},
  {races: [changelin],                kind: "race", name: "Change-forme",                     description: "vous avez le pouvoir <em>Déguisement du changelin</em>."},
  {races: [changelin],                kind: "race", name: "Défense mentale",                  description: "vous bénéficiez d'un bonus racial de +1 en Volonté."},
  {races: [changelin],                kind: "race", name: "Métamorphe",                       description: "vous êtes un métamorphe et pouvez modifier votre apparence. Vous êtes donc sujet aux effets et états préjudiciables qui affectent les métamorphes."},
  {races: [changelin],                kind: "race", name: "Ruse du changelin",                description: "vous avez le pouvoir <em>Ruse du changelin</em>."},
  {races: [forgelier],                kind: "race", name: "Esprit du forgelier",              description: "vous bénéficiez d'un bonus racial de +1 en Volonté."},
  {races: [forgelier],                kind: "race", name: "Opiniâtreté forgelière",           description: "vous avez le pouvoir <em>Opiniâtreté forgelière</em>."},
  {races: [forgelier],                kind: "race", name: "Résistance forgelière",            description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegarde contre les dégâts continus. De plus, lorsque vous effectuez un jet de sauvegarde contre la mort, vous pouvez choisir de faire 10 pour remplacer le résultat de votre jet."},
  {races: [forgelier],                kind: "race", name: "Veilleur infatigable",             description: "vous n'avez pas besoin de dormir, mais vous devez rester inactif pendant 4 heures pour prendre un repos prolongé. Dans cet état de passivité, vous êtes pleinement conscient de ce qui vous entoure. Vous pouvez ainsi remarquez les ennemis en approche et tout autre événement."},
  {races: [kalashtar],                kind: "race", name: "Âme double",                       description: "au début de votre tour de jeu, vous pouvez effectuer un jet de sauvegarde contre chaque effet qui vous hébète ou vous domine. Si vous ratez ce jet de sauvegarde, vous n'en effectuez pas un autre contre l'effet en question à la fin de votre tour de jeu."},
  {races: [kalashtar],                kind: "race", name: "Bastion de clarté mentale",        description: "vous avez le pouvoir <em>Bastion de clarté mentale</em>."},
  {races: [drow],                     kind: "race", name: "Lolthaïque",                       description: "une fois par rencontre, vous pouvez utilisez <em>Chape d'obscurité</em> ou <em>Noirfeu</em>."},
  {races: [genasi],                   kind: "race", name: "Origine élémentaire",              description: "vos ancêtres étaient natifs du Chaos Élémentaire, vous êtes donc considéré comme une créature élémentaire au regard des effets liés à cette origine."},
  {races: [genasi],                   kind: "race", name: "Âme d'eau",                        description: "vos choisissez la manifestation élémentaire de l'âme d'eau",    required: "choice_1", parent_feature: manif_elem},
  {races: [genasi],                   kind: "race", name: "Âme de feu",                       description: "vos choisissez la manifestation élémentaire de l'âme de feu",   required: "choice_1", parent_feature: manif_elem},
  {races: [genasi],                   kind: "race", name: "Âme d'orage",                      description: "vos choisissez la manifestation élémentaire de l'âme d'orage",  required: "choice_1", parent_feature: manif_elem},
  {races: [genasi],                   kind: "race", name: "Âme de terre",                     description: "vos choisissez la manifestation élémentaire de l'âme de terre", required: "choice_1", parent_feature: manif_elem},
  {races: [genasi],                   kind: "race", name: "Âme de vent",                      description: "vos choisissez la manifestation élémentaire de l'âme de vent",  required: "choice_1", parent_feature: manif_elem},
])

barbare       = Klass.create(
  name:               "Barbare",
  role:               "cogneur",
  source:             mdj2,
  power_source:       "primale",
  main_stats:         "Force, Constitution, Charisme",
  armor_categories:   [etoffe, cuir, peau],
  weapon_categories:  [simple_cac, guerre_cac],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Vigueur +2",
  base_hp:            15,
  hp_per_level:       6,
  healing_surge:      8,
  required_skills:    "",
  trained_skills:     "acrobatics, athletics, endurance, intimidate, nature, perception, heal",
  options_creation:   "barbare sanguinaire, barbare champion tribal, barbare fils du tonnerre, barbare tournoyant",
  skills_number:      3)
barde         = Klass.create(
  name:               "Barde",
  role:               "meneur",
  source:             mdj2,
  power_source:       "arcanique",
  main_stats:         "Charisme, Intelligence, Constitution",
  armor_categories:   [etoffe, cuir, peau, mailles, lightsh],
  weapon_categories:  [simple_cac, simple_dist,guerre_dist],
  common_weapons:     [cimeterre, epee_courte, epee_longue],
  implement_groups:   [baguettes],
  defense_bonus:      "Réflexes +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "arcana",
  trained_skills:     "acrobatics, arcana, athletics, bluff, streetwise, diplomacy, dungeoneering, history, intimidate, insight, nature, perception, religion, heal",
  options_creation:   "barde rusé, barde valeureux, barde prescient",
  skills_number:      4)
batailleur    = Klass.create(
  name:               "Batailleur",
  role:               "protecteur",
  source:             mdj3,
  power_source:       "psionique",
  main_stats:         "Constitution, Sagesse, Charisme",
  armor_categories:   [etoffe, cuir, peau, mailles, ecailles, lightsh, heavysh],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Volonté +2",
  base_hp:            15,
  hp_per_level:       6,
  healing_surge:      9,
  required_skills:    "",
  trained_skills:     "arcana, athletics, bluff, diplomacy, endurance, intimidate, insight, heal",
  options_creation:   "batailleur rapide, batailleur robuste",
  skills_number:      3)
druide        = Klass.create(
  name:               "Druide",
  role:               "contrôleur",
  source:             mdj2,
  power_source:       "primale",
  main_stats:         "Sagesse, Dextérité, Constitution",
  armor_categories:   [etoffe, cuir, peau],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [batons_i, totems],
  defense_bonus:      "Réflexes +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "nature",
  trained_skills:     "arcana, athletics, diplomacy, endurance, history, insight, nature, perception, heal",
  options_creation:   "druide gardien, druide prédateur, druide des nuées, druide convocateur",
  skills_number:      3)
ensorceleur   = Klass.create(
  name:               "Ensorceleur",
  role:               "cogneur",
  source:             mdj2,
  power_source:       "arcanique",
  main_stats:         "Charisme, Dextérité, Force",
  armor_categories:   [etoffe],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [batons_i],
  defense_bonus:      "Volonté +2",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      6,
  required_skills:    "arcana",
  trained_skills:     "arcana, athletics, bluff, diplomacy, endurance, dungeoneering, history, intimidate, insight, nature",
  options_creation:   "ensorceleur du chaos, ensorceleur dragon, ensorceleur des tempêtes, ensorceleur cosmique",
  skills_number:      3)
faconneur     = Klass.create(
  name:               "Façonneur",
  role:               "meneur",
  source:             eber,
  power_source:       "arcanique",
  main_stats:         "Intelligence, Constitution, Sagesse",
  armor_categories:   [etoffe, cuir],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [baguettes, batons_i, sceptres],
  defense_bonus:      "Vigueur +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      6,
  required_skills:    "arcana",
  trained_skills:     "arcana, diplomacy, dungeoneering, history, thievery, perception, heal",
  options_creation:   "façonneur bricoleur, façonneur forgeron de guerre",
  skills_number:      3)
flamboyant    = Klass.create(
  name:               "Flamboyant",
  role:               "meneur",
  source:             mdj3,
  power_source:       "psionique",
  main_stats:         "Charisme, Constitution,Sagesse",
  armor_categories:   [etoffe, cuir, peau, mailles],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Vigueur +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "",
  trained_skills:     "arcana, athletics, bluff, streetwise, diplomacy, endurance, intimidate, insight, heal",
  options_creation:   "flamboyant euphorique, flamboyant illuminé",
  skills_number:      4)
gardien       = Klass.create(
  name:               "Gardien",
  role:               "protecteur",
  source:             mdj2,
  power_source:       "primale"  ,
  main_stats:         "Force, Constitution, Sagesse",
  armor_categories:   [etoffe, cuir, peau, lightsh, heavysh],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Vigueur +2",
  base_hp:            17,
  hp_per_level:       7,
  healing_surge:      9,
  required_skills:    "nature",
  trained_skills:     "athletics, endurance, dungeoneering, intimidate, nature, perception, heal",
  options_creation:   "gardien de la terre, gardien indompté, gardien de la tempête, gardien de la vie",
  skills_number:      3)
guerrier      = Klass.create(
  name:               "Guerrier",
  role:               "protecteur",
  source:             mdj1,
  power_source:       "martiale" ,
  main_stats:         "Force, Dextérité, Sagesse, Constitution",
  armor_categories:   [etoffe, cuir, peau, mailles, ecailles, lightsh, heavysh],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac, guerre_dist],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Vigueur +2",
  base_hp:            15,
  hp_per_level:       6,
  healing_surge:      9,
  required_skills:    "",
  trained_skills:     "athletics, streetwise, endurance, intimidate, heal",
  options_creation:   "guerrier offensif, guerrier défensif",
  skills_number:      3)
invocateur    = Klass.create(
  name:               "Invocateur",
  role:               "contrôleur",
  source:             mdj2,
  power_source:       "divine",
  main_stats:         "Sagesse, Constitution, Intelligence",
  armor_categories:   [etoffe, cuir, peau, mailles],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [batons_i, sceptres],
  defense_bonus:      "Réflexes +1, Vigueur +1, Volonté +1",
  base_hp:            10,
  hp_per_level:       4,
  healing_surge:      6,
  required_skills:    "religion",
  trained_skills:     "arcana, diplomacy, endurance, history, intimidate, insight, religion",
  options_creation:   "invocateur protecteur, invocateur courroucé, invocateur des malédictions",
  skills_number:      3)
limier        = Klass.create(
  name:               "Limier",
  role:               "contrôleur",
  source:             mdj3,
  power_source:       "primale",
  main_stats:         "Sagesse, Force, Dextérité",
  armor_categories:   [etoffe, cuir],
  weapon_categories:  [simple_cac, simple_dist, guerre_dist],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Réflexes +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "nature",
  trained_skills:     "acrobatics, athletics, stealth, endurance, intimidate, insight, nature, perception, heal",
  options_creation:   "limier protecteur, limier vengeur",
  skills_number:      3)
mage_lames    = Klass.create(
  name:               "Mage lames",
  role:               "protecteur",
  source:             roou,
  power_source:       "arcanique",
  main_stats:         "intelligence, force, constitution",
  armor_categories:   [etoffe ,cuir],
  weapon_categories:  [simple_cac, simple_dist, ],
  common_weapons:     [cimeterre, epee_courte, epee_longue, cim2mains, coutile, epee2mains, epeelarge, khopesh],
  implement_groups:   [],
  defense_bonus:      "Volonté +2",
  base_hp:            15,
  hp_per_level:       6,
  healing_surge:      8,
  required_skills:    "arcana",
  trained_skills:     "arcana, athletics, diplomacy, endurance, history, intimidate, insight",
  options_creation:   "mage lame défensif, mage lame offensif, mage lame prédateur",
  skills_number:      3)
magicien      = Klass.create(
  name:               "Magicien",
  role:               "contrôleur",
  source:             mdj1,
  power_source:       "arcanique",
  main_stats:         "Intelligence, Sagesse, Dextérité",
  armor_categories:   [etoffe],
  weapon_categories:  [],
  common_weapons:     [dague, baton],
  implement_groups:   [baguettes, batons_i, orbes],
  defense_bonus:      "Volonté +2",
  base_hp:            10,
  hp_per_level:       4,
  healing_surge:      6,
  required_skills:    "arcana",
  trained_skills:     "arcana, diplomacy, dungeoneering, history, insight, nature, religion",
 options_creation:    "magicien de guerre, magicien manipulateur",
 skills_number:       3)
maitre_guerre = Klass.create(
  name:               "Maître de guerre",
  role:               "meneur",
  source:             mdj1,
  power_source:       "martiale",
  main_stats:         "Force, Intelligence, Charisme",
  armor_categories:   [etoffe, cuir, peau, mailles, lightsh],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Vigueur +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "",
  trained_skills:     "athletics, diplomacy, endurance, history, intimidate, heal",
  options_creation:   "maître de guerre charismatique, maître de guerre tacticien, maître de guerre ingénieux, maître de guerre perspicace, maître de guerre intrépide, maître de guerre tirailleur",
  skills_number:      4)
moine         = Klass.create(
  name:               "Moine",
  role:               "cogneur",
  source:             mdj3,
  power_source:       "psionique",
  main_stats:         "Dextérité, Force, Sagesse",
  armor_categories:   [etoffe],
  weapon_categories:  [],
  common_weapons:     [mains_nues, baton, dague, fronde_arme, gourdin, lance_arme, shuriken],
  implement_groups:   [focus_ki],
  defense_bonus:      "Réflexes +1, Vigueur +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "",
  trained_skills:     "acrobatics, athletics, diplomacy, stealth, endurance, insight, thievery, perception, religion, heal",
  options_creation:   "moine du poing de pierre, moine du souffle centré",
  skills_number:      4)
paladin       = Klass.create(
  name:               "Paladin",
  role:               "protecteur",
  source:             mdj1,
  power_source:       "divine",
  main_stats:         "Force, Charisme, Sagesse",
  armor_categories:   [etoffe, cuir, peau, mailles, ecailles, harnois, lightsh, heavysh],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [symboles],
  defense_bonus:      "Vigueur +1, Réflexes +1, Volonté +1",
  base_hp:            15,
  hp_per_level:       6,
  healing_surge:      10,
  required_skills:    "religion",
  trained_skills:     "diplomacy, endurance, history, intimidate, insight, religion, heal",
  options_creation:   "paladin défenseur, paladin vengeur, paladin fougueux, paladin vertueux",
  skills_number:      3)
pretre        = Klass.create(
  name:               "Prêtre",
  role:               "meneur",
  source:             mdj1,
  power_source:       "divine",
  main_stats:         "Sagesse, Force, Charisme",
  armor_categories:   [etoffe, cuir, peau, mailles],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [symboles],
  defense_bonus:      "Volonté +2",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "religion",
  trained_skills:     "arcana, diplomacy, history, insight, religion, heal",
  options_creation:   "prêtre de combat, prêtre dévoué, prêtre protecteur",
  skills_number:      3)
pretre_runes  = Klass.create(
  name:               "Prêtre des runes",
  role:               "meneur",
  source:             mdj3,
  power_source:       "divine",
  main_stats:         "Force, Constitution, Sagesse",
  armor_categories:   [etoffe, cuir, peau, mailles, ecailles, lightsh],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Volonté +2",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "religion",
  trained_skills:     "arcana, athletics, endurance, history, insight, thievery, religion, heal",
  options_creation:   "prêtre des runes de l'ire, prêtre des runes du défi",
  skills_number:      3)
psion         = Klass.create(
  name:               "Psion",
  role:               "contrôleur",
  source:             mdj3,
  power_source:       "psionique",
  main_stats:         "Intelligence, Charisme, Sagesse",
  armor_categories:   [etoffe],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [batons_i, orbes],
  defense_bonus:      "Volonté+2",
  base_hp:            12,
  hp_per_level:       4,
  healing_surge:      6,
  required_skills:    "",
  trained_skills:     "arcana, bluff, diplomacy, dungeoneering, history, intimidate, insight, perception",
  options_creation:   "psion télékinétique, psion télépathe",
  skills_number:      4)
rodeur        = Klass.create(
  name:               "Rôdeur",
  role:               "cogneur",
  source:             mdj1,
  power_source:       "martiale",
  main_stats:         "Force, Dextérité, Sagesse",
  armor_categories:   [etoffe, cuir, peau],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac, guerre_dist],
  common_weapons:     [],
  implement_groups:   [],
  defense_bonus:      "Réflexes +1, Vigueur +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      6,
  required_skills:    "dungeoneering, nature",
  trained_skills:     "acrobatics, athletics, stealth, endurance, dungeoneering, nature, perception, heal",
  options_creation:   "rôdeur archer, rôdeur double-lame, rôdeur maître des bêtes, rôdeur chasseur, rôdeur maraudeur",
  skills_number:      4)
shaman        = Klass.create(
  name:               "Shaman",
  role:               "meneur",
  source:             mdj2,
  power_source:       "primale",
  main_stats:         "Sagesse, Constitution, Intelligence",
  armor_categories:   [etoffe, cuir],
  weapon_categories:  [simple_cac],
  common_weapons:     [pique],
  implement_groups:   [totems],
  defense_bonus:      "Vigueur +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      7,
  required_skills:    "nature",
  trained_skills:     "arcana, athletics, endurance, history, insight, nature, perception, religion, heal",
  options_creation:   "shaman de l'ours, shaman de la panthère, shaman de l'aigle, shaman messager des mondes",
  skills_number:      3)
sorcier       = Klass.create(
  name:               "Sorcier",
  role:               "cogneur",
  source:             mdj1,
  power_source:       "arcanique",
  main_stats:         "Charisme, Constitution, Intelligence",
  armor_categories:   [etoffe, cuir],
  weapon_categories:  [simple_cac, simple_dist],
  common_weapons:     [],
  implement_groups:   [baguettes, sceptres],
  defense_bonus:      "Réflexes +1, Volonté +1",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      6,
  required_skills:    "",
  trained_skills:     "arcana, bluff, streetwise, history, intimidate, insight, thievery, religion",
  options_creation:   "sorcier dévastateur, sorcier perfide",
  skills_number:      4)
vengeur       = Klass.create(
  name:               "Vengeur",
  role:               "cogneur",
  source:             mdj2,
  power_source:       "divine",
  main_stats:         "Sagesse, Dextérité, Intelligence",
  armor_categories:   [etoffe],
  weapon_categories:  [simple_cac, simple_dist, guerre_cac],
  common_weapons:     [],
  implement_groups:   [symboles],
  defense_bonus:      "Vigueur +1, Réflexes +1, Volonté+1",
  base_hp:            14,
  hp_per_level:       6,
  healing_surge:      7,
  required_skills:    "religion",
  trained_skills:     "acrobatics, athletics, streetwise, stealth, endurance, intimidate, perception, religion",
  options_creation:   "vengeur solitaire, vengeur acharné, vengeur commandeur",
  skills_number:      3)
voleur        = Klass.create(
  name:               "Voleur",
  role:               "cogneur",
  source:             mdj1,
  power_source:       "martiale",
  main_stats:         "Dextérité, Force, Charisme",
  armor_categories:   [etoffe, cuir],
  weapon_categories:  [],
  common_weapons:     [arba_poing, dague, epee_courte, fronde_arme, shuriken],
  implement_groups:   [],
  defense_bonus:      "Réflexes +2",
  base_hp:            12,
  hp_per_level:       5,
  healing_surge:      6,
  required_skills:    "stealth, thievery",
  trained_skills:     "acrobatics, athletics, bluff, streetwise, stealth, dungeoneering, intimidate, insight, thievery, perception",
  options_creation:   "voleur brutale, voleur fourbe, voleur coupe-jarret, voleur voltigeur, voleur des ombres",
  skills_number:      4)

force_indomptable       = Feature.create(kind: "klass", name: "Force indomptable",                   klasses: [barbare],       description: "Choisissez une aptitude parmi les options suivantes")
vertu_barde             = Feature.create(kind: "klass", name: "Vertu des bardes",                    klasses: [barde],         description: "Choisissez une aptitude parmi les options suivantes")
etude_psionqiue         = Feature.create(kind: "klass", name: "Étude psionique",                     klasses: [batailleur],    description: "Choisissez une aptitude parmi les options suivantes")
aspect_primal           = Feature.create(kind: "klass", name: "Aspect primal",                       klasses: [druide],        description: "Choisissez une aptitude parmi les options suivantes")
source_sorts            = Feature.create(kind: "klass", name: "Source des sorts",                    klasses: [ensorceleur],   description: "Choisissez une aptitude parmi les options suivantes")
bonification            = Feature.create(kind: "klass", name: "Bonification arcanique",              klasses: [faconneur],     description: "Choisissez une aptitude parmi les options suivantes")
manteau_flamboyant      = Feature.create(kind: "klass", name: "Manteau flamboyant",                  klasses: [flamboyant],    description: "Choisissez une aptitude parmi les options suivantes")
puissance_gardien       = Feature.create(kind: "klass", name: "Puissance du gardien",                klasses: [gardien],       description: "Choisissez une aptitude parmi les options suivantes")
categorie_arme_favorite = Feature.create(kind: "klass", name: "Catégorie d'arme favorite",           klasses: [guerrier],      description: "Choisissez une catégorie d`armes : armes à une main ou armes à deux mains. Lorsque vous utilisez une arme de cette catégorie. vous bénéficiez d'un bonus de +1 aux jets d'attaque.", required: "choice_1")
alliance_divine         = Feature.create(kind: "klass", name: "Alliance divine",                     klasses: [invocateur],    description: "Choisissez une aptitude parmi les options suivantes")
lien_limier             = Feature.create(kind: "klass", name: "Lien du limier",                      klasses: [limier],        description: "Choisissez une aptitude parmi les options suivantes")
ecran_mage_lame         = Feature.create(kind: "klass", name: "Égide du mage d'armes",               klasses: [mage_lames],    description: "Choisissez une aptitude parmi les options suivantes")
maitrise_foca_arca      = Feature.create(kind: "klass", name: "Maîtrise des focaliseurs arcaniques", klasses: [magicien],      description: "Vous vous spécialiser dans un type de Focaliseur pour profiter d'avantages supplémentaires quand vous y recouvrez.")
autorite_naturelle      = Feature.create(kind: "klass", name: "Autorité naturelle",                  klasses: [maitre_guerre], description: "Choisissez une aptitude parmi les options suivantes")
tradition_monastique    = Feature.create(kind: "klass", name: "Tradition monastique",                klasses: [moine],         description: "Choisissez une aptitude parmi les options suivantes")
tradition_runique       = Feature.create(kind: "klass", name: "Tradition runique",                   klasses: [pretre_runes],  description: "Choisissez une aptitude parmi les options suivantes")
discipline_spe          = Feature.create(kind: "klass", name: "Discipline de spécialisation",        klasses: [psion],         description: "Choisissez une aptitude parmi les options suivantes")
style_combat            = Feature.create(kind: "klass", name: "Style de combat",                     klasses: [rodeur],        description: "Choisissez une aptitude parmi les options suivantes", required: "choice_1")
compagnon               = Feature.create(kind: "klass", name: "Compagnon spirituel",                 klasses: [shaman],        description: "Choisissez une aptitude parmi les options suivantes")
pacte_occulte           = Feature.create(kind: "klass", name: "Pacte occulte",                       klasses: [sorcier],       description: "Choisissez une aptitude parmi les options suivantes")
censure_vengeur         = Feature.create(kind: "klass", name: "Censure du vengeur",                  klasses: [vengeur],       description: "Choisissez une aptitude parmi les options suivantes")
tactique_roublard       = Feature.create(kind: "klass", name: "Tactique du roublard",                klasses: [voleur],        description: "Choisissez une aptitude parmi les options suivantes")
Feature.create([
  {kind: "klass", name: "Agilité du barbare",            klasses: [barbare],     description: "Tant que vous ne portez pas d'armure lourde, vous bénéficiez d'un bonus de +1 à votre CA et vos Réflexes. Ce bonus passe à +2 au niveau 11 et +3 au niveau 21."},
  {kind: "klass", name: "Carnage",                       klasses: [barbare],     description: "Sur un coup critique, une fois par round, vous pouvez effectuer une attaque de base de corps à corps en action libre."},
  {kind: "klass", name: "Frappe enragée",                klasses: [barbare],     description: "Les pouvoirs d'attaque quotidiens du barbare s'accompagnent du mot-clé Rage."},
  {kind: "klass", name: "Ardeur sanguinaire",            klasses: [barbare],     description: "Vous gagnez le pouvoir Charge véloce. En outre, lorsque vous amenez un adversaire à 0 point de vie, vous gagnez des points de vie temporaire égaux à votre modificateur de Constitution.", parent_feature: force_indomptable, required: "choice_1"},
  {kind: "klass", name: "Triomphe du champion",          klasses: [barbare],     description: "", parent_feature: force_indomptable, required: "choice_1"},
  {kind: "klass", name: "Colère du fils du tonnerre",    klasses: [barbare],     description: "", parent_feature: force_indomptable, required: "choice_1"},
  {kind: "klass", name: "Faucheur tournoyant",           klasses: [barbare],     description: "", parent_feature: force_indomptable, required: "choice_1"},
  {kind: "klass", name: "Chant apaisant",                klasses: [barde],       description: ""},
  {kind: "klass", name: "Formation de barde",            klasses: [barde],       description: ""},
  {kind: "klass", name: "Multiclassage versatile",       klasses: [barde],       description: ""},
  {kind: "klass", name: "Paroles d'amitié",              klasses: [barde],       description: ""},
  {kind: "klass", name: "Paroles de majesté",            klasses: [barde],       description: ""},
  {kind: "klass", name: "Savoir-faire polyvalent",       klasses: [barde],       description: ""},
  {kind: "klass", name: "Vertu de vaillance",            klasses: [barde],       description: "", parent_feature: vertu_barde, required: "choice_1"},
  {kind: "klass", name: "Vertu de ruse",                 klasses: [barde],       description: "", parent_feature: vertu_barde, required: "choice_1"},
  {kind: "klass", name: "Vertu de prescience",           klasses: [barde],       description: "", parent_feature: vertu_barde, required: "choice_1"},
  {kind: "klass", name: "Accentuation psionique",        klasses: [batailleur, flamboyant, psion], description: ""},
  {kind: "klass", name: "Défense psionique",             klasses: [batailleur],  description: ""},
  {kind: "klass", name: "Résistance de combat",          klasses: [batailleur],  description: "", parent_feature: etude_psionqiue, required: "choice_1"},
  {kind: "klass", name: "Vitesse de la pensée",          klasses: [batailleur],  description: "", parent_feature: etude_psionqiue, required: "choice_1"},
  {kind: "klass", name: "Harmonie de la nature",         klasses: [druide],      description: ""},
  {kind: "klass", name: "Magie rituelle",                klasses: [druide, faconneur, invocateur, magicien, pretre, psion], description: "Vous gagnez le talent Lanceur de rituels (cf. p.199) en tant que talent supplémentaire, ce qui vous permet d’utiliser des rituels magiques (cf. Chapitre 10)."},
  {kind: "klass", name: "Métamorphose animale",          klasses: [druide],      description: ""},
  {kind: "klass", name: "Gardien primal",                klasses: [druide],      description: "", parent_feature: aspect_primal, required: "choice_1"},
  {kind: "klass", name: "Prédateur primal",              klasses: [druide],      description: "", parent_feature: aspect_primal, required: "choice_1"},
  {kind: "klass", name: "Nuée primale",                  klasses: [druide],      description: "", parent_feature: aspect_primal, required: "choice_1"},
  {kind: "klass", name: "Magie draconique",              klasses: [ensorceleur], description: "", parent_feature: source_sorts, required: "choice_1"},
  {kind: "klass", name: "Magie sauvage",                 klasses: [ensorceleur], description: "", parent_feature: source_sorts, required: "choice_1"},
  {kind: "klass", name: "Magie des tempêtes",            klasses: [ensorceleur], description: "", parent_feature: source_sorts, required: "choice_1"},
  {kind: "klass", name: "Magie cosmique",                klasses: [ensorceleur], description: "", parent_feature: source_sorts, required: "choice_1"},
  {kind: "klass", name: "Infusion vulnéraire",           klasses: [faconneur],   description: ""},
  {kind: "klass", name: "Jouvence arcanique",            klasses: [faconneur],   description: ""},
  {kind: "klass", name: "Partage d'énergie",             klasses: [faconneur],   description: "", parent_feature: bonification, required: "choice_1"},
  {kind: "klass", name: "Intensification d'énergie",     klasses: [faconneur],   description: "", parent_feature: bonification, required: "choice_1"},
  {kind: "klass", name: "Regain flamboyant",             klasses: [flamboyant],  description: ""},
  {kind: "klass", name: "Manteau d'allégresse",          klasses: [flamboyant],  description: "", parent_feature: manteau_flamboyant, required: "choice_1"},
  {kind: "klass", name: "Manteau de clarté",             klasses: [flamboyant],  description: "", parent_feature: manteau_flamboyant, required: "choice_1"},
  {kind: "klass", name: "Fontaine de vie",               klasses: [gardien],     description: ""},
  {kind: "klass", name: "Colère de la nature",           klasses: [gardien],     description: ""},
  {kind: "klass", name: "Force de la terre",             klasses: [gardien],     description: "", parent_feature: puissance_gardien, required: "choice_1"},
  {kind: "klass", name: "Sang indompté",                 klasses: [gardien],     description: "", parent_feature: puissance_gardien, required: "choice_1"},
  {kind: "klass", name: "Cœur de tempête",               klasses: [gardien],     description: "", parent_feature: puissance_gardien, required: "choice_1"},
  {kind: "klass", name: "Esprit vital",                  klasses: [gardien],     description: "", parent_feature: puissance_gardien, required: "choice_1"},
  {kind: "klass", name: "Défi en combat",                klasses: [guerrier],    description: "Il est dangereux d'ignorer un guerrier au combat.
  À chaque fois que vous attaquez un ennemi, que votre coup le touche ou pas, vous avez la possibilité de le marquer.
  La marque dure jusqu'à la ﬁn de votre tour de jeu suivant. Tant qu'une cible est marquée. elle subit un malus de -2 aux jets d`attaque qui ne vous prennent pas pour cible. Une créature ne peut être sujette qu'à une marque à la fois, une nouvelle marque remplaçant la précédente.
  De plus, à chaque fois qu'un ennemi marqué qui vous est adjacent se décale ou effectue une attaque dont vous n'êtes pas la cible. vous pouvez lui porter une attaque de base de corps à corps au pris, d'une interruption immédiate."},
  {kind: "klass", name: "Technique de la tempête",       klasses: [guerrier],     description: "", required: "choice_1"},
  {kind: "klass", name: "Vigueur du guerrier téméraire", klasses: [guerrier],     description: "", required: "choice_1"},
  {kind: "klass", name: "Style du bagarreur",            klasses: [guerrier],     description: "", required: "choice_1"},
  {kind: "klass", name: "Supériorité au combat",         klasses: [guerrier],     description: "Vous bénéﬁciez d`un bonus égal à votre modificateur de Sagesse aux attaques d`opportunité. Si le déplacement d'un ennemi provoque une attaque d'opportunité et que vous le touchez. il interrompt immédiatement son déplacement.  S'il lui reste des actions. il peut en entreprendre pour poursuivre son déplacement.", required: "choice_2"},
  {kind: "klass", name: "Agilité au combat",             klasses: [guerrier],     description: "", required: "choice_2"},
  {kind: "klass", name: "Arme à une main",               klasses: [guerrier],     description: "+1 aux jets d'attaque avec les armes à une main.", parent_feature: categorie_arme_favorite, required: "choice_3"},
  {kind: "klass", name: "Arme à deux mains",             klasses: [guerrier],     description: "+1 aux jets d'attaque avec les armes à deux mains.", parent_feature: categorie_arme_favorite, required: "choice_3"},
  {kind: "klass", name: "Conduit divin",                 klasses: [invocateur, paladin, pretre, vengeur], description: ""},
  {kind: "klass", name: "Alliance de colère",            klasses: [invocateur],   description: "", parent_feature: alliance_divine, required: "choice_1"},
  {kind: "klass", name: "Alliance protectrice",          klasses: [invocateur],   description: "", parent_feature: alliance_divine, required: "choice_1"},
  {kind: "klass", name: "Alliance de malédiction",       klasses: [invocateur],   description: "", parent_feature: alliance_divine, required: "choice_1"},
  {kind: "klass", name: "Tir implacable",                klasses: [limier],       description: ""},
  {kind: "klass", name: "Lien désincarné",               klasses: [limier],       description: "", parent_feature: lien_limier, required: "choice_1"},
  {kind: "klass", name: "Lien du sang",                  klasses: [limier],       description: "", parent_feature: lien_limier, required: "choice_1"},
  {kind: "klass", name: "Porte-lame",                    klasses: [mage_lames],   description: ""},
  {kind: "klass", name: "Écran du mage d'armes",         klasses: [mage_lames],   description: "choisissez une aptitude parmi les options suivantes"},
  {kind: "klass", name: "Égide défensive",               klasses: [mage_lames],   description: "", parent_feature: ecran_mage_lame, required: "choice_1"},
  {kind: "klass", name: "Égide offensive",               klasses: [mage_lames],   description: "", parent_feature: ecran_mage_lame, required: "choice_1"},
  {kind: "klass", name: "Égide prédatrice",              klasses: [mage_lames],   description: "", parent_feature: ecran_mage_lame, required: "choice_1"},
  {kind: "klass", name: "Tour de magie",                 klasses: [magicien],     description: "Les tours de magie sont des sorts mineurs que vous acquerrez au niveau 1. Vous pouvez ainsi employer les sorts de <i>lumière</i>, <i>manipulation à distance</i>, <i>prestidigitation</i> et <i>son imaginaire</i> en tant que pouvoir à volonté."},
  {kind: "klass", name: "Grimoire",                      klasses: [magicien],     description: "Vous possédez un grimoire, livre rempli de savoir mystique dans lequel vous gardez une trace écrite de vos rituels et de vos sorts quotidiens et utilitaires. (cf MdJ1 p.74)"},
  {kind: "klass", name: "Baguette de précision",         klasses: [magicien],     description: "Une fois par rencontre. vous pouvez. au prix d'une action libre, bénéficiez d'un bonus égal à votre modificateur de Dextérité à un jet d'attaque unique. Vous ne pouvez profiter de cet avantage que si vous vous servez de la baguette. Cette forme de maîtrise est idéale pour les magiciens de guerre, car elle leur permet de faire plus souvent mouche avec leurs pouvoirs dévastateurs.", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Bâton de défense",              klasses: [magicien],     description: "Il vous confère un bonus de +1 à la CA. Par ailleurs, une fois par rencontre, dans le cadre d'une interruption immédiate, vous pouvez bénéficiez d'un bonus égal à votre modificateur de Constitution à la défense contre une attaque. Vous pouvez recourir à ce bonus même si me MD vous a déjà informé du total des dégâts infligés par l'attaque. Vous ne pouvez profiter de ces avantages que si vous vous servez du bâton. Cette forme de maîtrise est utile pour tous les magiciens, qu'ils s’intéressent aux sorts de contrôle ou à ceux infligeant des dégâts.", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Orbe du châtiment", klasses: [magicien], description: "Une fois par rencontre. vous pouvez, au prix d'une action libre, vous servir de votre orbe pour acquérir l'un des deux effets suivants.
Vous pouvez désigner une créature sur laquelle vous avez lancé un sort de magicien dont les effets persistent jusqu'à ce que le sujet ait réussi un jet de sauvegarde. Cette créature subit un malus égal à votre modificateur de Sagesse aux jets de sauvegarde contre cet effet.
Au lieu de cela, vous pouvez choisir de rallonger la durée d'un effet créé par un sort à volonté de magicien (comme <i>nuage de dague</i> ou <i>rayon de givre</i> qui se terminerait sans cela à la fin de votre tour de jeu actuel. L'effet persiste alors jusqu'à la fin de votre tour de jeu suivant.
Vous ne pouvez profiter de ces avantages que si vous vous servez de l'orbe. Les magiciens manipulateurs choisissent généralement cette forme de maîtrise, car elle leur permet de prolonger la durée de leurs sorts de contrôle.", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Orbe de tromperie",               klasses: [magicien],          description: "", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Tome de coercition",              klasses: [magicien],          description: "", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Tome de préparation",             klasses: [magicien],          description: "", parent_feature: maitrise_foca_arca, required: "choice_1"},
  {kind: "klass", name: "Parole inspiratrice",             klasses: [maitre_guerre],     description: ""},
  {kind: "klass", name: "Présence inspiratrice",           klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Présence tactique",               klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Présence ingénieuse",             klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Présence intrépide",              klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Présence perspicace",             klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Présence du tirailleur",          klasses: [maitre_guerre],     description: "", parent_feature: autorite_naturelle, required: "choice_1"},
  {kind: "klass", name: "Chef de troupe",                  klasses: [maitre_guerre],     description: "", required: "choice_2"},
  {kind: "klass", name: "Chef avisé",                      klasses: [maitre_guerre],     description: "", required: "choice_2"},
  {kind: "klass", name: "Chef d'assaut",                   klasses: [maitre_guerre],     description: "", required: "choice_2"},
  {kind: "klass", name: "Maître de guerre archer",         klasses: [maitre_guerre],     description: "", required: "choice_3"},
  {kind: "klass", name: "Combattant à mains nues",         klasses: [moine],             description: ""},
  {kind: "klass", name: "Défense sans armure",             klasses: [moine],             description: ""},
  {kind: "klass", name: "Poing de pierre",                 klasses: [moine],             description: "", parent_feature: tradition_monastique, required: "choice_1"},
  {kind: "klass", name: "Souffle centré",                  klasses: [moine],             description: "", parent_feature: tradition_monastique, required: "choice_1"},
  {kind: "klass", name: "Défi divin",                      klasses: [paladin],           description: ""},
  {kind: "klass", name: "Imposition des mains",            klasses: [paladin],           description: "", required: "choice_1"},
  {kind: "klass", name: "Serment ardent",                  klasses: [paladin],           description: "", required: "choice_1"},
  {kind: "klass", name: "Toucher de la vertu",             klasses: [paladin],           description: "", required: "choice_1"},
  {kind: "klass", name: "Mot de guérison",                 klasses: [pretre],            description: ""},
  {kind: "klass", name: "Savoir de soigneur",              klasses: [pretre],            description: ""},
  {kind: "klass", name: "Maître des runes",                klasses: [pretre_runes],      description: ""},
  {kind: "klass", name: "Runes de préparation",            klasses: [pretre_runes],      description: ""},
  {kind: "klass", name: "Marteau de l'ire",                klasses: [pretre_runes],      description: "", parent_feature: tradition_runique, required: "choice_1"},
  {kind: "klass", name: "Parole du défi",                  klasses: [pretre_runes],      description: "", parent_feature: tradition_runique, required: "choice_1"},
  {kind: "klass", name: "Spécialisation en télékinésie",   klasses: [psion],             description: "", parent_feature: discipline_spe, required: "choice_1"},
  {kind: "klass", name: "Spécialisation en télépathie",    klasses: [psion],             description: "", parent_feature: discipline_spe, required: "choice_1"},
  {kind: "klass", name: "Traque",                          klasses: [rodeur],            description: ""},
  {kind: "klass", name: "Maîtrise des bêtes",              klasses: [rodeur],            description: "", required: "choice_1"},
  {kind: "klass", name: "Style de combat à distance",      klasses: [rodeur],            description: "", parent_feature: style_combat, required: "choice_2"},
  {kind: "klass", name: "Style de combat à deux armes",    klasses: [rodeur],            description: "", parent_feature: style_combat, required: "choice_2"},
  {kind: "klass", name: "Style du combat du chasseur",     klasses: [rodeur],            description: "", parent_feature: style_combat, required: "choice_2"},
  {kind: "klass", name: "Style de combat du maraudeur",    klasses: [rodeur],            description: "", parent_feature: style_combat, required: "choice_2"},
  {kind: "klass", name: "Tir de proximité",                klasses: [rodeur, sorcier],   description: "", required: "choice_3"},
  {kind: "klass", name: "Course d'assaut",                 klasses: [rodeur],            description: "", required: "choice_3"},
  {kind: "klass", name: "Guérison spirituelle",            klasses: [shaman],            description: ""},
  {kind: "klass", name: "Communication avec les esprits",  klasses: [shaman],            description: ""},
  {kind: "klass", name: "Esprit protecteur",               klasses: [shaman],            description: "", parent_feature: compagnon, required: "choice_1"},
  {kind: "klass", name: "Esprit prédateur",                klasses: [shaman],            description: "", parent_feature: compagnon, required: "choice_1"},
  {kind: "klass", name: "Esprit du guetteur",              klasses: [shaman],            description: "", parent_feature: compagnon, required: "choice_1"},
  {kind: "klass", name: "Esprit du messager des mondes",   klasses: [shaman],            description: "", parent_feature: compagnon, required: "choice_1"},
  {kind: "klass", name: "Décharge occulte",                klasses: [sorcier],           description: ""},
  {kind: "klass", name: "Déplacement enténébré",           klasses: [sorcier],           description: ""},
  {kind: "klass", name: "Envoûtement",                     klasses: [sorcier],           description: ""},
  {kind: "klass", name: "Pacte féerique",                  klasses: [sorcier],           description: "", parent_feature: pacte_occulte, required: "choice_1"},
  {kind: "klass", name: "Pacte infernal",                  klasses: [sorcier],           description: "", parent_feature: pacte_occulte, required: "choice_1"},
  {kind: "klass", name: "Pacte stellaire",                 klasses: [sorcier],           description: "", parent_feature: pacte_occulte, required: "choice_1"},
  {kind: "klass", name: "Pacte des vestiges",              klasses: [sorcier],           description: "", parent_feature: pacte_occulte, required: "choice_1"},
  {kind: "klass", name: "Armure de la foi",                klasses: [vengeur],           description: ""},
  {kind: "klass", name: "Serment d'inimitié",              klasses: [vengeur],           description: ""},
  {kind: "klass", name: "Censure de poursuite",            klasses: [vengeur],           description: "", parent_feature: censure_vengeur, required: "choice_1"},
  {kind: "klass", name: "Censure rétributive",             klasses: [vengeur],           description: "", parent_feature: censure_vengeur, required: "choice_1"},
  {kind: "klass", name: "Censure collective",              klasses: [vengeur],           description: "", parent_feature: censure_vengeur, required: "choice_1"},
  {kind: "klass", name: "Attaque sournoise",               klasses: [voleur],            description: ""},
  {kind: "klass", name: "Frappe de la mante",              klasses: [voleur],            description: ""},
  {kind: "klass", name: "Brute des bas-fonds",             klasses: [voleur],            description: "", parent_feature: tactique_roublard, required: "choice_1"},
  {kind: "klass", name: "Esthète de l'esquive",            klasses: [voleur],            description: "", parent_feature: tactique_roublard, required: "choice_1"},
  {kind: "klass", name: "Ruffian impitoyable",             klasses: [voleur],            description: "", parent_feature: tactique_roublard, required: "choice_1"},
  {kind: "klass", name: "Furtivité",                       klasses: [voleur],            description: "", parent_feature: tactique_roublard, required: "choice_1"},
  {kind: "klass", name: "Armes du voleur",                 klasses: [voleur],            description: "", required: "choice_2"},
  {kind: "klass", name: "Tireur d'élite",                  klasses: [voleur],            description: "", required: "choice_2"}
])

God.create([
  {name: "Amaunator"           , rank: "Majeurs",   alignment: "Loyal bon"          , influence: "Soleil"},
  {name: "Angharradh"          , rank: "Mineurs",   alignment: "Bon"                , influence: "Sagesse"},
  {name: "Asmodée"             , rank: "Majeurs",   alignment: "Mauvais"            , influence: "Péché"},
  {name: "Avandra"             , rank: "Mineurs",   alignment: "Bon"                , influence: "Changement"},
  {name: "Baine"               , rank: "Majeurs",   alignment: "Mauvais"            , influence: "Tyrannie"},
  {name: "Bahamut"             , rank: "Mineurs",   alignment: "Bon"                , influence: "Justice"},
  {name: "Berronar Purargent"  , rank: "Mineurs",   alignment: "Loyal bon"          , influence: "Famille"},
  {name: "Chauntéa"            , rank: "Majeurs",   alignment: "Loyal bon"          , influence: "Vie"},
  {name: "Corellon"            , rank: "Majeurs",   alignment: "Bon"                , influence: "Fées"},
  {name: "Cyric"               , rank: "Majeurs",   alignment: "Chaotique mauvais"  , influence: "Conflit"},
  {name: "Érathis"             , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Civilisation"},
  {name: "Garl Brilledor"      , rank: "Mineurs",   alignment: "Bon"                , influence: "Protection"},
  {name: "Ghaunadaur"          , rank: "Majeurs",   alignment: "Chaotique mauvais"  , influence: "Abominations"},
  {name: "Gond"                , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Artisanat"},
  {name: "Gruumsh"             , rank: "Majeurs",   alignment: "Chaotique mauvais"  , influence: "Sauvagerie"},
  {name: "Ilmater"             , rank: "Mineurs",   alignment: "Bon"                , influence: "Souffrance"},
  {name: "Ioun"                , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Connaissance"},
  {name: "Kelemvor"            , rank: "Majeurs",   alignment: "Non aligné"         , influence: "Mort"},
  {name: "Kord"                , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Bataille"},
  {name: "Lolth"               , rank: "Majeurs",   alignment: "Chaotique mauvais"  , influence: "Drows"},
  {name: "Mailikki"            , rank: "Mineurs",   alignment: "Bon"                , influence: "Forêts"},
  {name: "Mélora"              , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Mer"},
  {name: "Moradin"             , rank: "Majeurs",   alignment: "Loyal bon"          , influence: "Nains"},
  {name: "Oghma"               , rank: "Majeurs",   alignment: "Non aligné"         , influence: "Connaissance"},
  {name: "Pélor"               , rank: "Mineurs",   alignment: "Bon"                , influence: "Été"},
  {name: "Reine Corneille"     , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Hiver"},
  {name: "Sehanine"            , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Automne"},
  {name: "Séluné"              , rank: "Majeurs",   alignment: "Bon"                , influence: "Lune"},
  {name: "Shar"                , rank: "Majeurs",   alignment: "Mauvais"            , influence: "Ombres"},
  {name: "Sheela Peryroyl"     , rank: "Mineurs",   alignment: "Bon"                , influence: "Beauté"},
  {name: "Sunie"               , rank: "Majeurs",   alignment: "Bon"                , influence: "Beauté"},
  {name: "Sylvanus"            , rank: "Majeurs",   alignment: "Non aligné"         , influence: "Nature"},
  {name: "Tempus"              , rank: "Majeurs",   alignment: "Non aligné"         , influence: "Guerre"},
  {name: "Torm"                , rank: "Majeurs",   alignment: "Loyal bon"          , influence: "Loi"},
  {name: "Torog"               , rank: "Mineurs",   alignment: "Mauvais"            , influence: "Outreterre"},
  {name: "Tymora"              , rank: "Mineurs",   alignment: "Bon"                , influence: "Chance"},
  {name: "Vecna"               , rank: "Mineurs",   alignment: "Mauvais"            , influence: "Morts-vivants"},
  {name: "Waukyne"             , rank: "Mineurs",   alignment: "Non aligné"         , influence: "Marchands"},
  {name: "Zéhir"               , rank: "Mineurs",   alignment: "Mauvais"            , influence: "Poison"}
])

Language.create([
  {language: "Abyssal",     writing: "Barazhad",    level_1: false, spoken_by: "Démons, gnolls, sahuagins"},
  {language: "Commun",      writing: "Commune",     level_1: true,  spoken_by: "Halfelins, humains, tieffelins"},
  {language: "Draconique",  writing: "Lokharique",  level_1: true,  spoken_by: "Dragons, drakéides, kobolds"},
  {language: "Elfique",     writing: "Rellanique",  level_1: true,  spoken_by: "Éladrins, elfes, fomorians"},
  {language: "Géant",       writing: "Davekc",      level_1: true,  spoken_by: "Géant, ogres, orques"},
  {language: "Gobelin",     writing: "Commune",     level_1: true,  spoken_by: "Gobelins, gobelours, hobgobelins"},
  {language: "Nain",        writing: "Davek",       level_1: true,  spoken_by: "Azers, nains"},
  {language: "Originel",    writing: "Barazhad",    level_1: false, spoken_by: "Archons, éfrits, élémentaires"},
  {language: "Profond",     writing: "Rellanique",  level_1: true,  spoken_by: "Flagelleurs mentaux, githyanki, kuo-toas"},
  {language: "Universel",   writing: "Universelle", level_1: true,  spoken_by: "Anges, diables, dieux"}
])

# password: plop
User.create(name: 'illisae', email: 'eric.le.guellaut@hotmail.fr',  password_digest: '$2a$10$mW18Uf2qvZPfVQW.oQwnEO5pkYX.uQQ2qrQ3mSwetQ8wf8E/Y2gJK')

# Création des abilities
Ability.create([
  {name: "strength"},
  {name: "constitution"},
  {name: "dexterity"},
  {name: "intelligence"},
  {name: "wisdom"},
  {name: "charisma"}
])

# Création des skills
Skill.create([
  {name: "acrobatics"},
  {name: "arcana"},
  {name: "athletics"},
  {name: "bluff"},
  {name: "diplomacy"},
  {name: "dungeoneering"},
  {name: "endurance"},
  {name: "heal"},
  {name: "history"},
  {name: "insight"},
  {name: "intimidate"},
  {name: "nature"},
  {name: "perception"},
  {name: "religion"},
  {name: "stealth"},
  {name: "streetwise"},
  {name: "thievery"}
])

puts "Seeding done"
