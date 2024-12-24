#!/bin/bash

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'export PATH="$PATH:/opt/homebrew/bin"' >> ~/.zshrc
source ~/.zshrc

softwareupdate --install-rosetta --agree-to-license

# キーボードの反応速度の修正(PC再起動後に有効化される)
defaults write -g InitialKeyRepeat -int 11
defaults write -g KeyRepeat -int 1

# 普段利用するアプリ
brew install --cask google-chrome
brew install --cask zoom
brew install --cask 1password # パスワード管理ツール
brew install --cask bettertouchtool # トラックパッドの操作を便利にするやつ
brew install --cask appcleaner # アプリアンインストールに必要
brew install --cask onyx # PCデフラグしてくれるやつ
brew install --cask raycast # Alfredから乗り換え(ランチャーツール)
brew install --cask cmd-eikana # cmdで入力ソースを切り替えるためのアプリ
brew install --cask slack
brew install mas # App StoreのアプリをCLIで管理できる
mas install 539883307 # LINEをインストール
mas install 462058435 # Microsoft Excelをインストール
mas install 417375580 # BetterSnapToolをインストール

# JSのツール系
brew install node
brew install nvm
mkdir ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion' >> ~/.zshrc
source ~/.zshrc
nvm install --lts

# 開発ツール系
brew install --cask docker
brew install --cask warp # 勝手に補完入力される便利ターミナル
brew install --cask ngrok # ローカルURLをhttps化させるやつ
brew install --cask fork # git操作のGUIクライアント(SourceTreeみたいなもの)
brew install firebase-cli
brew install git
brew install awscli
brew install yarn # パッケージインストール用(npmでいい人は不要)
brew install openapi-generator # スキーマ生成で用いる
brew install mysql　# ローカルでmysql2入れるのに必要(ruby-lsp動かすのに必要だった)

# ruby周辺
brew install rbenv ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc 
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc
echo 'export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/' >> ~/.zshrc
source ~/.zshrc

# YJITを有効化するためのrubyインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH="$HOME/.cargo/bin:$PATH"
RUBY_CONFIGURE_OPTS="--enable-yjit" rbenv install 3.3.6 # その時の最新を設定する
rbenv global 3.3.6
rbenv rehash

# エディタ系
brew install visual-studio-code
brew install --cask rubymine # IntelliJのRuby用IDE
brew install --cask cursor # AI搭載付きVSCodeみたいなもん
brew install android-studio
brew install --cask xcodes # XCodeは今後ここからインストールするのが良さそう

# Flutter周辺
brew tap leoafarias/fvm
brew install fvm
echo 'alias flutter="fvm flutter"' >> ~/.zshrc
source ~/.zshrc
fvm global 3.24.5 # その時の最新を設定する
echo 'export PATH="$PATH:$HOME/fvm/default/bin"' >> ~/.zshrc
fvm install stable
fvm global
fvm flutter doctor --android-licenses
brew install cocoapods

# githubに接続するためのsshキーの作成(生成後にコピーしてgithubに設定)
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa
chmod 400 ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa.pub
ssh-add ~/.ssh/id_rsa
touch ~/.ssh/config
chmod 600 ~/.ssh/config
echo "Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa
  User git
  Port 22" >> ~/.ssh/config
cd ../

# gitに署名コミットをするための記述(生成後にコピーしてgithubに設定)
# ref: https://zenn.dev/yumemi_inc/articles/signed-commit
brew install gpg
gpg --full-generate-key

# LaunchPadのソート
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
