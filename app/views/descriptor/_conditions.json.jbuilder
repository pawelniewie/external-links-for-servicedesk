json.conditions do
  json.array! conditions.each_pair do |condition, params|
    next if condition == :addon_is_licensed

    if condition == :or
      json.or do
      json.array! params.each_pair do |or_condition, or_params|
          json.condition or_condition
          if or_params.present?
            json.set! :params, or_params
          end
        end
      end
    else
      json.condition condition
      if params.present?
        json.set! :params, params
      end
    end
  end
end