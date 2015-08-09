module ConsumablesHelper

  def kind_options
    Rails.application.config_for(:dungeons)["consumable_kind"].map{ |k| [t("consumables.kind.#{k}"), k]}
  end
end
