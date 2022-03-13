# frozen_string_literal: true

module ApplicationHelper
  def current_user
    super || ::Users::Guest.new
  end

  def dom_id_for_records(*records, prefix: nil)
    records.compact.map do |r|
      dom_id(r, prefix)
    end.join('_')
  end
end
