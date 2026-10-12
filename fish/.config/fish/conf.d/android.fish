# Android SDK — emulator + platform-tools live in $HOME/Android/Sdk, not /opt/android-sdk
set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"
fish_add_path "$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools"

# 模拟器自带的 Qt 只有 xcb 插件，没有 wayland 插件；
# niri 里设了全局 QT_QPA_PLATFORM=wayland，会让模拟器在创建窗口前直接 abort。
function emulator --wraps emulator --description 'Android emulator (forces Qt xcb platform)'
    env QT_QPA_PLATFORM=xcb "$ANDROID_HOME/emulator/emulator" $argv
end
