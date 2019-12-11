class LineEstimator < ApplicationRecord
  belongs_to :field_estimator
  belongs_to :estimator
  belongs_to :task, optional: true
  before_save :calc_total
  after_save :checked_delivered_quota

  def checked_delivered_quota
    estimator.update(status_work: 'work assigned') if estimator.lines.where(task_id: nil).empty?
  end

  def checked_completed_quota
    estimator.update(status_work: 'complete') unless estimator.lines.map { |l| l.task&.done_confirm? }.include? false
  end

  def calc_total
    if self.field_estimator.type_field.match? /text|group/
      self.astra_total = 0.00
      self.trade_total = 0.00
    else
      self.astra_total = value_calc.to_d * astra_price.to_d
      self.trade_total = value_calc.to_d * trade_price.to_d
    end
  end

  def value_calc
    v = value
    if v.present?
      case v
      when 'true'
        v = 1.00
      when 'false'
        v = 0.00
      else
        v = value.to_d
      end
    else
      v = field_estimator.default_value
    end
    option_calc(v)
  end

  # TODO rebase !!!!!!!
  def option_calc(v)
    begin
      option = field_estimator.option
      percent = (option["calculation"] == "plus_type")
      number = option["plus_value"]
      if number.present?
        if percent
          only = (option["calculation"] == "plus_only")
          if only
            if field_estimator.depend.present?
              option2 = field_estimator.depend.option
              v2 = v
              percent2 = (option2["calculation"] == "plus_type")
              number2 = option2["plus_value"]
              value_only2 = (option2["calculation"] == 'value_only')
              #v = field_estimator.depend.value_calc
              if number2.present?
                if percent2
                  v2 = v2 + (v2 * number2.to_d / 100)
                else
                  if value_only2
                    v2 = number2.to_d
                  else
                    v2 = v + number2.to_d
                  end
                end
                v2 * number.to_d / 100
              end
            else
              v * number.to_d / 100

            end
          else
            if field_estimator.depend.present?
            option2 = field_estimator.depend.option
            if (option2["calculation"] == "add_each_to_addict").present?
              line = estimator.lines.find_by(field_estimator_id: field_estimator.depend.id)
              v2 = v
              percent2 = (option2["calculation"] == "plus_type")
              number2 = option2["plus_value"]
              value_only2 = (option2["calculation"] == 'value_only')
              vv = v + (line.value_calc*number2.to_d)
              vv + (v * number.to_d / 100)
            end
            else
              v + (v * number.to_d / 100)
            end
          end
        else
          if v == 0
            0
          else
            if option["calculation"] == "add_each_to_addict"
              v
            elsif option["calculation"] == "percent_only"
              number = option["plus_value"]
              v * number.to_d / 100
            else
              value_only = (option["calculation"] == 'value_only')
              if value_only
                number.to_d
              else
                v + number.to_d
              end
            end
          end
        end
      else
        if field_estimator.depend.present?
            option = field_estimator.depend.option
            percent = (option["calculation"] == "plus_type")
            number = option["plus_value"]
            value_only = (option["calculation"] == 'value_only')
            #v = field_estimator.depend.value_calc
            if number.present?
              if percent
                if field_estimator.depend.depend.present?
                  option2 = field_estimator.depend.depend.option
                  if (option2["calculation"] == "add_each_to_addict").present?
                    line = estimator.lines.find_by(field_estimator_id: field_estimator.depend.depend.id)
                    v2 = v
                    percent2 = (option2["calculation"] == "plus_type")
                    number2 = option2["plus_value"]
                    value_only2 = (option2["calculation"] == 'value_only')
                    vv = v + (line.value_calc*number2.to_d)
                    vv + (v * number.to_d / 100)
                  end
                else
                  v + (v * number.to_d / 100)
                end
              else
                if value_only
                  number.to_d
                else
                  v + number.to_d
                end
              end
            else
              v
            end
        else
          v
        end
      end
    rescue
      v
    end
  end

  def delivered?
    self.task.present?
  end

  def name_scope
    field_estimator.name_scope
  end

  def astra_price
    field_estimator.astra_price
  end

  def trade_price
    field_estimator.trade_price
  end

end
