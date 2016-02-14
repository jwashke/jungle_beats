require_relative 'linked_list'
class JungleBeats
  def initialize(beats)
    @list = LinkedList.new
    @list.append(beats)
    `say -r 500 -v Boing #{@list.all}`
  end

  def append(beats)
    @list.append(beats)
  end

  def prepend(beats)
    @list.prepend(beats)
  end

  def all
    `say -r 500 -v Boing #{@list.all}`
  end

  def insert(position, beats)
    @list.insert(position, beats)
  end

  def include?(beat)
    @list.include?(beat)
  end

  def pop(number_to_pop)
    @list.pop(number_to_pop)
  end

  def count
    @list.count
  end
end
