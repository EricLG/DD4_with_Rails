module ApplicationHelper

  def display_first_words(text, count = 15)
    text.truncate_words(count, omission: "...") unless text.blank?
  end

  def display_levels(levels, show_alteration = true, kind = nil)
    x =  "\u00A0"
    table = content_tag("table") do
      concat(content_tag("tbody") do
        levels.each do |l|
          concat(content_tag("tr") do
            concat(content_tag("td", "Niv. #{l.level.to_s.ljust(2,x)}", style: "padding-right:20px"))
            concat(content_tag("td", "+#{l.alteration}", style: "padding-right:20px")) if show_alteration
            if kind == "consumable"
              concat(content_tag("td", "#{l.cons_price} PO", style: "text-align: right"))
            else
              concat(content_tag("td", "#{l.price} PO", style: "text-align: right"))
            end
          end)
        end
      end)
    end
    return table
  end

  def find_flash_class(flash)
    case flash
    when "notice"
      return "bg-info"
    when "success"
      return "bg-success"
    when "error"
      return "bg-danger"
    else
      return "bg-primary"
    end
  end

  def is_current_user_admin?
    @current_user.try(:name).try(:downcase) == "illisae"
  end

  def input_text_form(form, attribute, local)
    input = content_tag("div", class: "form-group") do
      concat form.label(attribute, local, :class =>"col-sm-4 control-label")
      concat (content_tag("div", class: "col-sm-8") do
        concat form.text_field(attribute, size: 60, :class => "form-control")
      end)
    end
    return input
  end

  # Options hash: {:blank => false, :multiple => false}
  def input_select_form(form, attribute, sources, method, default_source, local, options = {})
    input = content_tag("div", class: "form-group") do
      concat form.label(attribute, local, :class =>"col-sm-4 control-label")
      concat (content_tag("div", class: "col-sm-8") do
        concat form.select(attribute, options_from_collection_for_select(sources, :id, method, default_source), {include_blank: options[:blank]}, {multiple: options[:multiple], :class => "form-control"})
      end)
    end
    return input
  end

  def submit_text_form(form, options = {})
    submit = content_tag("div", class: "form-group") do
      concat (content_tag("div", class: "col-sm-8") do
        concat form.submit(t("common.validate"), name: "commit", :class => "btn btn-default")
        concat form.submit(t("common.add_another"), name: "add_another", :class => "btn btn-default") if options[:add_another]
      end)
    end
    return submit
  end
end
