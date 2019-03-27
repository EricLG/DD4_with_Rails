module CharacterCreationHelper
  include CharactersHelper

  def options_groups_from_collection_for_select(feats, categories, id, name)
    options_groups = ''
    categories.each do |cat|
      options_groups +=
        content_tag('optgroup', label: Feat.human_attribute_name("category.#{cat}")) do
          options_from_collection_for_select(feats[cat], id, name)
        end
    end
    options_groups.html_safe
  end
end
