%module MeCab
%{
require 'rubygems'
require 'ffi'

module MeCab
  extend FFI::Library
  ffi_lib 'mecab'
%}

%include mecab.h
%include version.h

%rename(Node) mecab_node_t;
%rename(Path) mecab_path_t;
%rename(DictionaryInfo) mecab_dictionary_info_t;
%ignore    mecab_model_t;
%ignore    mecab_lattice_t;
%nodefault mecab_path_t;
%nodefault mecab_node_t;

%feature("notabstract") MeCab::Tagger;
%feature("notabstract") MeCab::Lattice;
%feature("notabstract") MeCab::Model;

%immutable mecab_dictionary_info_t::filename;
%immutable mecab_dictionary_info_t::charset;
%immutable mecab_dictionary_info_t::size;
%immutable mecab_dictionary_info_t::lsize;
%immutable mecab_dictionary_info_t::rsize;
%immutable mecab_dictionary_info_t::type;
%immutable mecab_dictionary_info_t::version;
%immutable mecab_dictionary_info_t::next;

%immutable mecab_path_t::rnode;
%immutable mecab_path_t::lnode;
%immutable mecab_path_t::rnext;
%immutable mecab_path_t::lnext;
%immutable mecab_path_t::cost;

%immutable mecab_node_t::prev;
%immutable mecab_node_t::next;
%immutable mecab_node_t::enext;
%immutable mecab_node_t::bnext;
%immutable mecab_node_t::lpath;
%immutable mecab_node_t::rpath;
%immutable mecab_node_t::feature;
%immutable mecab_node_t::length;
%immutable mecab_node_t::rlength;
%immutable mecab_node_t::id;
%immutable mecab_node_t::rcAttr;
%immutable mecab_node_t::lcAttr;
%immutable mecab_node_t::posid;
%immutable mecab_node_t::char_type;
%immutable mecab_node_t::stat;
%immutable mecab_node_t::isbest;
%immutable mecab_node_t::alpha;
%immutable mecab_node_t::beta;
%immutable mecab_node_t::wcost;
%immutable mecab_node_t::cost;
%immutable mecab_node_t::surface;

%{
end
%}
