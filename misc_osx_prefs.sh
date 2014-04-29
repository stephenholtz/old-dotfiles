# To fix the R 'app nap' problem
defaults write org.R-project.R NSAppSleepDisabled -bool YES

# To fix hidden files showing
defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder

# Make dock appear instantly (not sure if this works...)
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Enable copy from quickview!
defaults write com.apple.finder QLEnableTextSelection -bool TRUE && killall Finder

# Disable startup music
sudo nvram SystemAudioVolume=%80
