class ReorderModelsService < BottledService

  att :transaction_guard, Class
  att :moved_object
  att :all_objects, Array
  att :params, ActionController::Parameters

  def call
    transaction_guard.transaction do
      new_order = []

      as_first = params[:position] == 'First'
      after_id = params[:after]
      if after_id
        after_id = after_id[/\/(\d)+\z/, 1].to_i
      end

      if as_first
        new_order << moved_object
      end

      all_objects.each do |sl|
        if sl.id != moved_object.id
          new_order << sl
        end

        if !as_first && after_id && sl.id == after_id
          new_order << moved_object
        end
      end

      new_order.each_with_index { |sl, idx| sl.update!(position: idx) }
    end

    yield if block_given?
  end
end