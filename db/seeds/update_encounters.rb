# Call with rake db:seed:update_encounters
puts 'Updating encounters'

def find_monsters
  monster_qty_and_name_regex = /^\s{0,2}(\d{0,2})\s{0,2}(.*)\s(\(|soldat|contrôleur)/
  monster_not_found = []
  chosen_monsters = []
  Encounter.all.each do |e|
    next if e.description.nil?

    e.description.split(/(\\r\\n|\r\n)/).each do |monster_line|
      match = monster_line.strip.match(monster_qty_and_name_regex)
      p e.description && next if match.nil?

      monster_qty = match[1].to_i
      monster_qty = monster_qty.zero? ? 1 : monster_qty
      monster_name = match[2]

      monsters_result = Monster.select(:id, :name).where('name ILIKE ?', monster_name).first
      if !monsters_result.nil?
        chosen_monsters << { encounter_id: e.id, monster_id: monsters_result.id, quantity: monster_qty }
      else
        new_name = monster_name.split(' ').map {|w| w.delete_suffix('s')}.join(' ')
        monsters_result = Monster.select(:id, :name).where('name ILIKE ?', new_name).first
        if monsters_result.nil?
          new_monster_name = find_good_name(monster_name)
          monsters_result = Monster.select(:id, :name).where('name ILIKE ?', new_monster_name).first
          if monsters_result.nil?
            monster_not_found << monster_name
            p "Monster #{monster_name} not found, with current name, #{new_name} or #{new_monster_name}. Searches did not found anything."
          else
            chosen_monsters << { encounter_id: e.id, monster_id: monsters_result.id, quantity: monster_qty }
          end
        else
          chosen_monsters << { encounter_id: e.id, monster_id: monsters_result.id, quantity: monster_qty }
        end
      end
    end
  end
  ChosenMonster.create(chosen_monsters)
  p "#{chosen_monsters.size} monstres trouvés sur 2011 théorique"
  p "#{monster_not_found.size} monstres non trouvés :"
  p monster_not_found
end

def find_good_name(monster_name)
  case monster_name
  when 'Doresain le Roi des Goules'
    'Doresain, le Roi des Goules'
  when 'Jarant, Roi des Serpents (naga ténébreux,'
    'naga ténébreux'
  when 'Kazuul'
    'Kazuul, exarque de Démogorgon'
  when 'Sath\'fiss\'ith'
    "Sath'fiss'ith le Tisseur des Cieux"
  when 'Thrarak'
    'Thrarak, exarque de Démogorgon'
  when 'acolyte pourpres', 'acolytes pourpres'
    'Acolyte pourpre (humain)'
  when 'adepte du Soleil Noir zhent'
    'Adepte du soleil noir zhent (humain)'
  when 'adorateurs enchaînés de Démogorgon'
    'Adorateur déchaîné de Démogorgon'
  when 'ailes kir-lanames'
    'Aile kir-lanane'
  when 'anathème yuan-ti'
    'Anathème yuan-ti'
  when 'araignées de pahse'
    'araignée de phase'
  when 'araignées sabres', 'araignées-sabres'
    'araignée-sabres'
  when 'arbalétriers eisk jaat'
    'Arbalétrier du givre eisk jaat'
  when 'archions de feu ardents'
    'Archon de feu ardent'
  when 'archons des tempêtes foudroeyrs', 'archons des tempêtes foudroyers'
    'Archon des tempêtes foudroyeur'
  when 'archons des tempêtes orageux'
    'Archon des tempêtes orageux'
  when 'archons des tempêtes écumeux'
    'Archon des tempêtes écumeux'
  when 'archère méduse'
    'Archère méduse (femelle)'
  when 'aristocrate salamande'
    'Aristocrate salamandre'
  when 'armure animés'
    'Armure animée'
  when 'armures animus infernales'
    'Armure animus infernale'
  when 'aspect d(Orcus'
    "Aspect d'Orcus"
  when 'assassin langue de serpent', 'assassin langue-de-serpent', 'assassins langue-de-serpent'
    'Assassin langue-de-serpent (humain)'
  when 'badilic œil-de-venin', 'basilic œil de venin', 'basilic œil-deèvenin','basilics œil-de venin'
    'Basilic œil-de-venin'
  when 'basilic œil de pierre'
    'Basilic œil-de-pierre'
  when 'blasphémateur duergar', 'blasphémateurs duergar'
    'Blasphémateur duergar (nain)'
  when 'bourreaux maruths'
    'Bourreau maruth'
  when 'bralanis des vents d\'automne'
    "Bralani des vents d'automne"
  when 'bretteur infernaux cambion', 'bretteurs infernaux cambions'
    'Bretteur infernal cambion'
  when 'calcinateur fuligineux'
    'Calcineur fulgineux'
  when 'caudalzairs brise-os'
    'Caudalzair brise-os'
  when 'chantre des bûches éfrit', 'chantres des bûchers éfrits'
    'Chantre des bûchers éfrit'
  when 'chasseur venimécaille homme-lézard'
    'Chasseur venimécaille'
  when 'chasseurs longues-dents'
    'Chasseur longue-dent'
  when 'chauves-souris de feu'
    'Chauve-souris de feu'
  when 'chauves-souris des ombres'
    'Chauve-souris des ombres'
  when 'chavaliers de l\'effroi rakshhasas'
    "Chevalier de l'effroi rakshasa"
  when 'chevalier de la mort drakéïde'
    'Chevalier de la mort (paladin drakéide)'
  when 'chevalier de la mort', 'chevalier de la mort guerrier humain', 'chevalier de la mort humain'
    'Chevalier de la mort (guerrier humain)'
  when 'chevalier sorcier défenseur'
    'Chevalier sorcier défenseur (humain)'
  when 'chevalier sorcier exécuteur'
    'Chevalier sorcier exécuteur (humain)'
  when 'chevalier sorcier éminent'
    'Chevalier sorcier éminent (humain)'
  when 'corbeaux fantômes firbolgs'
    'Corbeau fantôme firbolg'
  when 'courreurs prestelins'
    'Coureur prestelin'
  when 'croc de Yeenoghu gnoll'
    'Croc de Yeenoghu'
  when 'célébrant langue de serpent', 'célébrant langue-de-serpent'
    'Célébrant langue-de-serpent (humain)'
  when 'danseurs de guerre gobelours'
    'Danseur de guerre gobelours'
  when 'diable diantrefosse'
    'Diantrefosse'
  when 'diable flérissant'
    'Diable flétrissant'
  when 'diable gelé', 'diables gelés'
    'Diable gelé (gelugon)'
  when 'diable guerroyeur', 'diable guerroyeurs', 'diables guerroyeurs'
    'Diable guerroyeur (malbranche)'
  when 'diable osseux', 'diables osseux'
    'Diable osseux (osyluth)'
  when 'diables barbus'
    'Diable barbu (barbazu)'
  when 'diables légionnaires décurions', 'décurions diables légionnaires'
    'Diable légionnaire, décurion'
  when 'diables légionnaires vétérans'
    'Diable légionnaire, vétéran'
  when 'diables à chaîne', 'diables à chaînes'
    'Diable à chaînes (kyton)'
  when 'diables à piquants'
    'Diable à piquants (spinagon)'
  when 'drakes des clochers'
    'Drake des clochers'
  when 'défenseurs pétrodactyles'
    'Défenseur poing de pierre'
  when 'démon balor'
    'Balor'
  when 'démon burlgura', 'démons barlguras'
    'Barlgura'
  when 'démon glabrezu'
    'Glabrezu'
  when 'démon goristro', 'démons goristros'
    'Goristro'
  when 'démon hezrous', 'démons hezrous'
    'Hezrou'
  when 'démon immolith', 'démon immolitj'
    'Immolith'
  when 'démon marilith', 'démons marilith'
    'Marilith'
  when 'démon solamith', 'démons solamithes'
    'Solamithe'
  when 'démon évistro', 'démons évistros', 'évistro', 'évistros'
    'Évistro (démon du carnage)'
  when 'démons canoloths'
    'Canoloth'
  when 'démons chasmes'
    'Chasme'
  when 'démons vrocks'
    'Vrock'
  when 'espions clestes genasi'
    'Espion céleste genasi'
  when 'exécuteurs à six doigts'
    'Exécuteur à six doigts (humain)'
  when 'fanatique langue-de-serpent', 'fanatiques langue de serpent', 'fanatiques langue-de-serpent'
    'Fanatique langue-de-serpent (humain)'
  when 'fantassins d\'assaut duergars'
    "Fantassin d'assaut duergar (nain)"
  when 'fantassins diables légionnaires'
    'Diable légionnaire, fantassin'
  when 'fantôme gémissant'
    'Fantôme gémissant (banshee)'
  when 'fauchers d\'âmes sanglotains', 'faucheurs d\'âmes sanglotains'
    "Faucheur d'âmes sanglotain"
  when 'faucheur arcon de fer'
    'Faucheur archon de fer'
  when 'feux follets'
    'Feu follet'
  when 'flagellateur funeste'
    'Flagellateur funeste (humain)'
  when 'fléau démonique gnll', 'fléaux démoniaques gnolls'
    'Fléau démoniaque gnoll'
  when 'fléaux des profondeurs troglodytes'
    'Fléau des profondeurs troglodyte'
  when 'forgeronnier géant de feu'
    'Forgeronnier géant du feu'
  when 'franc tireur kobold'
    'Franc-tireur kobold'
  when 'franc tireur ogres', 'franc-tireur orgre', 'franc-tireur orque'
    'Franc-tireur ogre'
  when 'frondeur kobold', 'frondeurs kobold', 'frondeurs kobolds'
    'Frondeur kobold'
  when 'garde-chiourmes kuo-toas'
    'Garde-chiourne kuo-toa'
  when 'gardes du corps torves'
    'Garde du corps torve'
  when 'gardes duergars'
    'Garde duergar'
  when 'gardien nage'
    'Naga gardien'
  when 'gardien squelette sépulcraux'
    'Gardien squelette sépulcral'
  when 'gardies crochus ettercaps'
    'Gardien crochu ettercap'
  when 'ghaeles de l\'hiver éladrins'
    "Ghaele de l'hiver"
  when 'gnolles suicidaires'
    'Gnoll suicidaire'
  when 'gobelins fendeur de crâne', 'gobelins fendeurs de crânes'
    'Gobelin fendeur de crânes'
  when 'gorgones des tempêtes'
    'Gorgone des tempêtes'
  when 'grifffeurs gnoll'
    'Griffeur gnoll'
  when 'guenaudes des marais'
    'Guenaude des marais'
  when 'guerrier phénixien'
    "Homme d'armes phénixien"
  when 'gurriers azer'
    'Guerrier azer'
  when 'guénaude du trépas'
    'Guenaude du trépas'
  when 'géant des colline', 'géants des collines'
    'Géant des collines'
  when 'géant des pierres graveur de rune'
    'Géant des pierres graveur de runes'
  when 'géant du givre façonneur de glace'
    'Géant du givre faconneur de glace'
  when 'géants des pierres'
    'Géant des pierres'
  when 'hiérophante  nécroprêtre', 'hiérophante nécroprêtre'
    'Hiérophante nécroprêtre (humain)'
  when 'hiérophante de la Vague Écrasante'
    'Hiérophante de la vague écrasante (genasi)'
  when 'homme d\'arme hobgobelin', 'hommes d\'arme hobgobelin', 'hommes d\'armes hobgobelins'
    "Homme d'armes hobgobelin"
  when 'homme d\'arme langue de serpent', 'hommes d\'arme langue de serpent', 'hommes d\'armes langue-de-serpent'
    "Homme d'armes langue-de-serpent (humain)"
  when 'homme d\'arme méduse'
    "Homme d'armes méduse (mâle)"
  when 'homme d\'arme shadar-kai', 'hommes d\'armes shadar-kai'
    "Homme d'armes shadar-kai"
  when 'homme d\'armes gobelours', 'hommes d\'arme gobelours'
    "Hommes d'armes gobelours"
  when 'homme d\'armes méduse'
    "Homme d'armes méduse (mâle)"
  when 'hommes d\'arme drows', 'hommes d\'armes drows'
    "Hommes d'armes drow"
  when 'hommes d\'arme gobelins', 'hommes d\'armes gobelins'
    "Homme d'armes gobelin"
  when 'hommes d\'arme rakshasas', 'hommes d\'armes rakshasas'
    "Homme d'armes rakshasa"
  when 'hommes d\'armes banshrae'
    "Homme d'armes banshrae"
  when 'hommes d\'armes fantomatiques'
    "Homme d'armes fantomatique"
  when 'hommes d\'armes githyankis'
    "Homme d'armes githyanki"
  when 'hommes d\'armes kenku'
    "Homme d'armes kenku"
  when 'hommes d\'armes minotaures'
    "Hommes d'armes minotaure"
  when 'hommes d\'armes orquer', 'hommes d\'armes orques'
    "Hommes d'armes orque"
  when 'hommes d\'armes troglodyte', 'hommes d\'armes troglodytes'
    "Homme d'armes troglodyte"
  when 'hyènes démoniques ricanantes'
    'Hyène démoniaque ricanante'
  when 'hécatondire'
    'Hécatonchire'
  when 'héleur infernal duergar'
    'Héleur infernal duergar'
  when 'hérétiques tieffelons'
    'Hérétique tieffelin'
  when 'incantateur du crépulscule éladrin'
    'Incantateur du crépuscule éladrin'
  when 'infiltrateur flagelleurs mentaux'
    'Infiltrateur flagelleur mental'
  when 'initié de la Vague Écrasante'
    'Initié de la vague écrasante (genasi)'
  when 'initiés langue de serpent'
    'Initié langue-de-serpent (humain)'
  when 'krasses abolethique'
    'Krasse aboléthique'
  when 'krazriths'
    'Kazrith'
  when 'lames hurleuses'
    'Lame hurleuse (humain)'
  when 'laquais humains'
    'Laquais humain'
  when 'liche'
    'Liche (magicien humain)'
  when 'liche, magicien humain'
    'Liche (magicien humain)'
  when 'liche, magicien éladrin'
    'Liche (magicien éladrin)'
  when 'liches'
    'Liche (magicien éladrin)'
  when 'loups artiques'
    'Loup arctique'
  when 'loups garous', 'loups-garous'
    'Loup-garou'
  when 'loups gris'
    'Loup gris'
  when 'mage de guerre zhent'
    'Mage de guerre zhent (humain)'
  when 'mage humain (évolué', 'mage humain maître de la mort'
    'Mage humain'
  when 'mage psychique'
    'Mage psychique githzerai'
  when 'mages marveux'
    'Mage larveux'
  when 'mages venimécailles hommes-lézards'
    'Mage venimécaille'
  when 'magi de feu infernal cambion', 'magi de feu infernal cambions'
    'Magus de feu infernal cambion'
  when 'magicien liche reflet'
    'Liche (magicien éladrin)'
  when 'magnus de feu infernal cambion'
    'Magus de feu infernal cambion'
  when 'mantille de Zéhir méduse', 'mantilles de Zéhir méduses'
    'Mantille de Zéhir méduse (femelle)'
  when 'maraudeur abyssal', 'maraudeurs abyssaux'
    'Maraudeur abyssal (humain)'
  when 'marteleur brise-pierre', 'marteleurs brise-pierre', 'marteleurs brise-pierres'
    'Marteleur brise-pierres'
  when 'mastodonte zombi'
    'Mastodonte zombie'
  when 'matraqueurs orgres'
    'Matraqueur ogre'
  when 'maître d\'arme d\'arme drow', 'maître d\'arme drow', 'maître dr\'amr drow'
    "Maître d'armes drow"
  when 'maître d\'armes maruths', 'maîtres d\'armes maruths'
    "Maître d'armes maruth"
  when 'maître de la horde sahuvage firbolg'
    'Maître de la horde sauvage firbolg'
  when 'mille pattes cavaleurs'
    'Mille-pattes cavaleur'
  when 'moines de la Lune Noire'
    'Moine de la Lune Noire (humain)'
  when 'molosses tombaux'
    'Molosse tombal'
  when 'mussard cyclopes'
    'Musard cyclope'
  when 'nelrazus'
    'Neldrazu'
  when 'noirelames shadar kai'
    'Noirelame shadar-kai'
  when 'nuée de caudalzair'
    'Nuée de caudalzairs'
  when 'nuées d\'araignées filsang'
    "Nuée d'araignées filsang"
  when 'nuées d\'esprits follets'
    "Nuée d'esprit follets ombreux"
  when 'nuées de corbeaux d\'ombre'
    "Nuée de corbeaux d'ombre (sanglotain)"
  when 'nuées de jeunes oxydeurs'
    'Nuée de jeunes oxydeurs'
  when 'nuées de mille-pattes'
    'Nuée de mille-pattes'
  when 'nuées de rats'
    'Nuée de rats'
  when 'nuées de scarabées putréfiants'
    'Nuée de scarabées putréfiants'
  when 'nuées de striges'
    'Nuée de striges'
  when 'nécroprêtre d\'Orcus'
    "Nécroprêtre d'orcus (humain)"
  when 'oiseaux-tonnerre'
    'Oiseau-tonnerre'
  when 'ombres des roches'
    'Ombre des roches'
  when 'ours des caverne'
    'Ours des cavernes'
  when 'philosophe grell'
    'Philisophe grell'
  when 'pillards drakéïdes'
    'Pillard drakéide'
  when 'piège à jet de flammes', 'pièges à filament spectraux'
    'Piège'
  when 'porte crocs', 'porte-croc'
    'Porte-crocs'
  when 'prélat berserker de Démogorgon'
    'Prélat berserker de Démogorgon'
  when 'prétorien diables légionnaires', 'prétoriens diable légionnaires', 'prétoriens diables légionnaires'
    'Diable légionnaire, prétorien'
  when 'pyroflagelleateur'
    'Pyroflagellateur'
  when 'queue de feu salamandre', 'queues de feu salamandre', 'queues-de-feu salamandres'
    'Queue-de-feu salamandre'
  when 'rafale (rocailleuse'
    'Rafale rocailleuse'
  when 'rats-garous'
    'Rat-garou'
  when 'rejetons disloqués de la souffrance (sbire'
    'Rejeton disloqué de la souffrance'
  when 'rejetons disloqués de la souffrance gardiens (sbire'
    'Rejeton disloqué de la souffrance gardien'
  when 'rejetons rouges crachefeux'
    'Rejeton rouge crachefeu'
  when 'rôdeur de nuit oni ('
    'Rôdeur de nuit oni'
  when 'sangliers-garous'
    'Sanglier-garou'
  when 'sauvage minautore'
    'Sauvage minotaure'
  when 'sauvage orgre', 'sauvages orgres'
    'Sauvage ogre'
  when 'seigneur des crâne', 'seigneurs des crânes'
    'Seigneur des crânes'
  when 'seigneur es batailles barghest'
    'Seigneur des batailles barghest'
  when 'seigneur loup garou'
    'Seigneur loup-garou'
  when 'seigneur momie', 'seigneurs momies'
    'Seigneur momie (prêtre humain)'
  when 'seigneur suprême tyrannoeil'
    'Seigneur suprême tyrannœil'
  when 'seigneur vampire'
    'Seigneur vampire (voleur humain)'
  when 'seigneurs des bêtes azers'
    'Seigneur des bêtes azer'
  when 'serpents des nuages couatls'
    'Serpent des nuages couatl'
  when 'slaad bleus', 'slaads bleus'
    'Slaad bleu (slaad griffu)'
  when 'slaad gris dévastateurs'
    'Slaad gris dévastateur'
  when 'slaad gris', 'slaads gris'
    'Slaad gris (slaad de faille)'
  when 'slaad noir', 'slaads noirs'
    'Slaad noir (slaad du néant)'
  when 'slaad rouge', 'slaads rouge', 'slaads rouges'
    'Slaad rouge (slaad de sang)'
  when 'slaad vert'
    'Slaad vert (slaad de malédiction)'
  when 'soldat zhent', 'soldats zhents'
    'Soldat zhent (humain)'
  when 'sombres acolytes de Graz\'zt'
    "Sombre acolyte de Graz'zt (humain)"
  when 'sorcier de bataille habgobelin'
    'Sorcier de bataille hobgobelin'
  when 'squelettes brise-os'
    'Squelette brise-os'
  when 'squelettes d\'esquilles'
    "Squelette d'esquilles"
  when 'sylvanien noire racine'
    'Sylvanien noire-racine'
  when 'thaalds'
    'Thaalud'
  when 'théurge duergar'
    'Théurge duergar (nain)'
  when 'tigres-garous'
    'Tigre-garou'
  when 'titan de feu'
    'Titan du feu'
  when 'titans des pierres'
    'Titan des pierres'
  when 'tourmenteur formorian'
    'Tourmenteur fomorian'
  when 'trancheur brise-pierre'
    'Trancheur brise-pierres'
  when 'traque sang vampirien', 'traque sang vampiriens'
    'Traque-sang vampirien'
  when 'traqueurs astraux'
    'Traqueur astral'
  when 'trolles de guerre'
    'Troll de guerre'
  when 'trolls des glaces'
    'Troll des glaces'
  when 'troufions orques'
    'Trouffion orque'
  when 'tyrannoeil incendiaire', 'tyrannoeil oncendiaire', 'tyrannœil incendiare'
    'Tyrannœil incendiaire'
  when 'tétards slaad'
    'Têtard slaad'
  when 'vampiriens'
    'Charpe-chair vampirien'
  when 'veaux rongebête'
    'Veau rongebête'
  when 'voix kir-lanane'
    'Aile kir-lanane'
  when 'vortex de grain silicieux'
    'Vortex de grain siliceux'
  when 'yeux de Vecna nothics', 'œil de Vecna nothic'
    'Oeil de Vecna nothic'
  when 'yeux de lynx maléficiés yuan-ti', 'yeux de lynx maléficiés yuan-tis'
    'Œil de lynx maléficié yuan-ti'
  when 'âme en peine spadassines', 'âmes-en-peine spadassines'
    'Âme-en-peine spadassine'
  when 'âme-géant spriggants', 'âmes-de-géant spriggans'
    'Âme-de-géant spriggan'
  when 'âme-noire shadar-kai'
    'Ame noire shadar-kai'
  when 'âmes-en-peine vénérables'
    'Âme-en-peine vénérable'
  when 'âmes-en-peine'
    'Âme-en-peine'
  when 'éclaireur duergar'
    'Éclaireur duergar (nain)'
  when 'éclat du chaos prismatique'
    'Éclat prismatique'
  when 'élu de Graz\'zt'
    "Élu de Graz'zt (lamie)"
  when 'élémentaire pyroflagellateur'
    'Pyroflagellateur'
  when 'étrangleurs des cavernes'
    'Étrangleur des cavernes'
  when 'éventreur duergar', 'éventreur duergars'
    'Éventreur duergar'
  when 'éviscérateur abyssaux'
    'Éviscérateur abyssal'
  when 'éviscérateurs brise-pierres'
    'Éviscérateur brise-pierres'
  when 'œil de Grummsh orque'
    'Œil de gruumsh orque'
  end
end

find_monsters

puts 'Updating done'
