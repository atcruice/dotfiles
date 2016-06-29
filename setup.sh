#!/usr/bin/env bash
# unofficial bash strict mode
set -euo pipefail
IFS=$'\n\t'

# security precaution
export PATH=/usr/bin:$PATH

inform() {
  echo -e "\033[1m\033[33m==>\033[0m $*"
}

setup_ssh() {
  inform 'Generating SSH passphrase and storing in Mac OS X Keychain'
  local passphrase="$(openssl rand -base64 21)"
  local account_name="$(id -un)"
  security add-generic-password -a "$account_name" -s ssh-passphrase -w "$passphrase"

  inform 'Copying passphrase to clipboard'
  echo "$passphrase" | pbcopy

  inform "Generating new SSH key for 'alex.cruice@gmail.com' (accept default location, use passphrase in clipboard)"
  ssh-keygen -t rsa -C "alex.cruice@gmail.com"

  inform 'Starting ssh-agent'
  eval "$(ssh-agent -s)"

  inform 'Adding new key'
  ssh-add ~/.ssh/id_rsa

  inform 'Copying new key to clipboard, manually add to GitHub'
  pbcopy < ~/.ssh/id_rsa.pub
  open https://github.com/settings/ssh
  ssh -T git@github.com
}

inform 'Setting up SSH'
setup_ssh

inform 'Installing fresh (will git-clone dotfiles, may prompt to install command line dev tools)'
FRESH_LOCAL_SOURCE=alexcruice/dotfiles bash <(curl -L get.freshshell.com)

inform 'Installing Homebrew'
ruby -e "$(curl -L https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

inform 'Installing Homebrew Cask'
brew install caskroom/cask/brew-cask

inform 'Brewing...'
inform 'Installing ack'
brew install ack
inform 'Installing bash-completion'
brew install bash-completion
inform 'Installing chromedriver'
brew install chromedriver
inform 'Installing cloudfoundry-cli'
brew tap pivotal/tap
brew install cloudfoundry-cli
inform 'Installing universal-ctags'
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
inform 'Installing direnv'
brew install direnv
inform 'Installing git'
brew install git
inform 'Installing openssl-osx-ca (required by some rubies)'
brew tap raggi/ale
brew install openssl-osx-ca
inform 'Installing git'
brew install git
inform 'Installing git-flow'
brew install git-flow
inform 'Installing imagemagick'
brew install imagemagick
inform 'Installing XQuartz'
brew cask install xquartz
inform 'Installing mit-scheme'
brew install mit-scheme
inform 'Installing ntfs-3g'
brew install ntfs-3g
inform 'Installing phantomjs 1.9.8'
brew install phantomjs198
inform 'Installing shellcheck'
brew install shellcheck
inform 'Installing socat'
brew install socat
inform 'Installing tidy'
brew tap homebrew/dupes
brew install tidy
inform 'Installing vim'
brew install vim --override-system-vi
inform 'Installing reattach-to-user-namespace'
brew install reattach-to-user-namespace
inform 'Installing wemux'
brew install wemux
inform 'Installing wget'
brew install wget
inform 'Installing sassc'
brew install sassc
inform 'Installing heroku'
brew install heroku
heroku login
heroku keys:add
inform 'Installing ncdu'
brew install ncdu

inform 'Installing Dropbox'
brew cask install dropbox
open /Applications/Dropbox.app
inform 'Installing 1Password'
brew cask install 1password
open /Applications/1Password\ 4.app
inform 'Installing Inkscape'
brew cask install inkscape
inform 'Installing Adobe Reader'
brew cask install adobe-reader
inform 'Installing Alfred'
brew cask install alfred
open /Applications/Alfred\ Preferences.app
brew cask alfread link
inform 'Installing Alinof Timer'
brew cask install alinof-timer
inform 'Installing Cyberduck'
brew cask install cyberduck
inform 'Installing Dash'
brew cask install dash
inform 'Installing Deeper'
brew cask install deeper
inform 'Installing Divvy'
brew cask install divvy
inform 'Installing Firefox'
brew cask install firefox
inform 'Installing Flash'
brew cask install flash
inform 'Installing GIMP'
brew cask install gimp
inform 'Installing Chrome'
brew cask install google-chrome
inform 'Installing Hex Fiend'
brew cask install hex-fiend
inform 'Installing iTerm2'
brew cask install iterm2
inform 'Installing Karabiner'
brew cask install karabiner
open /Applications/Karabiner.app
inform 'Installing Logisim'
brew cask install logisim
inform 'Installing Maintenance'
brew cask install maintenance
inform 'Installing Mixxx'
brew cask install mixxx
inform 'Installing Monolingual'
brew cask install monolingual
inform 'Installing Onyx'
brew cask install onyx
inform 'Installing Skitch'
brew cask install skitch
inform 'Installing Skype'
brew cask install skype
inform 'Installing Slack'
brew cask install slack-beta
inform 'Installing smcFanControl'
brew cask install smcfancontrol
inform 'Installing TextWrangler'
brew cask install textwrangler
inform 'Installing TinkerTool'
brew cask install tinkertool
inform 'Installing Transmission'
brew cask install transmission
inform 'Installing VirtualBox'
brew cask install virtualbox
inform 'Installing VLC'
brew cask install vlc
inform 'Installing Budget'
brew cask install budget
inform 'Installing Ubuntu fonts'
brew cask tap caskroom/fonts
brew cask install font-ubuntu-mono-powerline
inform 'Installing Vundle'
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +PluginClean! +qall
inform 'Installing FunctionFlip'
brew cask install functionflip
inform 'Installing Spotify'
brew cask install spotify
inform 'Installing Oracle JDK'
brew cask install java
inform 'Installing QuickTime 7'
brew cask install quicktime-player7
inform 'Installing Videobox'
brew cask install videobox
inform 'Installing Bittorrent Sync'
brew cask install bittorrent-sync
inform 'Installing f.lux'
brew cask install flux


inform 'Installing chruby'
brew install chruby
inform 'Installing ruby-install'
brew install ruby-install
inform 'Installing Ruby 1.9.3'
ruby-install ruby 1.9.3
inform 'Installing Ruby 2.0.0'
ruby-install ruby 2.0.0
inform 'Installing Ruby 2.1.2'
ruby-install ruby 2.1.2
inform 'Installing Ruby 2.1.3'
ruby-install ruby 2.1.3
inform 'Installing Ruby 2.1.4'
ruby-install ruby 2.1.4

inform 'Installing PostgreSQL'
brew install postgres
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

inform 'Installing useful gems across all rubies'
inform 'Installing bundler'
chruby-exec-all gem install bundler
inform 'Installing rubocop'
chruby-exec-all gem install rubocop
inform 'Installing git-up'
chruby-exec-all gem install git-up
inform 'Installing awesome_print'
chruby-exec-all gem install awesome_print
inform 'Installing pry'
chruby-exec-all gem install pry
inform 'Installing pry-nav'
chruby-exec-all gem install pry-nav
inform 'Installing wirble'
chruby-exec-all gem install wirble
inform 'Installing bond'
chruby-exec-all gem install bond
inform 'Installing CoffeeTags'
chruby-exec-all gem install CoffeeTags
inform 'Installing haml-lint'
chruby-exec-all gem install haml-lint
