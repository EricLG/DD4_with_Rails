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
no_property     = WeaponProperty.create(name: "-",                      description:"")

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

changelin            = Race.create(name: "Changelin",            skill: Skill.new(origin: r, bluff: 2, insight: 2),            average_height: '1,65 m à 1,80 m',  average_weight: '60 à 80 kg',   vision: 'normale',  language: 'commun',                                       stats: [Stat.new(intelligence:  2, charisma:      2, kind: r), Stat.new(intelligence:   2, dexterity:     2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
cristallien          = Race.create(name: "Cristallien",          skill: Skill.new(origin: r, arcana: 2, endurance: 2),         average_height: '1,70 m à 1,85 m',  average_weight: '90 à 115 kg',  vision: 'normale',  language: 'commun, profond, une autre au choix',          stats: [Stat.new(intelligence:  2, wisdom:        2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
demi_elfe            = Race.create(name: "Demi-elfe",            skill: Skill.new(origin: r, diplomacy:  2, insight:     2),   average_height: '1,65 m à 1,85 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique, une supplémentaire au choix', stats: [Stat.new(constitution:  2, wisdom:        2, kind: r), Stat.new(constitution:   2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
demi_orque           = Race.create(name: "Demi-orque",           skill: Skill.new(origin: r, endurance: 2, intimidate: 2),     average_height: '1,90 m à 2,10 m',  average_weight: '77 à 112 kg',  vision: 'nocturne', language: 'commun, géant',                                stats: [Stat.new(dexterity:     2, strength:      2, kind: r), Stat.new(dexterity:      2, constitution:  2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
deva                 = Race.create(name: "Déva",                 skill: Skill.new(origin: r, history: 2, religion: 2),         average_height: '2 m à 2,15 m',     average_weight: '87 à 140 kg',  vision: 'normale',  language: 'commun, deux supplémentaires au choix',        stats: [Stat.new(intelligence:  2, wisdom:        2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
drakeide             = Race.create(name: "Drakéide",             skill: Skill.new(origin: r, history:    2, intimidate:  2),   average_height: '1,85 m à 2 m',     average_weight: '110 à 160 kg', vision: 'normale',  language: 'commun, draconique',                           stats: [Stat.new(charisma:      2, strength:      2, kind: r), Stat.new(charisma:       2, constitution:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
drow                 = Race.create(name: "Drow",                 skill: Skill.new(origin: r, stealth: 2, intimidate: 2),       average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(dexterity:     2, charisma:      2, kind: r), Stat.new(dexterity:      2, wisdom:        2,  kind: r)], source_id: roou.id, cat_size: "M", speed: 6)
eladrin              = Race.create(name: "Éladrin",              skill: Skill.new(origin: r, arcana: 2, history: 2),           average_height: '1,65 m à 1,85 m',  average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(intelligence:  2, dexterity:     2, kind: r), Stat.new(intelligence:   2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
elfe                 = Race.create(name: "Elfe",                 skill: Skill.new(origin: r, nature: 2, perception: 2),        average_height: '1,60 m à 1,80 m',  average_weight: '65 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r), Stat.new(dexterity:      2, intelligence:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
feral_griffe_effilee = Race.create(name: "Féral griffe-effilée", skill: Skill.new(origin: r, acrobatics: 2, stealth: 2),       average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r)],                                                          source_id: mdj2.id, cat_size: "M", speed: 6)
feral_longue_dent    = Race.create(name: "Féral longue-dent",    skill: Skill.new(origin: r, athletics: 2, endurance: 2),      average_height: '1,80 m à 2 m',     average_weight: '65 à 90 kg',   vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength:      2, wisdom:        2, kind: r)],                                                          source_id: mdj2.id, cat_size: "M", speed: 6)
forgelier            = Race.create(name: "Forgelier",            skill: Skill.new(origin: r, endurance: 2, intimidate: 2),     average_height: '1,80 m à 1,95 m',  average_weight: '135 à 150 kg', vision: 'normale',  language: 'commun',                                       stats: [Stat.new(constitution:  2, strength:      2, kind: r), Stat.new(constitution:   2, intelligence:  2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
genasi               = Race.create(name: "Genasi",               skill: Skill.new(origin: r, endurance: 2, nature: 2),         average_height: '1,70 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, originel',                             stats: [Stat.new(strength:      2, intelligence:  2, kind: r), Stat.new(strength:       2, constitution:  2,  kind: r)], source_id: roou.id, cat_size: "M", speed: 6)
githzerai            = Race.create(name: "Githzerai",            skill: Skill.new(origin: r, acrobatics: 2, athletics: 2),     average_height: '1,80 m à 1,95 m',  average_weight: '80 à 95 kg',   vision: 'normale',  language: 'commun, profond',                              stats: [Stat.new(dexterity:     2, wisdom:        2, kind: r), Stat.new(dexterity:      2, intelligence:  2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
gnome                = Race.create(name: "Gnome",                skill: Skill.new(origin: r, arcana: 2, stealth: 2),           average_height: '1,10 m à 1,20 m',  average_weight: '25 à 37 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(intelligence:  2, charisma:      2, kind: r), Stat.new(intelligence:   2, dexterity:     2,  kind: r)], source_id: mdj2.id, cat_size: "P", speed: 5)
goliath              = Race.create(name: "Goliath",              skill: Skill.new(origin: r, athletics: 2, nature: 2),         average_height: '2,40 m à 2,50 m',  average_weight: '140 à 170 kg', vision: 'normale',  language: 'commun, et nain ou géant',                     stats: [Stat.new(strength:      2, constitution:  2, kind: r), Stat.new(strength:       2, wisdom:        2,  kind: r)], source_id: mdj2.id, cat_size: "M", speed: 6)
halfelin             = Race.create(name: "Halfelin",             skill: Skill.new(origin: r, acrobatics: 2, thievery: 2),      average_height: '1,15 m à 1,25 m',  average_weight: '37 à 42 kg',   vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(dexterity:     2, constitution:  2, kind: r), Stat.new(dexterity:      2, charisma:      2,  kind: r)], source_id: mdj1.id, cat_size: "P", speed: 6)
humain               = Race.create(name: "Humain",               skill: nil,                                        average_height: '1,65 m à 1,85 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength: 2, kind: r), Stat.new(constitution: 2, kind: r), Stat.new(dexterity: 2, kind: r), Stat.new(intelligence: 2, kind: r), Stat.new(wisdom: 2, kind: r), Stat.new(charisma: 2, kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)
kalashtar            = Race.create(name: "Kalashtar",            skill: Skill.new(origin: r, insight: 2),                      average_height: '1,70 m à 1,90 m',  average_weight: '65 à 110 kg',  vision: 'normale',  language: kalashtar_language,                             stats: [Stat.new(wisdom:        2, charisma:      2, kind: r), Stat.new(wisdom:         2, intelligence:  2,  kind: r)], source_id: eber.id, cat_size: "M", speed: 6)
minotaure            = Race.create(name: "Minotaure",            skill: Skill.new(origin: r, nature: 2, perception: 2),        average_height: '2,15 m à 2,30 m',  average_weight: '160 à 175 kg', vision: 'normale',  language: 'commun, une supplémentaire au choix',          stats: [Stat.new(strength:      2, constitution:  2, kind: r), Stat.new(strength:       2, wisdom:        2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
nain                 = Race.create(name: "Nain",                 skill: Skill.new(origin: r, endurance: 2, dungeoneering: 2),  average_height: '1,25 m à 1,45 m',  average_weight: '80 à 110 kg',  vision: 'nocturne', language: 'commun, nain',                                 stats: [Stat.new(constitution:  2, strength:      2, kind: r), Stat.new(constitution:   2, wisdom:        2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 5)
silvyen              = Race.create(name: "Silvyen",              skill: Skill.new(origin: r, stealth: 2, nature: 2),           average_height: '1,80 m à 1,95 m',  average_weight: '70 à 85 kg',   vision: 'nocturne', language: 'commun, elfique',                              stats: [Stat.new(constitution:  2, wisdom:        2, kind: r), Stat.new(constitution:   2, dexterity:     2,  kind: r)], source_id: mdj3.id, cat_size: "M", speed: 6)
tieffelin            = Race.create(name: "Tieffelin",            skill: Skill.new(origin: r, bluff: 2, stealth: 2),            average_height: '1,65 m à 1,85 m',  average_weight: '70 à 115 kg',  vision: 'nocturne', language: 'commun, une supplémentaire au choix',          stats: [Stat.new(charisma:      2, constitution:  2, kind: r), Stat.new(charisma:       2, intelligence:  2,  kind: r)], source_id: mdj1.id, cat_size: "M", speed: 6)

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
RaceFeature.create(races: [elfe],                     name: "Vigilance de groupe",              description: "vous conférez un bonus racial de +1 aux tests de Perception de tous vos alliés non elfes situés dans un rayon de 5 cases.")
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
RaceFeature.create(races: [tieffelin],                name: "Courroux infernal",                description: "vous pouvez utilisez <em>Courroux infernal</em> en tant que pouvoir de rencontre.")
RaceFeature.create(races: [tieffelin],                name: "Résistance au feu",                description: "vous bénéficiez d'une résistance au feu 5 + la moitié de votre niveau.")
RaceFeature.create(races: [demi_orque],               name: "Assaut enragé",                    description: "vous avez le pouvoir <em>Assaut enragé</em>.")
RaceFeature.create(races: [demi_orque],               name: "Charge véloce",                    description: "vous gagnez un bonus de +2 à la vitesse de déplacement lorsque vous chargez.")
RaceFeature.create(races: [demi_orque],               name: "Vitalité demi-orque",              description: "la première fois que vous êtes en péril au cours d'une rencontre, vous gagnez 5 points de vie temporaires. Ce nombre augment à 10 au niveau 11 et 15 au niveau 21.")
RaceFeature.create(races: [deva],                     name: "Majesté astrale",                  description: "vous bénéficiez d'un bonus de +1 à toutes vos défenses contre les attaques effectuées par une créature en péril.")
RaceFeature.create(races: [deva],                     name: "Mémoire d'un millier de vies",     description: "vous avez le pouvoir <em>Mémoire d'un millier de vies</em>.")
RaceFeature.create(races: [deva, cristallien],        name: "Origine immortelle",               description: "votre âme est native de la Mer Astrale et vous êtes considéré comme une créature immortelle pour déterminer les effets relatifs à l'origine d'une créature.")
RaceFeature.create(races: [deva],                     name: "Résistance astrale",               description: "vous bénéficiez d'une résistance aux dégâts nécrotiques et radiants égale à 5 + la moitié de votre niveau.")
RaceFeature.create(races: [feral_griffe_effilee],     name: "Sauvagerie griffe-effilée",        description: "Vous avez le pouvoir <em>Sauvagerie griffe-effilée</em>.")
RaceFeature.create(races: [feral_longue_dent],        name: "Sauvagerie longue-dent",           description: "Vous avez le pouvoir <em>Sauvagerie longue-dent</em>.")
RaceFeature.create(races: [gnome],                    name: "Discrétion réactive",              description: "Vous avez le pouvoir <em>Effacement</em>.")
RaceFeature.create(races: [gnome],                    name: "Maître menteur",                   description: "une fois par rencontre, vous pouvez utilisez le tour de prestidigitation de magicien <em>Son imaginaire</em> (cf. p.76 du <em>Manuel des Joueurs</em>) au prix d'une action mineure.")
RaceFeature.create(races: [gnome],                    name: "Perspicacité du menteur",          description: "vous bénéficiez d'un bonus racial de +5 aux jets de sauvegarde contre les illusions.")
RaceFeature.create(races: [goliath],                  name: "Athlète puissant",                 description: "lorsque vous effectuez un test d'Athlétisme pour sauter ou grimper, jetez deux dés et conservez l'un des résultats.")
RaceFeature.create(races: [goliath],                  name: "Endurance de la pierre",           description: "Vous avez le pouvoir <em>Endurance de la pierre</em>.")
RaceFeature.create(races: [goliath],                  name: "Ténacité de la montagne",          description: "vous bénéficiez d'un bonus racial de +1 à la Volonté.")
RaceFeature.create(races: [cristallien],              name: "Esprit cristallin",                description: "vous bénéficiez d'une résistance psychique 5. Cette résistance augment à 10 au niveau 11 et 15 au niveau 21.")
RaceFeature.create(races: [cristallien],              name: "Nuée de cristaux",                 description: "Vous avez le pouvoir <em>Nué de cristaux</em>.")
RaceFeature.create(races: [cristallien],              name: "Télépathie",                       description: "vous pouvez communiquer par télépathie avec toute créature douée de langage située dans un rayon de 5 cases.")
RaceFeature.create(races: [githzerai],                name: "Esprit défendu",                   description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegarde contre les effets qui hébètent, dominent ou étourdissent.")
RaceFeature.create(races: [githzerai],                name: "Heureuse fortune",                 description: "quand vous utilisez votre second souffle, vous pouvez vous décalez de 3 cases au prix d'une action libre.")
RaceFeature.create(races: [githzerai],                name: "Mental d'acier",                    description: "Vous avez le pouvoir <em>Mental d'acier</em>.")
RaceFeature.create(races: [githzerai],                name: "Sens du danger",                   description: "vous bénéficiez d'un bonus racial de +2 aux tests d'initiative.")
RaceFeature.create(races: [minotaure],                name: "Charge encornée",                  description: "Vous avez le pouvoir <em>Charge encornée</em>.")
RaceFeature.create(races: [minotaure],                name: "Charge intrépide",                 description: "vous bénéficiez d'un bonus racial de +2 à la CA contre les attaques d'opportunités que vous provoquez lors d'une charge.")
RaceFeature.create(races: [minotaure],                name: "Férocité",                         description: "lorsque vous êtes réduit à 0 point de vie ou moins, vous pouvez effectuer une attaque de base de corps à corps au prix d'une interruption immédiate.")
RaceFeature.create(races: [minotaure],                name: "Vitalité",                         description: "vous avez une récupération supplémentaire")
RaceFeature.create(races: [silvyen],                  name: "Aspect de la nature",              description: "quand vous arrivez au bout d'un repos prolongé, choisissez lequel des aspects de la nature suivant vous manifestez.<br><em>Aspect des anciens</em> : vous pouvez utilisez le pouvoir <em>Voyage des anciens</em> quand vous manifestez cet aspect.<br><em>Aspect du chasseur</em> : vous pouvez utilisez le pouvoir <em>Poursuite du chasseur</em> quand vous manifestez cet aspect.<br><em>Aspect du destructeur</em> : vous pouvez utilisez le pouvoir <em>Courroux du destructeur</em> quand vous manifestez cet aspect.")
RaceFeature.create(races: [silvyen],                  name: "Forme endurcie",                   description: "choisissez les Réflexes, la Vigueur ou la Volonté. Vous bénéficiez d'un bonus racial de +1 dans cette défense.")
RaceFeature.create(races: [changelin],                name: "Change-forme",                     description: "vous avez le pouvoir <em>Déguisement du changelin</em>.")
RaceFeature.create(races: [changelin],                name: "Défense mentale",                  description: "vous bénéficiez d'un bonus racial de +1 en Volonté.")
RaceFeature.create(races: [changelin],                name: "Métamorphe",                       description: "vous êtes un métamorphe et pouvez modifier votre apparence. Vous êtes donc sujet aux effets et états préjudiciables qui affectent les métamorphes.")
RaceFeature.create(races: [changelin],                name: "Ruse du changelin",                description: "vous avez le pouvoir <em>Ruse du changelin</em>.")
RaceFeature.create(races: [forgelier],                name: "Esprit du forgelier",              description: "vous bénéficiez d'un bonus racial de +1 en Volonté.")
RaceFeature.create(races: [forgelier],                name: "Opiniâtreté forgelière",           description: "vous avez le pouvoir <em>Opiniâtreté forgelière</em.")
RaceFeature.create(races: [forgelier],                name: "Résistance forgelière",            description: "vous bénéficiez d'un bonus racial de +2 aux jets de sauvegarde contre les dégâts continus. De plus, lorsque vous effectuez un jet de sauvegarde contre la mort, vous pouvez choisir de faire 10 pour remplacer le résultat de votre jet.")
RaceFeature.create(races: [forgelier],                name: "Veilleur infatigable",             description: "vous n'avez pas besoin de dormir, mais vous devez rester inactif pendant 4 heures pour prendre un repos prolongé. Dans cet état de passivité, vous êtes pleinement conscient de ce qui vous entoure. Vous pouvez ainsi remarquez les ennemis en approche et tout autre événement.")
RaceFeature.create(races: [kalashtar],                name: "Âme double",                       description: "au début de votre tour de jeu, vous pouvez effectuer un jet de sauvegarde contre chaque effet qui vous hébète ou vous domine. Si vous ratez ce jet de sauvegarde, vous n'en effectuez pas un autre contre l'effet en question à la fin de votre tour de jeu.")
RaceFeature.create(races: [kalashtar],                name: "Bastion de clarté mentale",        description: "vous avez le pouvoir <em>Bastion de clarté mentale</em.")
RaceFeature.create(races: [drow],                     name: "Lolthaïque",                       description: "une fois par rencontre, vous pouvez utilisez <em>Chape d'obscurité</em> ou <em>Noirfeu</em>.")
RaceFeature.create(races: [genasi],                   name: "Origine élémentaire",              description: "vos ancêtres étaient natifs du Chaos Élémentaire, vous êtes donc considéré comme une créature élémentaire au regard des effets liés à cette origine.")
RaceFeature.create(races: [genasi],                   name: "Manifestation élémentaire",        description: "choisissez une manifestation élémentaire: âme d'eau, âme de feu, âme d'orage, âme de terre ou âme de vent. Cette manifestation fait partie intégrante de votre nature(le talent <em>Manifestation élémentaire</em>, p.136, vous permet cependant de prendre des manifestations en plus et d'en changer). Chaque manifestation élémentaire propose des avantages particuliers et un pouvoir de rencontre. Enfin votre apparence change selon l’élément que vous manifestez.<br>
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
acrobatics    = Skill.create(origin: 'required_skill_for_class', acrobatics:     5)
arcana        = Skill.create(origin: 'required_skill_for_class', arcana:         5)
athletics     = Skill.create(origin: 'required_skill_for_class', athletics:      5)
bluff         = Skill.create(origin: 'required_skill_for_class', bluff:          5)
diplomacy     = Skill.create(origin: 'required_skill_for_class', diplomacy:      5)
dungeoneering = Skill.create(origin: 'required_skill_for_class', dungeoneering:  5)
endurance     = Skill.create(origin: 'required_skill_for_class', endurance:      5)
heal          = Skill.create(origin: 'required_skill_for_class', heal:           5)
history       = Skill.create(origin: 'required_skill_for_class', history:        5)
insight       = Skill.create(origin: 'required_skill_for_class', insight:        5)
intimidate    = Skill.create(origin: 'required_skill_for_class', intimidate:     5)
nature        = Skill.create(origin: 'required_skill_for_class', nature:         5)
perception    = Skill.create(origin: 'required_skill_for_class', perception:     5)
religion      = Skill.create(origin: 'required_skill_for_class', religion:       5)
stealth       = Skill.create(origin: 'required_skill_for_class', stealth:        5)
streetwise    = Skill.create(origin: 'required_skill_for_class', streetwise:     5)
thievery      = Skill.create(origin: 'required_skill_for_class', thievery:       5)



barbare = Klass.create(
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              endurance: 5,
                              heal: 5,
                              intimidate: 5,
                              nature: 5,
                              perception: 5),
  options_creation:   "barbare sanguinaire, barbare champion tribal, barbare fils du tonnerre, barbare tournoyant",
  skills_number:      3)
barde = Klass.create(
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
  required_skills:    [arcana],
  available_skills:   Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              arcana: 5,
                              athletics: 5,
                              bluff: 5,
                              diplomacy: 5,
                              dungeoneering: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              nature: 5,
                              perception: 5,
                              religion: 5,
                              streetwise: 5),
  options_creation:   "barde rusé, barde valeureux, barde prescient",
  skills_number:      4)
batailleur = Klass.create(
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              bluff: 5,
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              insight: 5,
                              intimidate: 5),
  options_creation:   "batailleur rapide, batailleur robuste",
  skills_number:      3)
druide = Klass.create(
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
  required_skills:    [nature],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              nature: 5,
                              perception: 5),
  options_creation:   "druide gardien, druide prédateur, druide des nuées, druide convocateur",
  skills_number:      3)
ensorceleur = Klass.create(
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
  required_skills:    [arcana],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              bluff: 5,
                              diplomacy: 5,
                              dungeoneering: 5,
                              endurance: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              nature: 5),
  options_creation:   "ensorceleur du chaos, ensorceleur dragon, ensorceleur des tempêtes, ensorceleur cosmique",
  skills_number:      3)
faconneur = Klass.create(
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
  required_skills:    [arcana],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              diplomacy: 5,
                              dungeoneering: 5,
                              heal: 5,
                              history: 5,
                              perception: 5,
                              thievery: 5),
  options_creation:   "façonneur bricoleur, façonneur forgeron de guerre",
  skills_number:      3)
flamboyant = Klass.create(
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              bluff: 5,
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              insight: 5,
                              intimidate: 5,
                              streetwise: 5),
  options_creation:   "flamboyant euphorique, flamboyant illuminé",
  skills_number:      4)
gardien = Klass.create(
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
  required_skills:    [nature],
  available_skills:   Skill.new(origin: 'available_skills',
                              athletics: 5,
                              dungeoneering: 5,
                              endurance: 5,
                              heal: 5,
                              intimidate: 5,
                              nature: 5,
                              perception: 5),
  options_creation:   "gardien de la terre, gardien indompté, gardien de la tempête, gardien de la vie",
  skills_number:      3)
guerrier = Klass.create(
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              athletics: 5,
                              streetwise: 5,
                              endurance: 5,
                              intimidate: 5,
                              heal: 5),
  options_creation:   "guerrier offensif, guerrier défensif",
  skills_number:      3)
invocateur = Klass.create(
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
  required_skills:    [religion],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              diplomacy: 5,
                              endurance: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              religion: 5),
  options_creation:   "invocateur protecteur, invocateur courroucé, invocateur des malédictions",
  skills_number:      3)
limier = Klass.create(
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
  required_skills:    [nature],
  available_skills:   Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              endurance: 5,
                              heal: 5,
                              insight: 5,
                              intimidate: 5,
                              nature: 5,
                              perception: 5,
                              stealth: 5),
  options_creation:   "limier protecteur, limier vengeur",
  skills_number:      3)
mage_lames = Klass.create(
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
  required_skills:    [arcana],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              diplomacy: 5,
                              endurance: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5),
  options_creation:   "mage lame défensif, mage lame offensif, mage lame prédateur",
  skills_number:      3)
magicien = Klass.create(
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
  required_skills:    [arcana],
  available_skills:   Skill.new(origin: 'available_skills',
                              arcana: 5,
                              diplomacy: 5,
                              dungeoneering: 5,
                              history: 5,
                              insight: 5,
                              nature: 5,
                              religion: 5),
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              athletics: 5,
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              history: 5,
                              intimidate: 5),
  options_creation:   "maître de guerre charismatique, maître de guerre tacticien, maître de guerre ingénieux, maître de guerre perspicace, maître de guerre intrépide, maître de guerre tirailleur",
  skills_number:      4)
moine = Klass.create(
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
  required_skills:    [],
  available_skills:   Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              insight: 5,
                              perception: 5,
                              religion: 5,
                              stealth: 5,
                              thievery: 5),
  options_creation:   "moine du poing de pierre, moine du souffle centré",
  skills_number:      4)
paladin = Klass.create(
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
  required_skills:    [religion],
  available_skills: Skill.new(origin: 'available_skills',
                              diplomacy: 5,
                              endurance: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              religion: 5),
  options_creation:   "paladin défenseur, paladin vengeur, paladin fougueux, paladin vertueux",
  skills_number:      3)
pretre = Klass.create(
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
  required_skills:    [religion],
  available_skills: Skill.new(origin: 'available_skills',
                              arcana: 5,
                              diplomacy: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              religion: 5),
  options_creation:   "prêtre de combat, prêtre dévoué, prêtre protecteur",
  skills_number:      3)
pretre_runes = Klass.create(
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
  required_skills:    [religion],
  available_skills: Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              endurance: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              religion: 5,
                              thievery: 5),
  options_creation:   "prêtre des runes de l'ire, prêtre des runes du défi",
  skills_number:      3)
psion = Klass.create(
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
  required_skills:    [],
  available_skills: Skill.new(origin: 'available_skills',
                              arcana: 5,
                              bluff: 5,
                              diplomacy: 5,
                              dungeoneering: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              perception: 5),
  options_creation:   "psion télékinétique, psion télépathe",
  skills_number:      4)
rodeur = Klass.create(
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
  required_skills:    [dungeoneering, nature],
  available_skills:   Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              stealth: 5,
                              endurance: 5,
                              dungeoneering: 5,
                              nature: 5,
                              perception: 5,
                              heal: 5),
  options_creation:   "rôdeur archer, rôdeur double-lame, rôdeur maître des bêtes, rôdeur chasseur, rôdeur maraudeur",
  skills_number:      4)
shaman = Klass.create(
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
  required_skills:    [nature],
  available_skills: Skill.new(origin: 'available_skills',
                              arcana: 5,
                              athletics: 5,
                              endurance: 5,
                              heal: 5,
                              history: 5,
                              insight: 5,
                              nature: 5,
                              perception: 5,
                              religion: 5),
  options_creation:   "shaman de l'ours, shaman de la panthère, shaman de l'aigle, shaman messager des mondes",
  skills_number:      3)
sorcier = Klass.create(
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
  required_skills:    [],
  available_skills: Skill.new(origin: 'available_skills',
                              arcana: 5,
                              bluff: 5,
                              history: 5,
                              insight: 5,
                              intimidate: 5,
                              religion: 5,
                              streetwise: 5,
                              thievery: 5),
  options_creation:   "sorcier dévastateur, sorcier perfide",
  skills_number:      4)
vengeur = Klass.create(
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
  required_skills:    [religion],
  available_skills: Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              endurance: 5,
                              intimidate: 5,
                              perception: 5,
                              religion: 5,
                              stealth: 5,
                              streetwise: 5),
  options_creation:   "vengeur solitaire, vengeur acharné, vengeur commandeur",
  skills_number:      3)
voleur         = Klass.create(
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
  required_skills:    [stealth, thievery],
  available_skills: Skill.new(origin: 'available_skills',
                              acrobatics: 5,
                              athletics: 5,
                              bluff: 5,
                              dungeoneering: 5,
                              insight: 5,
                              intimidate: 5,
                              perception: 5,
                              stealth: 5,
                              streetwise: 5,
                              thievery: 5),
  options_creation:   "voleur brutale, voleur fourbe, voleur coupe-jarret, voleur voltigeur, voleur des ombres",
  skills_number:      4)


KlassFeature.create(
  name: "Agilité du barbare",
  klasses: [barbare],
  description: "Tant que vous ne portez pas d'armure lourde, vous bénéficiez d'un bonus de +1 à votre CA et vos Réflexes. Ce bonus passe à +2 au niveau 11 et +3 au niveau 21.",
  required: "required"
)
KlassFeature.create(
  name: "Carnage",
  klasses: [barbare],
  description: "Sur un coup critique, une fois par round, vous pouvez effectuer une attaque de base de corps à corps en action libre.",
  required: "required"
)
KlassFeature.create(
  name: "Frappe enragée",
  klasses: [barbare],
  description: "Les pouvoirs d'attaque quotidiens du barbare s'accompagnent du mot-clé Rage.",
  required: "required"
)
force_indomptable = KlassFeature.create(
  name: "Force indomptable",
  klasses: [barbare],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Ardeur sanguinaire",
  klasses: [barbare],
  description: "Vous gagnez le pouvoir Charge véloce. En outre, lorsque vous amenez un adversaire à 0 point de vie, vous gagnez des points de vie temporaire égaux à votre modificateur de Constitution.",
  parent_feature: force_indomptable,
  required: "choice_1"
)
KlassFeature.create(
  name: "Triomphe du champion",
  klasses: [barbare],
  description: "",
  parent_feature: force_indomptable,
  required: "choice_1"
)
KlassFeature.create(
  name: "Colère du fils du tonnerre",
  klasses: [barbare],
  description: "",
  parent_feature: force_indomptable,
  required: "choice_1"
)
KlassFeature.create(
  name: "Faucheur tournoyant",
  klasses: [barbare],
  description: "",
  parent_feature: force_indomptable,
  required: "choice_1"
)
KlassFeature.create(
  name: "Chant apaisant",
  klasses: [barde],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Formation de barde",
  klasses: [barde],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Multiclassage versatile",
  klasses: [barde],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Paroles d'amitié",
  klasses: [barde],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Paroles de majesté",
  klasses: [barde],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Savoir-faire polyvalent",
  klasses: [barde],
  description: "",
  required: "required"
)
vertu_barde = KlassFeature.create(
  name: "Vertu des bardes",
  klasses: [barde],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Vertu de vaillance",
  klasses: [barde],
  description: "",
  parent_feature: vertu_barde,
  required: "choice_1"
)
KlassFeature.create(
  name: "Vertu de ruse",
  klasses: [barde],
  description: "",
  parent_feature: vertu_barde,
  required: "choice_1"
)
KlassFeature.create(
  name: "Vertu de prescience",
  klasses: [barde],
  description: "",
  parent_feature: vertu_barde,
  required: "choice_1"
)
KlassFeature.create(
  name: "Accentuation psionique",
  klasses: [batailleur, flamboyant, psion],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Défense psionique",
  klasses: [batailleur],
  description: "",
  required: "required"
)
etude_psionqiue = KlassFeature.create(
  name: "Étude psionique",
  klasses: [batailleur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Résistance de combat",
  klasses: [batailleur],
  description: "",
  parent_feature: etude_psionqiue,
  required: "choice_1"
)
KlassFeature.create(
  name: "Vitesse de la pensée",
  klasses: [batailleur],
  description: "",
  parent_feature: etude_psionqiue,
  required: "choice_1"
)
KlassFeature.create(
  name: "Harmonie de la nature",
  klasses: [druide],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Magie rituelle",
  klasses: [druide, faconneur, invocateur, magicien, pretre, psion],
  description: "Vous gagnez le talent Lanceur de rituels (cf. p.199) en tant que talent supplémentaire, ce qui vous permet d’utiliser des rituels magiques (cf. Chapitre 10).",
  required: "required"
)
KlassFeature.create(
  name: "Métamorphose animale",
  klasses: [druide],
  description: "",
  required: "required"
)
aspect_primal = KlassFeature.create(
  name: "Aspect primal",
  klasses: [druide],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Gardien primal",
  klasses: [druide],
  description: "",
  parent_feature: aspect_primal,
  required: "choice_1"
)
KlassFeature.create(
  name: "Prédateur primal",
  klasses: [druide],
  description: "",
  parent_feature: aspect_primal,
  required: "choice_1"
)
KlassFeature.create(
  name: "Nuée primale",
  klasses: [druide],
  description: "",
  parent_feature: aspect_primal,
  required: "choice_1"
)
source_sorts = KlassFeature.create(
  name: "Source des sorts",
  klasses: [ensorceleur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Magie draconique",
  klasses: [ensorceleur],
  description: "",
  parent_feature: source_sorts,
  required: "choice_1"
)
KlassFeature.create(
  name: "Magie sauvage",
  klasses: [ensorceleur],
  description: "",
  parent_feature: source_sorts,
  required: "choice_1"
)
KlassFeature.create(
  name: "Magie des tempêtes",
  klasses: [ensorceleur],
  description: "",
  parent_feature: source_sorts,
  required: "choice_1"
)
KlassFeature.create(
  name: "Magie cosmique",
  klasses: [ensorceleur],
  description: "",
  parent_feature: source_sorts,
  required: "choice_1"
)
KlassFeature.create(
  name: "Infusion vulnéraire",
  klasses: [faconneur],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Jouvence arcanique",
  klasses: [faconneur],
  description: "",
  required: "required"
)
bonification = KlassFeature.create(
  name: "Bonification arcanique",
  klasses: [faconneur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Partage d'énergie",
  klasses: [faconneur],
  description: "",
  parent_feature: bonification,
  required: "choice_1"
)
KlassFeature.create(
  name: "Intensification d'énergie",
  klasses: [faconneur],
  description: "",
  parent_feature: bonification,
  required: "choice_1"
)
KlassFeature.create(
  name: "Regain flamboyant",
  klasses: [flamboyant],
  description: "",
  required: "required"
)
manteau_flamboyant = KlassFeature.create(
  name: "Manteau flamboyant",
  klasses: [flamboyant],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Manteau d'allégresse",
  klasses: [flamboyant],
  parent_feature: manteau_flamboyant,
  required: "choice_1"
)
KlassFeature.create(
  name: "Manteau de clarté",
  klasses: [flamboyant],
  description: "",
  parent_feature: manteau_flamboyant,
  required: "choice_1"
)
KlassFeature.create(
  name: "Fontaine de vie",
  klasses: [gardien],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Colère de la nature",
  klasses: [gardien],
  description: "",
  required: "required"
)
puissance_gardien = KlassFeature.create(
  name: "Puissance du gardien",
  klasses: [gardien],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Force de la terre",
  klasses: [gardien],
  description: "",
  parent_feature: puissance_gardien,
  required: "choice_1"
)
KlassFeature.create(
  name: "Sang indompté",
  klasses: [gardien],
  description: "",
  parent_feature: puissance_gardien,
  required: "choice_1"
)
KlassFeature.create(
  name: "Coeur de tempête",
  klasses: [gardien],
  description: "",
  parent_feature: puissance_gardien,
  required: "choice_1"
)
KlassFeature.create(
  name: "Esprit vital",
  klasses: [gardien],
  description: "",
  parent_feature: puissance_gardien,
  required: "choice_1"
)
KlassFeature.create(
  name: "Défi en combat",
  klasses: [guerrier],
  description: "Il est dangereux d'ignorer un guerrier au combat.
  À chaque fois que vous attaquez un ennemi, que votre coup le touche ou pas, vous avez la possibilité de le marquer.
  La marque dure jusqu'à la ﬁn de votre tour de jeu suivant. Tant qu'une cible est marquée. elle subit un malus de -2 aux jets d`attaque qui ne vous prennent pas pour cible. Une créature ne peut être sujette qu'à une marque à la fois, une nouvelle marque remplaçant la précédente.
  De plus, à chaque fois qu'un ennemi marqué qui vous est adjacent se décale ou effectue une attaque dont vous n'êtes pas la cible. vous pouvez lui porter une attaque de base de corps à corps au pris, d'une interruption immédiate.",
  required: "required"
)
categorie_arme_favorite = KlassFeature.create(
  name: "Catégorie d'arme favorite",
  klasses: [guerrier],
  description: "Choisissez une catégorie d`armes : armes à une main ou armes à deux mains. Lorsque vous utilisez une arme de cette catégorie. vous bénéficiez d'un bonus de +1 aux jets d'attaque.",
  required: "choice_1"
)
KlassFeature.create(
  name: "Technique de la tempête",
  klasses: [guerrier],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Vigueur du guerrier téméraire",
  klasses: [guerrier],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Style du bagarreur",
  klasses: [guerrier],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Supériorité au combat",
  klasses: [guerrier],
  description: "Vous bénéﬁciez d`un bonus égal à votre modificateur de Sagesse aux attaques d`opportunité. Si le déplacement d'un ennemi provoque une attaque d'opportunité et que vous le touchez. il interrompt immédiatement son déplacement.  S'il lui reste des actions. il peut en entreprendre pour poursuivre son déplacement.",
  required: "choice_2"
)
KlassFeature.create(
  name: "Agilité au combat",
  klasses: [guerrier],
  description: "",
  required: "choice_2"
)
KlassFeature.create(
  name: "Arme à une main",
  klasses: [guerrier],
  description: "+1 aux jets d'attaque avec les armes à une main.",
  parent_feature: categorie_arme_favorite,
  required: "choice_3"
)
KlassFeature.create(
  name: "Arme à deux mains",
  klasses: [guerrier],
  description: "+1 aux jets d'attaque avec les armes à deux mains.",
  parent_feature: categorie_arme_favorite,
  required: "choice_3"
)
KlassFeature.create(
  name: "Conduit divin",
  klasses: [invocateur, paladin, pretre, vengeur],
  description: "",
  required: "required"
)
alliance_divine = KlassFeature.create(
  name: "Alliance divine",
  klasses: [invocateur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Alliance de colère",
  klasses: [invocateur],
  description: "",
  parent_feature: alliance_divine,
  required: "choice_1"
)
KlassFeature.create(
  name: "Alliance protectrice",
  klasses: [invocateur],
  description: "",
  parent_feature: alliance_divine,
  required: "choice_1"
)
KlassFeature.create(
  name: "Alliance de malédiction",
  klasses: [invocateur],
  description: "",
  parent_feature: alliance_divine,
  required: "choice_1"
)
KlassFeature.create(
  name: "Tir implacable",
  klasses: [limier],
  description: "",
  required: "required"
)
lien_limier = KlassFeature.create(
  name: "Lien du limier",
  klasses: [limier],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Lien désincarné",
  klasses: [limier],
  description: "",
  parent_feature: lien_limier,
  required: "choice_1"
)
KlassFeature.create(
  name: "Lien du sang",
  klasses: [limier],
  description: "",
  parent_feature: lien_limier,
  required: "choice_1"
)
KlassFeature.create(
  name: "Porte-lame",
  klasses: [mage_lames],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Écran du mage d'armes",
  klasses: [mage_lames],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
ecran_mage_lame = KlassFeature.create(
  name: "Égide du mage d'armes",
  klasses: [mage_lames],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Égide défensive",
  klasses: [mage_lames],
  description: "",
  parent_feature: ecran_mage_lame,
  required: "choice_1"
)
KlassFeature.create(
  name: "Égide offensive",
  klasses: [mage_lames],
  description: "",
  parent_feature: ecran_mage_lame,
  required: "choice_1"
)
KlassFeature.create(
  name: "Égide prédatrice",
  klasses: [mage_lames],
  description: "",
  parent_feature: ecran_mage_lame,
  required: "choice_1"
)
KlassFeature.create(
  name: "Tour de magie",
  klasses: [magicien],
  description: "Les tours de magie sont des sorts mineurs que vous acquerrez au niveau 1. Vous pouvez ainsi employer les sorts de <i>lumière</i>, <i>manipulation à distance</i>, <i>prestidigitation</i> et <i>son imaginaire</i> en tant que pouvoir à volonté.",
  required: "required"
)
KlassFeature.create(
  name: "Grimoire",
  klasses: [magicien],
  description: "Vous possédez un grimoire, livre rempli de savoir mystique dans lequel vous gardez une trace écrite de vos rituels et de vos sorts quotidiens et utilitaires. (cf MdJ1 p.74)",
  required: "required"
)
maitrise_foca_arca = KlassFeature.create(
  name: "Maîtrise des focaliseurs arcaniques",
  klasses: [magicien],
  description: "Vous vous spécialiser dans un type de Focaliseur pour profiter d'avantages supplémentaires quand vous y recouvrez.",
  required: "required"
)
KlassFeature.create(
  name: "Baguette de précision",
  klasses: [magicien],
  description: "Une fois par rencontre. vous pouvez. au prix d'une action libre, bénéficiez d'un bonus égal à votre modificateur de Dextérité à un jet d'attaque unique. Vous ne pouvez profiter de cet avantage que si vous vous servez de la baguette. Cette forme de maîtrise est idéale pour les magiciens de guerre, car elle leur permet de faire plus souvent mouche avec leurs pouvoirs dévastateurs.",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Bâton de défense",
  klasses: [magicien],
  description: "
il vous confère un bonus de +1 à la CA. Par ailleurs, une fois par rencontre, dans le cadre d'une interruption immédiate, vous pouvez bénéficiez d'un bonus égal à votre modificateur de Constitution à la défense contre une attaque. Vous pouvez recourir à ce bonus même si me MD vous a déjà informé du total des dégâts infligés par l'attaque. Vous ne pouvez profiter de ces avantages que si vous vous servez du bâton. Cette forme de maîtrise est utile pour tous les magiciens, qu'ils s’intéressent aux sorts de contrôle ou à ceux infligeant des dégâts.",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Orbe du châtiment",
  klasses: [magicien],
  description: "Une fois par rencontre. vous pouvez, au prix d'une action libre, vous servir de votre orbe pour acquérir l'un des deux effets suivants.
Vous pouvez désigner une créature sur laquelle vous avez lancé un sort de magicien dont les effets persistent jusqu'à ce que le sujet ait réussi un jet de sauvegarde. Cette créature subit un malus égal à votre modificateur de Sagesse aux jets de sauvegarde contre cet effet.
Au lieu de cela, vous pouvez choisir de rallonger la durée d'un effet créé par un sort à volonté de magicien (comme <i>nuage de dague</i> ou <i>rayon de givre</i> qui se terminerait sans cela à la fin de votre tour de jeu actuel. L'effet persiste alors jusqu'à la fin de votre tour de jeu suivant.
Vous ne pouvez profiter de ces avantages que si vous vous servez de l'orbe. Les magiciens manipulateurs choisissent généralement cette forme de maîtrise, car elle leur permet de prolonger la durée de leurs sorts de contrôle.",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Orbe de tromperie",
  klasses: [magicien],
  description: "",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Tome de coercition",
  klasses: [magicien],
  description: "",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Tome de préparation",
  klasses: [magicien],
  description: "",
  parent_feature: maitrise_foca_arca,
  required: "choice_1"
)
KlassFeature.create(
  name: "Parole inspiratrice",
  klasses: [maitre_guerre],
  description: "",
  required: "required"
)
autorite_naturelle = KlassFeature.create(
  name: "Autorité naturelle",
  klasses: [maitre_guerre],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Présence inspiratrice",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Présence tactique",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Présence ingénieuse",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Présence intrépide",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Présence perspicace",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Présence du tirailleur",
  klasses: [maitre_guerre],
  description: "",
  parent_feature: autorite_naturelle,
  required: "choice_1"
)
KlassFeature.create(
  name: "Chef de troupe",
  klasses: [maitre_guerre],
  description: "",
  required: "choice_2"
)
KlassFeature.create(
  name: "Chef avisé",
  klasses: [maitre_guerre],
  description: "",
  required: "choice_2"
)
KlassFeature.create(
  name: "Chef d'assaut",
  klasses: [maitre_guerre],
  description: "",
  required: "choice_2"
)
KlassFeature.create(
  name: "Maître de guerre archer",
  klasses: [maitre_guerre],
  description: "",
  required: "choice_3"
)
KlassFeature.create(
  name: "Combattant à mains nues",
  klasses: [moine],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Défense sans armure",
  klasses: [moine],
  description: "",
  required: "required"
)
tradition_monastique = KlassFeature.create(
  name: "Tradition monastique",
  klasses: [moine],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Poing de pierre",
  klasses: [moine],
  description: "",
  parent_feature: tradition_monastique,
  required: "choice_1"
)
KlassFeature.create(
  name: "Soufle centré",
  klasses: [moine],
  description: "",
  parent_feature: tradition_monastique,
  required: "choice_1"
)
KlassFeature.create(
  name: "Défi divin",
  klasses: [paladin],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Imposition des mains",
  klasses: [paladin],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Serment ardent",
  klasses: [paladin],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Toucher de la vertu",
  klasses: [paladin],
  description: "",
  required: "choice_1"
)
KlassFeature.create(
  name: "Mot de guérison",
  klasses: [pretre],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Savoir de soigneur",
  klasses: [pretre],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Maître des runes",
  klasses: [pretre_runes],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Runes de préparation",
  klasses: [pretre_runes],
  description: "",
  required: "required"
)
tradition_runique = KlassFeature.create(
  name: "Tradition runique",
  klasses: [pretre_runes],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Marteau de l'ire",
  klasses: [pretre_runes],
  description: "",
  parent_feature: tradition_runique,
  required: "choice_1"
)
KlassFeature.create(
  name: "Parole du défi",
  klasses: [pretre_runes],
  description: "",
  parent_feature: tradition_runique,
  required: "choice_1"
)
discipline_spe = KlassFeature.create(
  name: "Discipline de spécialisation",
  klasses: [psion],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Spécialisation en télékinésie",
  klasses: [psion],
  description: "",
  parent_feature: discipline_spe,
  required: "choice_1"
)
KlassFeature.create(
  name: "Spécialisation en télépathie",
  klasses: [psion],
  description: "",
  parent_feature: discipline_spe,
  required: "choice_1"
)
KlassFeature.create(
  name: "Traque",
  klasses: [rodeur],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Maîtrise des bêtes",
  klasses: [rodeur],
  description: "",
  required: "choice_1"
)
style_combat = KlassFeature.create(
  name: "Style de combat",
  klasses: [rodeur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "choice_1"
)
KlassFeature.create(
  name: "Style de combat à distance",
  klasses: [rodeur],
  description: "",
  parent_feature: style_combat,
  required: "choice_2"
)
KlassFeature.create(
  name: "Style de combat à deux armes",
  klasses: [rodeur],
  description: "",
  parent_feature: style_combat,
  required: "choice_2"
)
KlassFeature.create(
  name: "Style du combat du chasseur",
  klasses: [rodeur],
  description: "",
  parent_feature: style_combat,
  required: "choice_2"
)
KlassFeature.create(
  name: "Style de combat du maraudeur",
  klasses: [rodeur],
  description: "",
  parent_feature: style_combat,
  required: "choice_2"
)
KlassFeature.create(
  name: "Tir de proximité",
  klasses: [rodeur, sorcier],
  description: "",
  required: "choice_3"
)
KlassFeature.create(
  name: "Course d'assaut",
  klasses: [rodeur],
  description: "",
  required: "choice_3"
)
KlassFeature.create(
  name: "Guérison spirituelle",
  klasses: [shaman],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Communication avec les esprits",
  klasses: [shaman],
  description: "",
  required: "required"
)
compagnon = KlassFeature.create(
  name: "Compagnon sprituel",
  klasses: [shaman],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Esprit protecteur",
  klasses: [shaman],
  description: "",
  parent_feature: compagnon,
  required: "choice_1"
)
KlassFeature.create(
  name: "Esprit prédateur",
  klasses: [shaman],
  description: "",
  parent_feature: compagnon,
  required: "choice_1"
)
KlassFeature.create(
  name: "Esprit du guetteur",
  klasses: [shaman],
  description: "",
  parent_feature: compagnon,
  required: "choice_1"
)
KlassFeature.create(
  name: "Esprit du messager des mondes",
  klasses: [shaman],
  description: "",
  parent_feature: compagnon,
  required: "choice_1"
)
KlassFeature.create(
  name: "Décharge occulte",
  klasses: [sorcier],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Déplacement enténébré",
  klasses: [sorcier],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Envoûtement",
  klasses: [sorcier],
  description: "",
  required: "required"
)
pacte_occulte = KlassFeature.create(
  name: "Pacte occulte",
  klasses: [sorcier],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Pacte féerique",
  klasses: [sorcier],
  description: "",
  parent_feature: pacte_occulte,
  required: "choice_1"
)
KlassFeature.create(
  name: "Pacte infernal",
  klasses: [sorcier],
  description: "",
  parent_feature: pacte_occulte,
  required: "choice_1"
)
KlassFeature.create(
  name: "Pacte stellaire",
  klasses: [sorcier],
  description: "",
  parent_feature: pacte_occulte,
  required: "choice_1"
)
KlassFeature.create(
  name: "Pacte des vestiges",
  klasses: [sorcier],
  description: "",
  parent_feature: pacte_occulte,
  required: "choice_1"
)
KlassFeature.create(
  name: "Armure de la foi",
  klasses: [vengeur],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Serment d'inimitié",
  klasses: [vengeur],
  description: "",
  required: "required"
)
censure_vengeur = KlassFeature.create(
  name: "Censure du vengeur",
  klasses: [vengeur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Censure de poursuite",
  klasses: [vengeur],
  description: "",
  parent_feature: censure_vengeur,
  required: "choice_1"
)
KlassFeature.create(
  name: "Censure rétributive",
  klasses: [vengeur],
  description: "",
  parent_feature: censure_vengeur,
  required: "choice_1"
)
KlassFeature.create(
  name: "Censure collective",
  klasses: [vengeur],
  description: "",
  parent_feature: censure_vengeur,
  required: "choice_1"
)
KlassFeature.create(
  name: "Attaque sournoise",
  klasses: [voleur],
  description: "",
  required: "required"
)
KlassFeature.create(
  name: "Frappe de la mante",
  klasses: [voleur],
  description: "",
  required: "required"
)
tactique_roublard = KlassFeature.create(
  name: "Tactique du roublard",
  klasses: [voleur],
  description: "choisissez une aptitude parmi les options suivantes",
  required: "required"
)
KlassFeature.create(
  name: "Brute des bas-fonds",
  klasses: [voleur],
  description: "",
  parent_feature: tactique_roublard,
  required: "choice_1"
)
KlassFeature.create(
  name: "Esthète de l'esquive",
  klasses: [voleur],
  description: "",
  parent_feature: tactique_roublard,
  required: "choice_1"
)
KlassFeature.create(
  name: "Ruffian impitoyable",
  klasses: [voleur],
  description: "",
  parent_feature: tactique_roublard,
  required: "choice_1"
)
KlassFeature.create(
  name: "Furtivité",
  klasses: [voleur],
  description: "",
  parent_feature: tactique_roublard,
  required: "choice_1"
)
KlassFeature.create(
  name: "Armes du voleur",
  klasses: [voleur],
  description: "",
  required: "choice_2"
)
KlassFeature.create(
  name: "Tireur d'élite",
  klasses: [voleur],
  description: "",
  required: "choice_2"
)

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

# password: plop
User.create(name: 'illisae', email: 'eric.le.guellaut@hotmail.fr',  password_digest: '$2a$10$mW18Uf2qvZPfVQW.oQwnEO5pkYX.uQQ2qrQ3mSwetQ8wf8E/Y2gJK')


