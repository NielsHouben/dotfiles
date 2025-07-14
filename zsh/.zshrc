# === Basics ===
export EDITOR=nvim
export VISUAL=nvim
autoload -Uz compinit promptinit vcs_info
compinit
promptinit

# Path
export PATH="$HOME/scripts:$PATH"

# === Vi mode ===
bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# === Completion menu with Vim keys ===
zstyle ':completion:*' menu select
bindkey '^I' expand-or-complete

# === History ===
# Ensure history directory exists to avoid locking errors
history_dir="${HOME}/.cache/zsh"
if [[ ! -d "$history_dir" ]]; then
  mkdir -p "$history_dir"
fi

# History settings
HISTFILE="${history_dir}/history"
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_all_dups

# === Options ===
setopt no_beep # beep
setopt auto_cd
setopt correct
setopt interactive_comments
setopt extended_glob

# Bell
# autoload -Uz add-zsh-hook
#
# function beep_on_error() {
#   local last_status=$?
#   if (( last_status != 0 )); then
#     print -n "\a"
#   fi
# }

# add-zsh-hook precmd beep_on_error

# Only source nvm if it exists
[ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# === aliases, shortcuts, and theme ===
[ -f ~/.config/.zsh/.zshtheme ] && source ~/.config/.zsh/.zshtheme
[ -f ~/.config/.zsh/.aliasrc ] && source ~/.config/.zsh/.aliasrc 
[ -f ~/.config/.zsh/.shortcutrc ] && source ~/.config/.zsh/.shortcutrc 

# === Plugins ===
ZSH_PLUGIN_DIR="$HOME/.local/share/zsh/plugins"

for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  plugin_file="$ZSH_PLUGIN_DIR/$plugin/${plugin}.zsh"
  [[ -f "$plugin_file" ]] && source "$plugin_file"
done

