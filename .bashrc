export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"

source <(helm completion bash)
source <(tkn completion bash)
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

git_prompt() {
    local format_string="$1"
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi
    [ -n "${branch}" ] && printf "$format_string" "$branch"
}

condaenv_prompt() {
    local format_string="$1"
    local cenv="${CONDA_DEFAULT_ENV##*/}"
    [ -n "${cenv}" ] && printf "$format_string" "$cenv"
}

update_prompt() {
    PS1='$(condaenv_prompt "|\[\033[01;32m\]%s\[\033[00m\]")'
    PS1+='$(git_prompt "|\[\033[01;33m\]%s\[\033[00m\]")'
    PS1+="|\A \W "
    PS1+="$(kube_ps1) \n"
    # PS1+="\[\033[31m\]➜  \[\033[0m\]"
}
source ~/.config/kube-ps1.sh
PROMPT_COMMAND="update_prompt; $PROMPT_COMMAND"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vscode/.conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vscode/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/vscode/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/vscode/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

