which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew already installed"
fi

# install all brew packages
brew bundle

# apple settings
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
# fix scroll direction
defaults write -g com.apple.swipescrolldirection -bool NO
# enable key repeat
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
# shrink dock and auto hide
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 32; killall Dock
# update settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# install zap
firefox https://github.com/zap-zsh/zap?tab=readme-ov-file#install

git clone https://github.com/mikker/wezterm-icon.git
cd wezterm-icon
make install
cd ..

