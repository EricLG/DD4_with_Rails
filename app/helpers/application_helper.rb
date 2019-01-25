module ApplicationHelper
  def normalize_str(string)
    string.mb_chars.downcase.tr(' ', '_').parameterize
  end

  def display_first_words(text, count = 15)
    text.truncate_words(count, omission: '...') unless text.blank?
  end

  def display_levels(levels, show_alteration = true, kind = nil)
    x = "\u00A0"
    left, right = levels.in_groups(2)
    table = content_tag('table') do
      concat(content_tag('tbody') do
        left.each_with_index do |l, i|
          concat(content_tag('tr') do
            # Left columns
            write_line(l, show_alteration, kind)
            # Right columns
            unless right[i].nil?
              concat(content_tag('td', x, style: 'padding-right:40px'))
              write_line(right[i], show_alteration, kind)
            end
          end)
        end
      end)
    end
    table
  end

  def write_line(item_level, show_alteration = true, kind = nil)
    x = "\u00A0"
    concat(content_tag('td', "Niv. #{item_level.level.to_s.ljust(2, x)}", style: 'padding-right:20px'))
    concat(content_tag('td', "+#{item_level.alteration}", style: 'padding-right:20px')) if show_alteration
    price = kind == 'consumable' ? item_level.cons_price : item_level.price
    concat(content_tag('td', price + ' PO', style: 'text-align: right'))
  end

  def find_flash_class(flash)
    case flash
    when 'notice'
      'bg-info'
    when 'success'
      'bg-success'
    when 'error'
      'bg-danger'
    else
      'bg-primary'
    end
  end

  def current_user_admin?
    @current_user.try(:name).try(:downcase) == 'illisae'
  end

  def current_user_contributor?
    %w[illisae ashera].include? @current_user.try(:name).try(:downcase)
  end

  # Options hash: {:readonly => false}
  def input_text_form(form, attribute, local, options = {})
    input = content_tag('div', class: 'form-group') do
      concat form.label(attribute, local, class: 'col-sm-4 control-label')
      concat(content_tag('div', class: 'col-sm-8') do
        concat form.text_field(attribute, size: 60, class: 'form-control', readonly: options[:readonly])
      end)
    end
    input
  end

  def input_text_field_form(form, attribute, local)
    input = content_tag('div', class: 'form-group') do
      concat form.label(attribute, local, class: 'col-sm-4 control-label')
      concat(content_tag('div', class: 'col-sm-8') do
        concat form.text_area(attribute, size: '60x5', class: 'form-control')
      end)
    end
    input
  end

  # Options hash: {:blank => false, :multiple => false}
  def input_select_form(form, attribute, select_options, local, options = {})
    default_size = options[:size] || 5
    input = content_tag('div', class: 'form-group') do
      concat form.label(attribute, local, class: 'col-sm-4 control-label')
      concat(
        content_tag('div', class: 'col-sm-8') do
          concat(
            form.select(
              attribute,
              select_options,
              { include_blank: options[:blank] },
              multiple: options[:multiple], size: default_size, class: 'form-control', disabled: options[:disabled]
            )
          )
        end
      )
    end
    input
  end

  # options_hash : {add_another: true}
  def submit_text_form(form, options = {})
    submit = content_tag('div', class: 'form-group') do
      concat(content_tag('div', class: 'col-sm-8') do
        concat form.submit(t('common.validate'), name: 'commit', class: 'btn btn-default', id: 'submit-button')
        concat form.submit(t('common.add_another'), name: 'add_another', class: 'btn btn-default') if options[:add_another]
      end)
    end
    submit
  end
end
