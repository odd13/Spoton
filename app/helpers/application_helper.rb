module ApplicationHelper
  def has_flash?
    %w(success error alert notice undo).any? { |k| flash[k.to_sym].present? }
  end
end
