class SubmissionDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def next
    return nil if position + 1 > list.count

    list[position + 1]
  end

  def prev
    return nil if position - 1 < 0

    list[position - 1]
  end

  def position
    list.index{|submission| submission.id == id}
  end

  def list
    @list ||= object.class.pending.to_a
  end
end
