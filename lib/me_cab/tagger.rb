class MeCab::Tagger
  def initialize
    @mecab = MeCabLib.mecab_new2 ''
    model = MeCabLib.mecab_model_new 0, ''
    @underlying_tagger = MeCabLib.mecab_model_new_tagger model
  end

  def parseToNode(string)
    node = MeCabLib.mecab_sparse_tonode @mecab, string

    MeCab::Node.new node
  end
end
