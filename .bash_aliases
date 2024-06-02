alias ssha='eval $(ssh-agent -s) && ssh-add ~/.ssh/project-template'

alias dps='docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Ports}}"'

alias k="kubectl"
alias kns="kubens"
alias kctx="kubectx"

alias lslinode="curl -s https://api.linode.com/v4/linode/types | jq '.data[] | {id: .id, label: .label, memory: .memory, disk: .disk, price_hourly: .price.hourly, price_monthly: .price.monthly}'"

alias tls='tmux ls'
alias ta='tmux attach -t'
alias trn='tmux rename-session -t'

alias vim-be-good='docker run -it --rm brandoncc/vim-be-good:latest'

 #################################
 #  _ S E C O N D _ B R A I N _  #
 #################################

alias sb='cd ~/second_brain/'
alias sb0='cd ~/second_brain/0_inbox/'
alias sb1='cd ~/second_brain/1_Projects/'
alias sb2='cd ~/second_brain/2_Areas/'
alias sb3='cd ~/second_brain/3_Resources/'
alias sb4='cd ~/second_brain/4_Archive/'
