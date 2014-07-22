
require 'rubygems'
require 'ffi'

module MeCab
  extend FFI::Library
  ffi_lib 'mecab'
  class MecabDictionaryInfoT < FFI::Struct; end
  class MecabNodeT < FFI::Struct; end
  class MecabPathT < FFI::Struct; end
  class MecabDictionaryInfoT < FFI::Struct
    layout(
           :filename, :pointer,
           :charset, :pointer,
           :size, :uint,
           :type, :int,
           :lsize, :uint,
           :rsize, :uint,
           :version, :ushort,
           :next, MecabDictionaryInfoT.ptr
    )
    def filename=(str)
      @filename = FFI::MemoryPointer.from_string(str)
      self[:filename] = @filename
    end
    def filename
      @filename.get_string(0)
    end
    def charset=(str)
      @charset = FFI::MemoryPointer.from_string(str)
      self[:charset] = @charset
    end
    def charset
      @charset.get_string(0)
    end

  end
  class MecabPathT < FFI::Struct
    layout(
           :rnode, MecabNodeT.ptr,
           :rnext, MecabPathT.ptr,
           :lnode, MecabNodeT.ptr,
           :lnext, MecabPathT.ptr,
           :cost, :int,
           :prob, :float
    )
  end
  class MecabNodeT < FFI::Struct
    layout(
           :prev, MecabNodeT.ptr,
           :next, MecabNodeT.ptr,
           :enext, MecabNodeT.ptr,
           :bnext, MecabNodeT.ptr,
           :rpath, MecabPathT.ptr,
           :lpath, MecabPathT.ptr,
           :surface, :pointer,
           :feature, :pointer,
           :id, :uint,
           :length, :ushort,
           :rlength, :ushort,
           :rcAttr, :ushort,
           :lcAttr, :ushort,
           :posid, :ushort,
           :char_type, :uchar,
           :stat, :uchar,
           :isbest, :uchar,
           :alpha, :float,
           :beta, :float,
           :prob, :float,
           :wcost, :short,
           :cost, :long
    )
    def surface=(str)
      @surface = FFI::MemoryPointer.from_string(str)
      self[:surface] = @surface
    end
    def surface
      @surface.get_string(0)
    end
    def feature=(str)
      @feature = FFI::MemoryPointer.from_string(str)
      self[:feature] = @feature
    end
    def feature
      @feature.get_string(0)
    end

  end
  MECAB_NOR_NODE = 0
  MECAB_UNK_NODE = 1
  MECAB_BOS_NODE = 2
  MECAB_EOS_NODE = 3
  MECAB_EON_NODE = 4
  enum [
    :nor_node, 0,
    :unk_node, 1,
    :bos_node, 2,
    :eos_node, 3,
    :eon_node, 4,
  ]

  MECAB_SYS_DIC = 0
  MECAB_USR_DIC = 1
  MECAB_UNK_DIC = 2
  enum [
    :sys_dic, 0,
    :usr_dic, 1,
    :unk_dic, 2,
  ]

  MECAB_ONE_BEST = 1
  MECAB_NBEST = 2
  MECAB_PARTIAL = 4
  MECAB_MARGINAL_PROB = 8
  MECAB_ALTERNATIVE = 16
  MECAB_ALL_MORPHS = 32
  MECAB_ALLOCATE_SENTENCE = 64
  enum [
    :one_best, 1,
    :nbest, 2,
    :partial, 4,
    :marginal_prob, 8,
    :alternative, 16,
    :all_morphs, 32,
    :allocate_sentence, 64,
  ]

  MECAB_ANY_BOUNDARY = 0
  MECAB_TOKEN_BOUNDARY = 1
  MECAB_INSIDE_TOKEN = 2
  enum [
    :any_boundary, 0,
    :token_boundary, 1,
    :inside_token, 2,
  ]

  attach_function :mecab_new, :mecab_new, [ :int, :pointer ], :pointer
  attach_function :mecab_new2, :mecab_new2, [ :string ], :pointer
  attach_function :mecab_version, :mecab_version, [  ], :string
  attach_function :mecab_strerror, :mecab_strerror, [ :pointer ], :string
  attach_function :mecab_destroy, :mecab_destroy, [ :pointer ], :void
  attach_function :mecab_get_partial, :mecab_get_partial, [ :pointer ], :int
  attach_function :mecab_set_partial, :mecab_set_partial, [ :pointer, :int ], :void
  attach_function :mecab_get_theta, :mecab_get_theta, [ :pointer ], :float
  attach_function :mecab_set_theta, :mecab_set_theta, [ :pointer, :float ], :void
  attach_function :mecab_get_lattice_level, :mecab_get_lattice_level, [ :pointer ], :int
  attach_function :mecab_set_lattice_level, :mecab_set_lattice_level, [ :pointer, :int ], :void
  attach_function :mecab_get_all_morphs, :mecab_get_all_morphs, [ :pointer ], :int
  attach_function :mecab_set_all_morphs, :mecab_set_all_morphs, [ :pointer, :int ], :void
  attach_function :mecab_parse_lattice, :mecab_parse_lattice, [ :pointer, :pointer ], :int
  attach_function :mecab_sparse_tostr, :mecab_sparse_tostr, [ :pointer, :string ], :string
  attach_function :mecab_sparse_tostr2, :mecab_sparse_tostr2, [ :pointer, :string, :size_t ], :string
  attach_function :mecab_sparse_tostr3, :mecab_sparse_tostr3, [ :pointer, :string, :size_t, :string, :size_t ], :string
  attach_function :mecab_sparse_tonode, :mecab_sparse_tonode, [ :pointer, :string ], :pointer
  attach_function :mecab_sparse_tonode2, :mecab_sparse_tonode2, [ :pointer, :string, :size_t ], :pointer
  attach_function :mecab_nbest_sparse_tostr, :mecab_nbest_sparse_tostr, [ :pointer, :size_t, :string ], :string
  attach_function :mecab_nbest_sparse_tostr2, :mecab_nbest_sparse_tostr2, [ :pointer, :size_t, :string, :size_t ], :string
  attach_function :mecab_nbest_sparse_tostr3, :mecab_nbest_sparse_tostr3, [ :pointer, :size_t, :string, :size_t, :string, :size_t ], :string
  attach_function :mecab_nbest_init, :mecab_nbest_init, [ :pointer, :string ], :int
  attach_function :mecab_nbest_init2, :mecab_nbest_init2, [ :pointer, :string, :size_t ], :int
  attach_function :mecab_nbest_next_tostr, :mecab_nbest_next_tostr, [ :pointer ], :string
  attach_function :mecab_nbest_next_tostr2, :mecab_nbest_next_tostr2, [ :pointer, :string, :size_t ], :string
  attach_function :mecab_nbest_next_tonode, :mecab_nbest_next_tonode, [ :pointer ], :pointer
  attach_function :mecab_format_node, :mecab_format_node, [ :pointer, :pointer ], :string
  attach_function :mecab_dictionary_info, :mecab_dictionary_info, [ :pointer ], :pointer
  attach_function :mecab_lattice_new, :mecab_lattice_new, [  ], :pointer
  attach_function :mecab_lattice_destroy, :mecab_lattice_destroy, [ :pointer ], :void
  attach_function :mecab_lattice_clear, :mecab_lattice_clear, [ :pointer ], :void
  attach_function :mecab_lattice_is_available, :mecab_lattice_is_available, [ :pointer ], :int
  attach_function :mecab_lattice_get_bos_node, :mecab_lattice_get_bos_node, [ :pointer ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_eos_node, :mecab_lattice_get_eos_node, [ :pointer ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_all_begin_nodes, :mecab_lattice_get_all_begin_nodes, [ :pointer ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_all_end_nodes, :mecab_lattice_get_all_end_nodes, [ :pointer ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_begin_nodes, :mecab_lattice_get_begin_nodes, [ :pointer, :size_t ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_end_nodes, :mecab_lattice_get_end_nodes, [ :pointer, :size_t ], MecabNodeT.ptr
  attach_function :mecab_lattice_get_sentence, :mecab_lattice_get_sentence, [ :pointer ], :string
  attach_function :mecab_lattice_set_sentence, :mecab_lattice_set_sentence, [ :pointer, :string ], :void
  attach_function :mecab_lattice_set_sentence2, :mecab_lattice_set_sentence2, [ :pointer, :string, :size_t ], :void
  attach_function :mecab_lattice_get_size, :mecab_lattice_get_size, [ :pointer ], :size_t
  attach_function :mecab_lattice_get_z, :mecab_lattice_get_z, [ :pointer ], :double
  attach_function :mecab_lattice_set_z, :mecab_lattice_set_z, [ :pointer, :double ], :void
  attach_function :mecab_lattice_get_theta, :mecab_lattice_get_theta, [ :pointer ], :double
  attach_function :mecab_lattice_set_theta, :mecab_lattice_set_theta, [ :pointer, :double ], :void
  attach_function :mecab_lattice_next, :mecab_lattice_next, [ :pointer ], :int
  attach_function :mecab_lattice_get_request_type, :mecab_lattice_get_request_type, [ :pointer ], :int
  attach_function :mecab_lattice_has_request_type, :mecab_lattice_has_request_type, [ :pointer, :int ], :int
  attach_function :mecab_lattice_set_request_type, :mecab_lattice_set_request_type, [ :pointer, :int ], :void
  attach_function :mecab_lattice_add_request_type, :mecab_lattice_add_request_type, [ :pointer, :int ], :void
  attach_function :mecab_lattice_remove_request_type, :mecab_lattice_remove_request_type, [ :pointer, :int ], :void
  attach_function :mecab_lattice_new_node, :mecab_lattice_new_node, [ :pointer ], MecabNodeT.ptr
  attach_function :mecab_lattice_tostr, :mecab_lattice_tostr, [ :pointer ], :string
  attach_function :mecab_lattice_tostr2, :mecab_lattice_tostr2, [ :pointer, :string, :size_t ], :string
  attach_function :mecab_lattice_nbest_tostr, :mecab_lattice_nbest_tostr, [ :pointer, :size_t ], :string
  attach_function :mecab_lattice_nbest_tostr2, :mecab_lattice_nbest_tostr2, [ :pointer, :size_t, :string, :size_t ], :string
  attach_function :mecab_lattice_has_constraint, :mecab_lattice_has_constraint, [ :pointer ], :int
  attach_function :mecab_lattice_get_boundary_constraint, :mecab_lattice_get_boundary_constraint, [ :pointer, :size_t ], :int
  attach_function :mecab_lattice_get_feature_constraint, :mecab_lattice_get_feature_constraint, [ :pointer, :size_t ], :string
  attach_function :mecab_lattice_set_boundary_constraint, :mecab_lattice_set_boundary_constraint, [ :pointer, :size_t, :int ], :void
  attach_function :mecab_lattice_set_feature_constraint, :mecab_lattice_set_feature_constraint, [ :pointer, :size_t, :size_t, :string ], :void
  attach_function :mecab_lattice_set_result, :mecab_lattice_set_result, [ :pointer, :string ], :void
  attach_function :mecab_lattice_strerror, :mecab_lattice_strerror, [ :pointer ], :string
  attach_function :mecab_model_new, :mecab_model_new, [ :int, :pointer ], :pointer
  attach_function :mecab_model_new2, :mecab_model_new2, [ :string ], :pointer
  attach_function :mecab_model_destroy, :mecab_model_destroy, [ :pointer ], :void
  attach_function :mecab_model_new_tagger, :mecab_model_new_tagger, [ :pointer ], :pointer
  attach_function :mecab_model_new_lattice, :mecab_model_new_lattice, [ :pointer ], :pointer
  attach_function :mecab_model_swap, :mecab_model_swap, [ :pointer, :pointer ], :int
  attach_function :mecab_model_dictionary_info, :mecab_model_dictionary_info, [ :pointer ], :pointer
  attach_function :mecab_model_transition_cost, :mecab_model_transition_cost, [ :pointer, :ushort, :ushort ], :int
  attach_function :mecab_model_lookup, :mecab_model_lookup, [ :pointer, :string, :string, :pointer ], MecabNodeT.ptr
  attach_function :mecab_do, :mecab_do, [ :int, :pointer ], :int
  attach_function :mecab_dict_index, :mecab_dict_index, [ :int, :pointer ], :int
  attach_function :mecab_dict_gen, :mecab_dict_gen, [ :int, :pointer ], :int
  attach_function :mecab_cost_train, :mecab_cost_train, [ :int, :pointer ], :int
  attach_function :mecab_system_eval, :mecab_system_eval, [ :int, :pointer ], :int
  attach_function :mecab_test_gen, :mecab_test_gen, [ :int, :pointer ], :int

end
