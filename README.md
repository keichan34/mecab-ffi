# mecab_ffi

[![Build Status](https://travis-ci.org/keichan34/mecab_ffi.svg?branch=master)](https://travis-ci.org/keichan34/mecab_ffi)

[Ruby FFI](https://github.com/ffi/ffi) bindings to [MeCab](https://code.google.com/p/mecab/).

Aimed to be less prone to segfaults and other errors, and we get the big plus of not having a compile step.

See: [Why use FFI](https://github.com/ffi/ffi/wiki/why-use-ffi).

## Installation

Add this line to your application's Gemfile:

    gem 'mecab_ffi', require: 'me_cab'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mecab_ffi

## Install errors?

Although `mecab_ffi` doesn't have any C code inside of it, the `ffi` gem that it uses does, which requires `libffi` to be installed.

### Mac OS X / Homebrew

Depending on your setup, you may or may not have to execute the following:

```
$ brew update
$ brew install libffi
# If you still get errors:
$ brew link libffi --force
```

## Contributing

1. Fork it ( https://github.com/keichan34/mecab_ffi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
