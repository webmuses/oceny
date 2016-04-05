class PendingSubmissionSingleSerializer < SubmissionSingleSerializer
  attributes :position, :prev_id, :next_id

  def prev_id
    prev_el ? prev_el.id.to_s : nil
  end

  def next_id
    next_el ? next_el.id.to_s : nil
  end

  def rates
    object.rates.for_user(serialization_options[:current_user])
  end

  private

  def list
    @list ||= object.class.pending.order(:id.asc).to_a
  end

  def next_el
    position ||= 0

    return nil if position + 1 > list.count

    list[position + 1]
  end

  def prev_el
    position ||= 0

    return nil if position - 1 < 0

    list[position - 1]
  end
end
