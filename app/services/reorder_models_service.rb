class ReorderModelsService
  def initialize(transaction_guard, moved_object, all_objects)
    @transaction_guard = transaction_guard
    @moved_object = moved_object
    @all_objects = all_objects
  end

  def call(params)
    @transaction_guard.transaction do
      new_order = []

      as_first = params[:position] == 'First'
      after_id = params[:after]
      if after_id
        after_id = after_id[/\/(\d)+\z/, 1].to_i
      end

      if as_first
        new_order << @moved_object
      end

      @all_objects.each do |sl|
        if sl.id != @moved_object.id
          new_order << sl
        end

        if !as_first && after_id && sl.id == after_id
          new_order << @moved_object
        end
      end

      new_order.each_with_index { |sl, idx| sl.update!(position: idx) }
    end
  end
end