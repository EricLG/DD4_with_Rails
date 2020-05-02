module FeatsHelper
  def build_select_options_with_optgroup(collection, default_value, label, blank_label = false)
    blank_options = blank_label ? options_for_select([[blank_label, '']]) : ''
    content_tag('optgroup', label: label) do
      if collection.is_a? Array
        blank_options + options_for_select(collection, default_value)
      else
        blank_options + options_from_collection_for_select(collection, :id, :name, default_value)
      end
    end
  end
end
