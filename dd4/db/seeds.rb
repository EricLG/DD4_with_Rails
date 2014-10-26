# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Source.create([
  { nom: 'Art de la Guerre 1' },
  { nom: 'Art de la Guerre 2' },
  { nom: 'Eberron' },
  { nom: 'Force de la Nature' },
  { nom: 'Guide du Maitre 1' },
  { nom: 'Guide du maitre 2' },
  { nom: 'Intervention divine' },
  { nom: 'Le Comptoir de l\'aventure 1' },
  { nom: 'le Comptoir de l\'aventure' },
  { nom: 'Manuel du Joueur 1' },
  { nom: 'Manuel du Joueur 2' },
  { nom: 'Manuel du Joueur 3' },
  { nom: 'Manuel des Monstres 1' },
  { nom: 'Manuel des Monstres 2' },
  { nom: 'Manuel des Monstres 3' },
  { nom: 'Royaume Oubliés' },
  { nom: 'Secret des arcanes' }
  ])

GroupeArme.create([
  { nom: 'Arbalètes' },
  { nom: 'Arcs' },
  { nom: 'Armes d\'hast' },
  { nom: 'Bâtons' },
  { nom: 'Fléaux' },
  { nom: 'Frondes' },
  { nom: 'Haches' },
  { nom: 'Lames légères' },
  { nom: 'Lames lourdes' },
  { nom: 'Lances' },
  { nom: 'Mains nues' },
  { nom: 'Marteaux' },
  { nom: 'Masses' },
  { nom: 'Pics' }
  ])

ProprieteArme.create([
  { nom: 'Allonge' },
  { nom: 'Arme de jet légère' },
  { nom: 'Arme de jet lourde' },
  { nom: 'Brutale 1' },
  { nom: 'Brutale 2' },
  { nom: 'Critique amélioré' },
  { nom: 'Défensive' },
  { nom: 'Petite' },
  { nom: 'Polyvalente' },
  { nom: 'Rechargement (libre)' },
  { nom: 'Rechargement (mineure)' },
  { nom: 'Secondaire' }
  ])

CategorieArme.create([
  { nom: 'Armes improvisées de corps à corps' },
  { nom: 'Armes improvisées à distance' },
  { nom: 'Armes simples de corps à corps' },
  { nom: 'Armes simples à distance' },
  { nom: 'Armes de guerre de corps à corps' },
  { nom: 'Armes de guerre à distance' },
  { nom: 'Armes supérieures de corps à corps' },
  { nom: 'Armes supérieures à distance' }
  ])