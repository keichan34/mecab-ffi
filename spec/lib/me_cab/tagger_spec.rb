require 'spec_helper'

describe MeCab::Tagger do

  subject { MeCab::Tagger.new }

  it "correctly parses a sentence" do
    sentence = "太郎はこの本を二郎を見た女性に渡した。"

    nodes = subject.parseToNode(sentence).all_nodes.map { |e| e.surface }
    expect(nodes).to eq(["太郎はこの本を二郎を見た女性に渡した。", "太郎はこの本を二郎を見た女性に渡した。", "はこの本を二郎を見た女性に渡した。", "この本を二郎を見た女性に渡した。", "本を二郎を見た女性に渡した。", "を二郎を見た女性に渡した。", "二郎を見た女性に渡した。", "郎を見た女性に渡した。", "を見た女性に渡した。", "見た女性に渡した。", "た女性に渡した。", "女性に渡した。", "に渡した。", "渡した。", "た。", "。"])
  end

end
