export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Setup up Plugins

plugins = (
    fzf
    git
    zsh-autosuggestions
    golang
    kubectl
    helm
    ansible
)

source $ZSH/oh-my-zsh.sh

# ALIAS Setups 

alias zshconfig="nvim ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias "python"="python3"


_path_addition_funcs() {

  path_additions=()

  for new_path in "${path_additions[@]}"; do
    if [[ ":$PATH:" != *":$new_path:"* ]]; then
       PATH="$new_path:$PATH"
    fi 
  done

  typeset -U PATH path
  export PATH

}

_path_addition_funcs


