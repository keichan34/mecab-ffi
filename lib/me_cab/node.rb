require 'active_support'
require 'active_support/core_ext/object/blank'

class MeCab::Node
  def initialize(ptr)
    raise ArgumentError.new('Null pointer.') if ptr.pointer.address == 0

    @node = ptr
  end

  def prev
    return nil if @node[:prev].pointer.address == 0

    self.class.new @node[:prev]
  end

  def next
    return nil if @node[:next].pointer.address == 0

    self.class.new @node[:next]
  end

  def surface
    @node[:surface].force_encoding(Encoding::UTF_8)
  end

  def feature
    @node[:feature].force_encoding(Encoding::UTF_8)
  end

  FEATURE_MAP = [
    :type,
    :subtype1,
    :subtype2,
    :subtype3,
    :conjtype,
    :conjugation,
    :basic,
    :ruby,
    :pronounce
  ].freeze
  # Format of feature:
  # 0 品詞, 1 品詞細分類1, 2 品詞細分類2, 3 品詞細分類3, 4 活用形, 5 活用型, 6 原形, 7 読み, 8 発音
  # type, subtype1, subtype2, subtype3, conjtype, conjugation, basic, ruby, pronounce

  def inspect
    "#<MeCab::Node surface='#{ surface }' feature=#{ feature_with_rubify }>"
  end

  def feature_with_rubify
    @features ||= feature.split ','

    i = -1
    Hash[FEATURE_MAP.map { |e| i += 1; [e, @features[i]] }]
  end

  def all_nodes
    n = self
    nodes = []
    while n do
      nodes << n unless n.surface.blank?
      n = n.next
    end
    nodes
  end
end
