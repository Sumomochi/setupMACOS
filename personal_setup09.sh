# Disable “natural” (Lion-style) scrolling
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Remove all apps from the Dock & the Desktop Background
defaults write com.apple.dock persistent-apps -array
# Automatically hide and show the Dock
#defaults write com.apple.dock autohide -bool true
# Restart Dock
killAll Dock

# Keep selected apps in Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Notes.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Discord.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Atom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Managed Software Center.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
killall Dock

# Add bluetooth icon to menu bar
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"
killAll SystemUIServer

# Add <username> to Finder Favorites sidebar
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
if [ -e /usr/bin/sfltool ]
then
	/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser && sleep 2
	touch /Users/$loggedInUser/.sidebarshortcuts
fi
# Show Path Bar in Finder
/usr/bin/defaults write com.apple.finder ShowPathbar -bool true;
# New Finder window now opens in /Users/<username>
/usr/bin/defaults write com.apple.finder NewWindowTarget -string "PfHm"
# Restart Finder
killAll Finder

# Change desktop background
#osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/mbui/Downloads/plants.jpg"'

# Set volume to 0
osascript -e 'set volume output volume 0'

# Open and set Firefox as the default browser
open -a "Firefox" --args --make-default-browser

# Open intra.42 & extensions on Firefox
open -a 'Firefox' https://profile.intra.42.fr/
#open -a 'Firefox' https://addons.mozilla.org/nl/firefox/addon/ublock-origin/ 
#open -a 'Firefox' https://addons.mozilla.org/nl/firefox/addon/cookie-autodelete/ 
#open -a 'Google Chrome' https://chrome.google.com/webstore/detail/42logtime/fkcfecmfcfmealjioddcpgghpmdgbeag?hl=en
#open -a 'Google Chrome' https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en 
# Open Slack
open -a 'Slack'

# Add lock screen icon to menu bar
open /Applications/Utilities/Keychain\ Access.app/Contents/Resources/Keychain.menu
