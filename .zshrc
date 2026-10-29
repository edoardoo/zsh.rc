# zsh config — oh-my-zsh

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="idisagree"

# Skip compaudit check (custom completion dirs)
ZSH_DISABLE_COMPFIX=true

# Don't overwrite terminal title
DISABLE_AUTO_TITLE="true"

# Plugins (available in $ZSH/plugins)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# --- Java ---
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# --- conda ---
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --- node (nvm, single load) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- pnpm ---
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- local tools ---
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$HOME/.lmstudio/bin:$PATH"

# --- gcloud (still in ~/Downloads — consider moving it out) ---
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

# --- aliases ---
alias openscad=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
alias bumbum="ssh edo@bumbum.local"
alias phone="ssh edo@phone.local"
alias createProject="~/Gits/createProject.sh"
alias proton="cd $HOME/Library/CloudStorage/ProtonDrive-EDOARDOO@proton.me-folder/"
