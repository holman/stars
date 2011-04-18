class String
  # Poor man's constantize
  def constantize
    Stars.const_get(to_s.capitalize)
  end
end
