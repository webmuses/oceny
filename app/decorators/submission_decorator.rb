class SubmissionDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def average_rate
    @rates = object.rates.map(&:value)
    if @rates.present?
      @rates.reduce(0.0, :+) / @rates.count
    else
      0.0
    end
  end

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
    @list ||= object.class.order(:id.asc).to_a
  end
end
