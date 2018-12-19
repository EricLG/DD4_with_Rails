module FeatsHelper
  def build_feats_link(category)
    case category
    when 'heroics'
      heroics_feats_path
    when 'parangonics'
      parangonics_feats_path
    when 'epics'
      epics_feats_path
    end
  end
end
