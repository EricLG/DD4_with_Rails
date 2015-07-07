module ApplicationHelper

  def display_first_words(text, count = 15)
    text.truncate_words(count, omission: "...") unless text.blank?
  end

  def display_levels(levels, show_alteration = true)
    x =  "\u00A0"
    table = content_tag("table") do
      concat(content_tag("tbody") do
        levels.each do |l|
          concat(content_tag("tr") do
            concat(content_tag("td", "Niv. #{l.level.to_s.ljust(2,x)}", style: "padding-right:20px"))
            concat(content_tag("td", "+#{l.alteration}", style: "padding-right:20px")) if show_alteration
            concat(content_tag("td", "#{l.price} PO", style: "text-align: right"))
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
end
