#!/bin/bash

brew install chruby
brew install ruby-install
# chruby-exec-all gem install git-up pry pry-nav wirble bond CoffeeTags

# install rubies
# ruby-1.9.3 requires gcc 4.4-4.8 on Mavericks
ruby-install ruby 1.9.3 -- CC=gcc-4.6 --prefix="$HOME/.rubies/ruby-1.9.3-p545" --with-opt-dir="$(brew --prefix openssl):$(brew --prefix readline):$(brew --prefix libyaml):$(brew --prefix gdbm):$(brew --prefix libffi)"

# ruby 2.1.2
brew tap raggi/ale
brew install openssl-osx-ca
ruby-install ruby 2.1.2 -- CC=gcc-4.6 --prefix="$HOME/.rubies/ruby-2.1.2" --with-opt-dir="$(brew --prefix openssl):$(brew --prefix readline):$(brew --prefix libyaml):$(brew --prefix gdbm):$(brew --prefix libffi)"
