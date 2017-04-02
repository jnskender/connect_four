class Array
  def all_empty?
    self.all? { |element| element.to_s.empty?}
  end

  def all_same?
    self.all? { |element| element == self[0]}
  end

  def any_empty?
    self.any? { |element| element.empty?}
  end

  def all_full?
    return false if self.empty?
    !any_empty?
  end

  def four_consecutive?
    return false if self.all_empty?
    self.each_with_index do |element, i|
      next if element.empty?
      return true if [self[i],self[i+1], self[i+2], self[i+3]].uniq.length == 1
    end
    false
  end

  def four_empty_elements_remaining?
    return false if self.all_empty?
    result = self.select { |e| e.empty? }
    return true if result.size >= 4
    false
  end

end
