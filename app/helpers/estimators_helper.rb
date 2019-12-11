module EstimatorsHelper

  def default_value(field, estimator)
    line = estimator.lines.find_by(field_estimator_id: field.id)
    if line.present?
      line.value
    else
      field.default_value.to_i
    end
  end

  #TODO: переписать !!!!
  def default_value_check(field, estimator, val)
    line = estimator.lines.find_by(field_estimator_id: field.id)
    if line.present?
     'checked' if (line.value == "#{val}")
    else
      'checked' unless val
    end
  end

  def default_value_check_group(field, estimator, val)
    line = estimator.lines.find_by(field_estimator_id: field.id)
    if line.present?
     'checked' if (line.value == "#{val}")
    else
      'checked' if val
    end
  end

  def price_format(value)
    "$#{'%.2f' % value}"
  rescue
    0.00
  end

  def number_format(value)
    "#{'%.2f' % (value || 0)}"
  end


end
