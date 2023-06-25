if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    ls
end

set -gx BROWSER qutebrowser
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx BWP_COMMAND "feh --no-fehbg --bg-fill"
set -gx BWP_DIR "$HOME/pix/wallpapers"
set -gx GEM_HOME "$XDG_DATA_HOME"/gem
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx GOPATH "$HOME/.local/go"
set -gx SDL_HOME "$HOME/.sdl/SDL2-2.0.12"
set -gx LD_LIBRARY_PATH "/opt/libxfce4ui-nocsd/lib:$LD_LIBRARY_PATH"
set -gx BWP_LOCK_IMAGE_OPTIONS "-resize 2560x1080!"
set -gx CM_HISTLENGTH 20
set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk/jre/
set -gx BWP_GEOMETRY "2560x1080"

thefuck --alias | source

alias spotifyd='spotifyd -u 21ndnpvlkdukezg7ht2mkcyay -P "pass spotify" -d "Jorjes Computer" --on-song-change-hook "album-art"' 
