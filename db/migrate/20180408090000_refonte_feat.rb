class RefonteFeat < ActiveRecord::Migration[4.2]

  def change

    # Ajout de colonnes sur Feat
    add_column :feats, :prerequisites, :string
    add_column :feats, :only_eberron, :boolean, default: false
    add_column :feats, :only_ro, :boolean, default: false
    add_column :feats, :divine_channel, :boolean, default: false
    add_column :feats, :required_abilities, :string
    add_index :feats, :only_eberron
    add_index :feats, :only_ro
    add_index :feats, :divine_channel

    # Renommage des tables de jointures
    rename_table :pr_races_for_feat, :feats_pr_races
    rename_table :pr_klasses_for_feat, :feats_pr_klasses
    rename_table :pr_features_for_feat, :feats_pr_features

  end
end
