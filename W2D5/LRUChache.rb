class LRUCache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include(el)
      @cache.delete(el)
      @cache << el
    elsif self.count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
  end

  private

end

if __FILE__ == $PROGRAM_NAME

end
