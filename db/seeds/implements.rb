puts "Seeding implements to DB."

shield = ImplementProperty.create({ name: 'Bouclier', description: "Chaque fois que vous touchez au moins une cible avec un pouvoir d'attaque utilisant un focalsieur bouclier, vous bénéficiez d'un bonus de +1 à la CA et en Réflexes jusqu'au début de votre tour de jeu suivant." })
critical = ImplementProperty.create({ name: 'Critique renforcé', description: "Lorsque vous réussissez un coup critique avec un focaliseur à critique renforcé, l'attaque inflige 1d10 dégâts supplémentaires. Les dégâts supplémentaires passent à 2d1O au niveau 11 et à 3d10 au niveau 21." })
acide = ImplementProperty.create({ name: 'Énergétique (acide)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
electricity = ImplementProperty.create({ name: 'Énergétique (électricité)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
fire = ImplementProperty.create({ name: 'Énergétique (feu)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
force = ImplementProperty.create({ name: 'Énergétique (force)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
ice = ImplementProperty.create({ name: 'Énergétique (froid)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
necro = ImplementProperty.create({ name: 'Énergétique (nécrotique)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
psychic = ImplementProperty.create({ name: 'Énergétique (psychique)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
holy = ImplementProperty.create({ name: 'Énergétique (radiant)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
thunder = ImplementProperty.create({ name: 'Énergétique (tonnerre)', description: "Lorsque vous utilisez un pouvoir d'attaque par l'intermédiaire d”un focaliseur énergétique, vous bénéficiez d'un bonus de +2 aux jets de dégâts si le pouvoir s'accompagne du mot-clé correspondant au type de dégâts du focaliseur. Ce bonus passe à +3 au niveau 11 et à +4 au niveau 21." })
implacable = ImplementProperty.create({ name: 'Implacable', description: "Vous bénéficiez d`un bonus de +1 aux jets d'attaque contre la Vigueur quand vous attaquez avec un focaliseur implacable." })
infallible = ImplementProperty.create({ name: 'Infaillible', description: "Vous bénéficiez d'un bonus de +1 aux jets d'attaque contre les Réflexes quand vous attaquez avec un focaliseur infaillible." })
irresistible = ImplementProperty.create({ name: 'Irrésistible', description: "Vous bénéficiez d'un bonus de +1 aux jets d”attaque contre la Volonté quand vous attaquez avec un focaliseur irrésistible." })
distant = ImplementProperty.create({ name: 'Lointain', description: "La portée de vos pouvoirs d'attaque à distance et de zone augmente de 2 quand ils sont utilisés par Fintermédiaire d'un focaliseur lointain." })
deadly = ImplementProperty.create({ name: 'Meurtrier', description: "Vous bénéficiez d'un bonus de +1 aux jets de dégâts effectués avec un focaliseur meurtrier. Ce bonus passe à +2 au niveau 11 et +3 au niveau 21." })
carrier = ImplementProperty.create({ name: 'Porteur', description: "Chaque fois que vous tirez, poussez ou faites glisser une cible avec un pouvoir d'attaque utilisant un focaliseur porteur, la distance du déplacement forcé augmente de 1 case." })
sharp = ImplementProperty.create({ name: 'Précis', description: "Vous bénéficiez d'un bonus de +1 aux jets d'attaque effectués avec un focaliseur précis." })

baguettes   =  ImplementGroup.find_by_name("Baguettes")
batons_i    =  ImplementGroup.find_by_name("Bâtons")
orbes       =  ImplementGroup.find_by_name("Orbes")
sceptres    =  ImplementGroup.find_by_name("Sceptres")
symboles    =  ImplementGroup.find_by_name("Symboles sacrés")
tomes       =  ImplementGroup.find_by_name("Tomes")
totems      =  ImplementGroup.find_by_name("Totems")
focus_ki    =  ImplementGroup.find_by_name("Focus ki")

Implement.create([
    { name: 'Baguette', superior: false, weight: '0', price: '7', implement_group: baguettes, implement_properties: [] },
    { name: 'Baguette de cendres', superior: true, weight: '-', price: '18', implement_group: baguettes, implement_properties: [critical, fire] },
    { name: 'Baguette de dent draconique', superior: true, weight: '-', price: '18', implement_group: baguettes, implement_properties: [infallible, deadly] },
    { name: 'Baguette de sorbier', superior: true, weight: '-', price: '15', implement_group: baguettes, implement_properties: [electricity, distant] },
    { name: 'Baguette précise', superior: true, weight: '-', price: '20', implement_group: baguettes, implement_properties: [sharp] },
    { name: 'Bâton', superior: false, weight: '2', price: '5', implement_group: batons_i, implement_properties: [] },
    { name: 'Bâton de perversion mentale', superior: true, weight: '2', price: '16', implement_group: batons_i, implement_properties: [psychic, distant] },
    { name: 'Bâton de vif-sorbier', superior: true, weight: '2', price: '15', implement_group: batons_i, implement_properties: [thunder, carrier] },
    { name: 'Bâton gardien', superior: true, weight: '2', price: '13', implement_group: batons_i, implement_properties: [shield, force] },
    { name: 'Bâton précis', superior: true, weight: '2', price: '20', implement_group: batons_i, implement_properties: [sharp] },
    { name: 'Orbe', superior: false, weight: '1', price: '5', implement_group: orbes, implement_properties: [] },
    { name: 'Orbe de cristal', superior: true, weight: '1', price: '27', implement_group: orbes, implement_properties: [psychic, irresistible] },
    { name: 'Orbe de nephrite', superior: true, weight: '1', price: '27', implement_group: orbes, implement_properties: [acide, implacable] },
    { name: 'Orbe pétrifié', superior: true, weight: '1', price: '25', implement_group: orbes, implement_properties: [force, carrier] },
    { name: 'Orbe précise', superior: true, weight: '1', price: '30', implement_group: orbes, implement_properties: [sharp] },
    { name: 'Sceptre', superior: false, weight: '1', price: '15', implement_group: sceptres, implement_properties: [] },
    { name: 'Sceptre de frêne', superior: true, weight: '1', price: '22', implement_group: sceptres, implement_properties: [fire, infallible] },
    { name: 'Sceptre de mortesquille', superior: true, weight: '1', price: '22', implement_group: sceptres, implement_properties: [necro, irresistible] },
    { name: 'Sceptre du défi', superior: true, weight: '1', price: '18', implement_group: sceptres, implement_properties: [shield, holy] },
    { name: 'Sceptre précis', superior: true, weight: '1', price: '25', implement_group: sceptres, implement_properties: [sharp] },
    { name: 'Symbole sacré', superior: false, weight: '0,5', price: '10', implement_group: symboles, implement_properties: [] },
    { name: 'Symbole astral', superior: true, weight: '0,5', price: '18', implement_group: symboles, implement_properties: [holy, distant] },
    { name: 'Symbole de garde', superior: true, weight: '0,5', price: '21', implement_group: symboles, implement_properties: [shield, implacable] },
    { name: 'Symbole du courroux', superior: true, weight: '0,5', price: '23', implement_group: symboles, implement_properties: [critical, irresistible] },
    { name: 'Symbole précis', superior: true, weight: '0,5', price: '25', implement_group: symboles, implement_properties: [sharp] },
    { name: 'Tome', superior: false, weight: '1,5', price: '10', implement_group: tomes, implement_properties: [] },
    { name: 'Tome de l\'écho', superior: true, weight: '1,5', price: '15', implement_group: tomes, implement_properties: [infallible, distant] },
    { name: 'Tome interdit', superior: true, weight: '1,5', price: '15', implement_group: tomes, implement_properties: [deadly, implacable] },
    { name: 'Tome innommable', superior: true, weight: '1,5', price: '15', implement_group: tomes, implement_properties: [critical, irresistible] },
    { name: 'Totem', superior: false, weight: '1', price: '12', implement_group: totems, implement_properties: [] },
    { name: 'Totem de vision lointaine', superior: false, weight: '1', price: '14', implement_group: totems, implement_properties: [distant, deadly] },
    { name: 'Totem des tempêtes', superior: false, weight: '1', price: '18', implement_group: totems, implement_properties: [thunder, implacable] },
    { name: 'Totem glacé', superior: false, weight: '1', price: '15', implement_group: totems, implement_properties: [critical, ice] },
    { name: 'Totem précis', superior: false, weight: '1', price: '20', implement_group: totems, implement_properties: [sharp] }
])
puts "Seeding done"
